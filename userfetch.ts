const Discord = require('discord.js')
const fs = require('fs')
const request = require('request')
const seacher = require('string-search')
const tempPath = `${__dirname}/../../tmp`
const readmePath = 'https://raw.githubusercontent.com/vuejs/awesome-vue/master/README.md'

/**
 * Get an param and search in awesome vue list, return a list with query string
 */
exports.run = (bot, author, channel, args) => {
    const { id } = author

    if(args[1] == undefined || args[1].length < 3) 
        return channel.send(`<@${id}>, input one or more keywords that I can search for you.`)
    
    channel.send(`Wait a moment, I'm searching for '${args[1]}'...`)

    const file = fs.createWriteStream(`${tempPath}/${id}.md`)
    request(readmePath, async (error, response, body) => { 
        const answer = await getAnswer(body, args[1])
        channel.send(answer.replace(':id:', `<@${id}>`))
    })
}

/**
 * Get and format body, and search query in body, is returned the message to answer user
 * @param {string} body 
 * @param {string} query 
 */
const getAnswer = (body, query) => {
    body = body.substring(body.indexOf('# Resources'), body.length)
    return seacher.find(body, query).then(result => {
        if (result.length == 0)
            return `:id:, I could not find anything about '${query}' for you :slight_frown:`

        const textResult = formatAwesomeList(result)
        return `Hey :id: :wave:, I found it for you:\n${textResult}`
    })
}

/**
 * Check packages in list and return string with list formated
 * @param {array} list 
 */
const formatAwesomeList = list => {
    let output = ''
    for (let key in list) {
        if(key >= 5)
            break

        if (!list[key].text.includes('#'))
            output += `\t${formatAwesomeItemList( list[key].text )}\n\n`
    }
    return output
}

/**
 * Convert markdown for discord format and return item
 * @param {string} item 
 */
const formatAwesomeItemList = item => {
    let result =  item.replace('- [', '**').replace('](', '**  (<')

    if(result.includes(') -'))
        result = result.replace(') -', '>)\n\t\t\t')
    else if(result.includes(')'))
        result = result.replace(')', '>)\n\t\t\t')
    
    return result
}
