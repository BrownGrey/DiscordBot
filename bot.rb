#!/usr/bin/env ruby

require 'bundler/setup'
require 'discordrb'
require 'sqlite3'
require 'yajl'
require 'fileutils'
require_relative('classes.rb')
require_relative('serverdb.rb')

# This is the main bot Module
module BruhBot
  class << self
    attr_accessor :conf
    attr_accessor :api
    attr_accessor :bot
    attr_accessor :server
  end

  $LOAD_PATH << File.join(File.dirname(__FILE__))

  self.conf = Yajl::Parser.parse(File.new('config.json', 'r'))
  self.api = Yajl::Parser.parse(File.new('apikeys.json', 'r'))
  self.bot = Discordrb::Commands::CommandBot.new(
    token: api['discord_token'],
    client_id: api['discord_app_id'],
    prefix: conf['prefix']
  )

  FileUtils.mkpath 'avatars' unless File.exist?('avatars')
  FileUtils.mkpath 'images/spoiler' unless File.exist?('images/spoiler')

  Dir['plugins/*/*.rb'].each do |file|
    require file unless file == 'plugins/twitch/twitch.rb'
  end

  Plugins.constants.each do |mod|
    bot.include! Plugins.const_get mod
  end

  Yajl::Encoder.encode(
    conf, [File.new('config.json', 'w'), { pretty: true, indent: '\t' }]
  )

# Configure a database for each connected server.
  bot.ready do |event|
    event.bot.servers.keys.each do |s|
      manageMusic(s)
      dbSetup(s)
      event.bot.server(s).members.each do |m|
        db = SQLite3::Database.new "db/#{s}.db"
        db.execute('INSERT OR IGNORE INTO currency (userid, amount) '\
                   'VALUES (?, ?)', m.id, 100)
        db.execute('INSERT OR IGNORE INTO levels (userid, level, xp) '\
                   'VALUES (?, ?, ?)', m.id, 1, 0)
        db.close if db
      end
      BruhBot.bot.send_message(s, 'I\'m here and ready for commands!')
      db = SQLite3::Database.new "db/#{s}.db"
      pollstarted = ''
      begin
        pollstarted = db.execute('SELECT started FROM poll WHERE id=1')[0][0].to_i
        db.close if db
      rescue NoMethodError
        db.close if db
        next
      end
      pollLoop(s)
    end
    # Here we output the invite URL to the console so the bot account can be
    # invited to the channel.
    puts "This bot's invite URL is #{bot.invite_url}&permissions=261120"
    puts 'Click on it to invite it to your server.'
  end

  bot.server_create do |event|
    joinedServer = event.server.id
    manageMusic(joinedServer)
    dbSetup(joinedServer)
    event.bot.server(event.server.id).members.each do |m|
      db = SQLite3::Database.new "db/#{joinedServer}.db"
      db.execute('INSERT OR IGNORE INTO currency (userid, amount) '\
                 'VALUES (?, ?)', m.id, 100)
      db.execute('INSERT OR IGNORE INTO levels (userid, level, xp) '\
                 'VALUES (?, ?, ?)', m.id, 1, 0)
      db.close if db
    end
  end

  bot.run
end
