const Discord = require('discord.js');


module.exports.formatResponse = ({ quote, character, anime }) => {
	quote = quote.replace(/\\|\//g, '');
	// inside a command, event listener, etc.
	const quoteEmbed = new Discord.MessageEmbed()
		.setColor('#73fa69')
		.setDescription(`***${quote}***`)
		.addFields(
			{ name: '\u200B', value: '\u200B' },
			{ name: 'character', value: character, inline: true },
			{ name: 'Anime', value: anime, inline: true },
		)
		.setTimestamp()
		.setFooter('Animechan API', 'https://i.imgur.com/JHDHn3N.png');

	return quoteEmbed;
};

module.exports.errorResponse = string => {
	const errorEmbed = new Discord.MessageEmbed()
		.setColor('#ff614d')
		.setTitle(string);
	return errorEmbed;
};

module.exports.commandInfo = ` [random | anime <anime name> |  char <character name>]\n
- \`!quote random\`: Get a random quote
- \`!quote anime naruto\`: Get a random quote from the specified Anime
- \`!quote char saitama\`: Get a random quote of the specified Character\n`;
