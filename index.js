const WUMPUSBOT = require("./handlers/Client");
const { TOKEN } = require("./settings/config");

const client = new WUMPUSBOT();
module.exports = client;
client.start(TOKEN);

process.on("unhandledRejection", (reason, p) => {
  console.log(" [Error_Handling] :: Unhandled Rejection/Catch");
  console.log(reason, p);
});
process.on("uncaughtException", (err, origin) => {
  console.log(" [Error_Handling] :: Uncaught Exception/Catch");
  console.log(err, origin);
});
process.on("uncaughtExceptionMonitor", (err, origin) => {
  console.log(" [Error_Handling] :: Uncaught Exception/Catch (MONITOR)");
  console.log(err, origin);
});
process.on("multipleResolves", (type, promise, reason) => {
  console.log(" [Error_Handling] :: Multiple Resolves");
  console.log(type, promise, reason);
});
const express = require('express')
const app = express();
const port = 3000;
app.get('/', (req, res) => {
  res.send('WumpusBot 24/7!')
})
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
