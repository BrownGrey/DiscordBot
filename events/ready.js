const client = require("../index");

client.on("ready", async () => {
  console.log(`${client.user.username} Just came here! Hope he brought Pizza for us`);
  client.user.setActivity({
    name: `/help`,
    type: "PLAYING",
  });
  require('../handlers/Database')(client)

  client.guilds.cache.forEach(async (guild) => {
    await client.updateembed(client, guild)
  })
});
