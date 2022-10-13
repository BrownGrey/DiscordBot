const Discord = require('discord.js')
const fs = require('fs')
const tempPath = `${__dirname}/../../tmp`

/**
 * Write vue component with argument received, file is storage in temp folder with user id,
 * after response with file, the file is deleted
 */
exports.run = (bot, author, channel, args) => {
    const { id, username } = author
    fs.writeFile(`${tempPath}/${id}.vue`, args[1], err => {
        if(err)
            throw err

        fs.readFile(`${tempPath}/${id}.vue`, (err, data) => {
            const fileAttach = new Discord.Attachment(data, `file-${username}.vue`)
            channel.send(`<@${author.id}>, here's your component`, fileAttach)

            fs.unlinkSync(`${tempPath}/${id}.vue`)
        })
    })
}
