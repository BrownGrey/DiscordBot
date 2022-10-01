const { prefix } = require('../config.json');
const { errorResponse } = require('../util');

module.exports = {
	name: 'help',
	cooldown: 5,
	description: 'List all of my commands or info about a specific command.',
	usage: '[command name]',
	execute(message, args) {
		const data = [];
		const { commands } = message.client;

		if (!args.length) {
			data.push('Here\'s a list of all my commands:\n');
			data.push(commands.map(command => `\`${command.name}\``).join(', '));
			data.push(`\nYou can write \`${prefix}help [command name]\` to get info on a specific command!`);

			return message.channel.send(data, { split: true });
		}

		const name = args[0].toLowerCase();
		const command = commands.get(name);

		if (!command) {
			return message.reply(errorResponse('That\'s not a valid command!'));
		}

		data.push(`**Name:** ${command.name}`);

		if (command.aliases) data.push(`**Aliases:** ${command.aliases.join(', ')}`);
		if (command.description) data.push(`**Description:** ${command.description}`);
		if (command.usage) data.push(`**Usage:** ${prefix}${command.name} ${command.usage}`);

		data.push(`**Cooldown:** ${command.cooldown || 3} second(s)`);

		message.channel.send(data, { split: true });
	},
};