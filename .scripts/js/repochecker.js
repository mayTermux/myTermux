const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
const fetch = require('node-fetch');
const chalk = require('chalk');

const api_url = "https://api.github.com/users"

rl.question("Username GitHub: ", function (username) {
  fetch(`${api_url}/${username}`)
    .then(result => result.json())
    .then(json => console.log(informationUser(json)));
  fetch(`${api_url}/${username}/repos`)
    .then(results => results.json())
    .then(results => {
      results.forEach(result => { console.log(informationRepository(result)) });
    });
  rl.close();
});

function informationUser(data) {
  return `
    ╭─────────────────────────╮
    ┃     Information User    ┃
    ╰─────────────────────────╯

    ${chalk.blue('')}  Username          : ${data.login}
    ${chalk.blue('')}  Name              : ${data.name}
    ${chalk.red('')}  Location          : ${data.location}
    ${chalk.red('')}  Followers         : ${data.followers}
    ${chalk.blue('')}  Following         : ${data.following}
      Bio               : ${data.bio ? `${data.bio}` : 'Kosong'}
    ${chalk.yellow('')}  Public Repository : ${data.public_repos}
    ${chalk.blue('')}  Twitter           : ${data.twitter_username ? `${data.twitter_username}` : 'Kosong'}
      Email             : ${data.email ? `${data.email}` : 'Kosong'}
  `
}

function informationRepository(data) {
  return `
    ╭───────────────────────────────╮
    ┃     Information Repository    ┃
    ╰───────────────────────────────╯

    Repository Name      : ${data.name}
    Repository Full Name : ${data.full_name}
    Private              : ${data.private}
    Owner                : ${data.owner.login}
    Created at           : ${data.created_at}
    Updated at           : ${data.updated_at}
    Description          : ${data.description ? data.description : 'No Description'}
    ${chalk.bgRed.black('Issues')}               : ${chalk.bgRed.black(data.open_issues)}
    ${chalk.bgYellow.black('Starts')}               : ${chalk.bgYellow.black(data.stargazers_count)}
    Forks                : ${data.forks}
    Watcher              : ${data.watchers_count}
    Highest Language     : ${data.language ? data.language : "Can't detect Language"}
    License              : ${data.license ? data.license.name : 'No License'}
    Size                 : ${Math.floor(data.size / 1024)} MB
  `
}