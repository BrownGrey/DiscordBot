module Roles
  class << self
    attr_accessor :eightball_roles
    attr_accessor :bot_avatar_roles
    attr_accessor :update_roles
    attr_accessor :restart_roles
    attr_accessor :shutdown_roles
    attr_accessor :nick_user_roles
    attr_accessor :game_roles
    attr_accessor :clear_roles
    attr_accessor :roles_roles
    attr_accessor :avatar_roles
    attr_accessor :avatar_server_roles
    attr_accessor :band_roles
    attr_accessor :band_add_roles
    attr_accessor :band_remove_roles
    attr_accessor :choose_roles
    attr_accessor :money_roles
    attr_accessor :money_give_roles
    attr_accessor :money_add_roles
    attr_accessor :roll_roles
    attr_accessor :roll_mod_roles
    attr_accessor :roll_fudge_roles
    attr_accessor :coin_roles
    attr_accessor :emojicode_roles
    attr_accessor :short_roles
    attr_accessor :level_roles
    attr_accessor :level_user_roles
    attr_accessor :lotto_start_roles
    attr_accessor :lotto_enter_roles
    attr_accessor :lotto_end_roles
    attr_accessor :lotto_kill_roles
    attr_accessor :anime_roles
    attr_accessor :manga_roles
    attr_accessor :paste_roles
    attr_accessor :perm_roles
    attr_accessor :perm_list_roles
    attr_accessor :perm_add_roles
    attr_accessor :perm_remove_roles
    attr_accessor :play_roles
    attr_accessor :quote_roles
    attr_accessor :quote_add_roles
    attr_accessor :quote_remove_roles
    attr_accessor :rate_roles
    attr_accessor :react_roles
    attr_accessor :rps_roles
    attr_accessor :say_roles
    attr_accessor :say_channel_roles
    attr_accessor :wiki_roles
    attr_accessor :xl_roles
    attr_accessor :xl_nick_roles
    attr_accessor :youtube_roles
  end

  db = SQLite3::Database.new 'db/general.db'

# 8ball ########################################################################
  eightball_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', '8ball'
  )[0][0]
  self.eightball_roles = eightball_string.split(',').map(&:to_i) unless eightball_string.nil?

# Admin ########################################################################
  bot_avatar_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'bot.avatar'
  )[0][0]
  self.bot_avatar_roles = bot_avatar_string.split(',').map(&:to_i) unless bot_avatar_string.nil?

  update_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'update'
  )[0][0]
  self.update_roles = update_string.split(',').map(&:to_i) unless update_string.nil?

  restart_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'restart'
  )[0][0]
  self.restart_roles = restart_string.split(',').map(&:to_i) unless restart_string.nil?

  shutdown_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'shutdown'
  )[0][0]
  self.shutdown_roles = shutdown_string.split(',').map(&:to_i) unless shutdown_string.nil?

  nick_user_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'nick.user'
  )[0][0]
  self.nick_user_roles = nick_user_string.split(',').map(&:to_i) unless nick_user_string.nil?

  game_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'game'
  )[0][0]
  self.game_roles = game_string.split(',').map(&:to_i) unless game_string.nil?

  clear_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'clear'
  )[0][0]
  self.clear_roles = clear_string.split(',').map(&:to_i) unless clear_string.nil?

  roles_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'roles'
  )[0][0]
  self.roles_roles = roles_string.split(',').map(&:to_i) unless roles_string.nil?

# Avatar Fetch #################################################################
  avatar_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'avatar'
  )[0][0]
  self.avatar_roles = avatar_string.split(',').map(&:to_i) unless avatar_string.nil?

  avatar_server_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'avatar.server'
    )[0][0]
  self.avatar_server_roles = avatar_server_string.split(',').map(&:to_i) unless avatar_server_string.nil?

# Band Names ###################################################################
  band_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'band'
  )[0][0]
  self.band_roles = band_string.split(',').map(&:to_i) unless band_string.nil?

  band_add_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'band.add'
  )[0][0]
  self.band_add_roles = band_add_string.split(',').map(&:to_i) unless band_add_string.nil?

  band_remove_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'band.remove'
  )[0][0]
  self.band_remove_roles = band_remove_string.split(',').map(&:to_i) unless band_remove_string.nil?

# Choose #######################################################################
  choose_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'choose'
  )[0][0]
  self.choose_roles = choose_string.split(',').map(&:to_i) unless choose_string.nil?

# Currency #####################################################################
  money_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'money'
  )[0][0]
  self.money_roles = money_string.split(',').map(&:to_i) unless money_string.nil?

  money_give_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'money.give'
  )[0][0]
  self.money_give_roles = money_give_string.split(',').map(&:to_i) unless money_give_string.nil?

  money_add_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'money.add'
  )[0][0]
  self.money_add_roles = money_add_string.split(',').map(&:to_i) unless money_add_string.nil?

# Diceroller ###################################################################
  roll_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'roll'
  )[0][0]
  self.roll_roles = roll_string.split(',').map(&:to_i) unless roll_string.nil?

  roll_mod_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'roll.mod'
  )[0][0]
  self.roll_mod_roles = roll_mod_string.split(',').map(&:to_i) unless roll_mod_string.nil?

  roll_fudge_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'roll.fudge'
  )[0][0]
  self.roll_fudge_roles = roll_fudge_string.split(',').map(&:to_i) unless roll_fudge_string.nil?

  coin_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'coin'
  )[0][0]
  self.coin_roles = coin_string.split(',').map(&:to_i) unless coin_string.nil?

