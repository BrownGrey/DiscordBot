require('dotenv').config();
const fs = require('fs');
const Discord = require('discord.js');
const { prefix, token } = require('./config.json');
const { errorResponse } = require('./util');

const client = new Discord.Client();
const cooldowns = new Discord.Collection();

client.commands = new Discord.Collection();


const commandFiles = fs.readdirSync('./commands').filter(file => file.endsWith('.js'));
commandFiles.forEach(file => {
	const command = require(`./commands/${file}`);
	client.commands.set(command.name, command);
});

client.on('ready', () => console.info(`Logged in as ${client.user.tag} 🚀`));

client.on('message', message => {
	// when no prefix or bot command
	if (!message.content.startsWith(prefix) || message.author.bot) return;

	// arguments and command
	const args = message.content.slice(prefix.length).trim().split(' ');
	const commandName = args.shift().toLowerCase();

	// If command is not a avilabe exit immediately
	if(!client.commands.has(commandName)) return;

	const command = client.commands.get(commandName);

	if (command.args && !args.length) {
		let reply = `You didn't provide any arguments, ${message.author}!\n`;

		if (command.usage) {
			reply += `\nThe proper usage would be: \`${prefix}${command.name} ${command.usage}\``;
		}

		return message.reply(reply);
	}

	// Spam restriction / cooldown time management (5s)
	if (!cooldowns.has(command.name)) {
		cooldowns.set(command.name, new Discord.Collection());
	}

	const now = Date.now();
	const timestamps = cooldowns.get(command.name);
	const cooldownAmount = (command.cooldown || 3) * 1000;

	if (timestamps.has(message.author.id)) {
		const expirationTime = timestamps.get(message.author.id) + cooldownAmount;

		if (now < expirationTime) {
			const timeLeft = (expirationTime - now) / 1000;
			return message.channel.send(errorResponse(`Please wait ${timeLeft.toFixed(1)} more second(s) before reusing the \`${command.name}\` command`));
		}
	}
	timestamps.set(message.author.id, now);
	setTimeout(() => timestamps.delete(message.author.id), cooldownAmount);

	// Command execution happens here
	try {
		command.execute(message, args);
	}
	catch (error) {
		console.error(error);
		message.reply(errorResponse('there was an error trying to execute that command!'));
	}
});

client.login(process.env.BOT_TOKEN || token);
