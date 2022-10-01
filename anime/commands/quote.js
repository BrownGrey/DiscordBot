const { getQuote } = require('../util/fetch-quote');
const { commandInfo, errorResponse, formatResponse } = require('../util');

module.exports = {
	name: 'quote',
	description: 'Get a random quote or get a specific one by anime/character name.',
	cooldown: 5,
	args: true,
	usage: commandInfo,
	async execute(message, args) {
		/**
		 * !quote random
		 * When only !quote has been passed with no arguments
		 */
		if(args[0] === 'random') {
			const response = await getQuote('/random');
			return message.channel.send(formatResponse(response));
		}

		/**
		 * !quote anime <anime_title>
		 * When the second argument is anime followed by the Anime title
		 */
		if(args[0] === 'anime') {
			const animeName = args.slice(1).join(' ');
			if(!animeName) {
				return message.channel.send(errorResponse('No anime name is provided. Please provide a valid anime name'));
			}

			const response = await getQuote(`/random/anime?title=${animeName}`);

			if(!response) {
				return message.channel.send(errorResponse(`No quotes from "${animeName}" is available now !`));
			}

			return message.channel.send(formatResponse(response));
		}

		/**
		 * !quote char <character_name>
		 *  When the second argument is char followed by the Character name
		 */
		if(args[0] === 'char') {
			const characterName = args.slice(1).join(' ');
			if(!characterName) {
				return message.channel.send(errorResponse('No anime name is provided. Please provide a valid anime name'));
			}

			const response = await getQuote(`/random/character?name=${characterName}`, message);

			if(!response) return message.channel.send(errorResponse(`No quotes from "${characterName}" is available now !`));

			return message.channel.send(formatResponse(response));
		}

		return message.channel.reply('⚠️ **That is not a valid command!** Run `!help quote` for avalilable quote commands');
	},
};