# Emojicode ####################################################################
  emojicode_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'emojicode'
  )[0][0]
  self.emojicode_roles = emojicode_string.split(',').map(&:to_i) unless emojicode_string.nil?

# Googl URL Shortener ##########################################################
  short_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'short'
  )[0][0]
  self.short_roles = short_string.split(',').map(&:to_i) unless short_string.nil?

# Levels #######################################################################
  level_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'level'
  )[0][0]
  self.level_roles = level_string.split(',').map(&:to_i) unless level_string.nil?

  level_user_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'level.user'
  )[0][0]
  self.level_user_roles = level_user_string.split(',').map(&:to_i) unless level_user_string.nil?

# Lotto ########################################################################
  lotto_start_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'lotto.start'
  )[0][0]
  self.lotto_start_roles = lotto_start_string.split(',').map(&:to_i) unless lotto_start_string.nil?

  lotto_enter_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'lotto.enter'
  )[0][0]
  self.lotto_enter_roles = lotto_enter_string.split(',').map(&:to_i) unless lotto_enter_string.nil?

  lotto_end_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'lotto.end'
  )[0][0]
  self.lotto_end_roles = lotto_end_string.split(',').map(&:to_i) unless lotto_end_string.nil?

  lotto_kill_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'lotto.kill'
  )[0][0]
  self.lotto_kill_roles = lotto_kill_string.split(',').map(&:to_i) unless lotto_kill_string.nil?

# Myanimelist ##################################################################
  anime_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'anime'
  )[0][0]
  self.anime_roles = anime_string.split(',').map(&:to_i) unless anime_string.nil?

  manga_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'manga'
  )[0][0]
  self.manga_roles = manga_string.split(',').map(&:to_i) unless manga_string.nil?

# Pastebin #####################################################################
  paste_string = db.execute(
  'SELECT roles FROM perms WHERE command = ?', 'paste'
  )[0][0]
  self.paste_roles = paste_string.split(',').map(&:to_i) unless paste_string.nil?

# Permissions ##################################################################
  perm_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'perm'
  )[0][0]
  self.perm_roles = perm_string.split(',').map(&:to_i) unless perm_string.nil?

  perm_list_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'perm.list'
  )[0][0]
  self.perm_list_roles = perm_list_string.split(',').map(&:to_i) unless perm_list_string.nil?

  perm_add_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'perm.add'
  )[0][0]
  self.perm_add_roles = perm_add_string.split(',').map(&:to_i) unless perm_add_string.nil?

  perm_remove_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'perm.remove'
  )[0][0]
  self.perm_remove_roles = perm_remove_string.split(',').map(&:to_i) unless perm_remove_string.nil?

# Play #########################################################################
  play_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'play'
  )[0][0]
  self.play_roles = play_string.split(',').map(&:to_i) unless play_string.nil?

# Quotes #######################################################################
  quote_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'quote'
  )[0][0]
  self.quote_roles = quote_string.split(',').map(&:to_i) unless quote_string.nil?

  quote_add_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'quote.add'
  )[0][0]
  self.quote_add_roles = quote_add_string.split(',').map(&:to_i) unless quote_add_string.nil?

  quote_remove_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'quote.remove'
  )[0][0]
  self.quote_remove_roles = quote_remove_string.split(',').map(&:to_i) unless quote_remove_string.nil?

# Rate #########################################################################
  rate_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'rate'
  )[0][0]
  self.rate_roles = rate_string.split(',').map(&:to_i) unless rate_string.nil?

# React ########################################################################
  react_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'react'
  )[0][0]
  self.react_roles = react_string.split(',').map(&:to_i) unless react_string.nil?

# RPS ##########################################################################
  rps_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'rps'
  )[0][0]
  self.rps_roles = rps_string.split(',').map(&:to_i) unless rps_string.nil?

# Say ##########################################################################
  say_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'say'
  )[0][0]
  self.say_roles = say_string.split(',').map(&:to_i) unless say_string.nil?

  say_channel_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'say.channel'
  )[0][0]
  self.say_channel_roles = say_channel_string.split(',').map(&:to_i) unless say_channel_string.nil?

# Wikipedia ####################################################################
  wiki_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'wiki'
  )[0][0]
  self.wiki_roles = wiki_string.split(',').map(&:to_i) unless wiki_string.nil?

# Xl ###########################################################################
  xl_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'xl'
  )[0][0]
  self.xl_roles = xl_string.split(',').map(&:to_i) unless xl_string.nil?

  xl_nick_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'xl.nick'
  )[0][0]
  self.xl_nick_roles = xl_nick_string.split(',').map(&:to_i) unless xl_nick_string.nil?

# Youtube ######################################################################
  youtube_string = db.execute(
    'SELECT roles FROM perms WHERE command = ?', 'youtube'
  )[0][0]
  self.youtube_roles = youtube_string.split(',').map(&:to_i) unless youtube_string.nil?

  db.close if db
end
