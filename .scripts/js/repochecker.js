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

    ${chalk.blue('  Username')}          : ${data.login ? data.login : 'Empty'}
    ${chalk.blue('  Name')}              : ${data.name ? data.name : 'Empty'}
    ${chalk.red('  Location')}          : ${data.location ? data.location : 'Empty'}
    ${chalk.red('  Followers')}         : ${data.followers}
    ${chalk.blue('  Following')}         : ${data.following}
      Bio               : ${data.bio ? `${data.bio}` : 'Empty'}
    ${chalk.yellow('  Public Repository')} : ${data.public_repos ? data.public_repos : 'Empty'}
    ${chalk.blue('  Twitter')}           : ${data.twitter_username ? data.twitter_username : 'Empty'}
      Email             : ${data.email ? data.email : 'Empty'}
  `
}

function informationRepository(data) {
  return `
    ╭───────────────────────────────╮
    ┃     Information Repository    ┃
    ╰───────────────────────────────╯

    ${chalk.blue('  Repository Name')}      : ${data.name}
    ${chalk.yellow('  Repository Full Name')} : ${data.full_name}
    ${chalk.green('  Private')}              : ${data.private}
    ${chalk.green('  Owner')}                : ${data.owner.login}
    ${chalk.magenta('  Created at')}           : ${data.created_at}
    ${chalk.yellow('  Updated at')}           : ${data.updated_at}
    ${chalk.yellow('  Description')}          : ${data.description ? data.description : 'No Description'}
    ${chalk.red('  Issues')}               : ${chalk.red(data.open_issues)}
    ${chalk.yellow('  Stars')}                : ${chalk.yellow(data.stargazers_count)}
    ${chalk.blue('  Forks')}                : ${data.forks}
    ${chalk.green('  Watcher')}              : ${data.watchers_count}
    ${chalk.magenta('  Highest Language')}     : ${language(data.language)}
    ${chalk.yellow('  License')}              : ${data.license ? data.license.name : 'No License'}
    ${chalk.red('𢡄 Size')}                 : ${Math.floor(data.size / 1024)} MB
  `
}

function language(language) {
  if (language == "Lua") {
    return `${chalk.blue(' Lua')}`
  } else if (language == "Shell") {
    return `${chalk.white(' Shell')}`
  } else if (language == "JavaScript") {
    return `${chalk.yellow(' JavaScript')}`
  } else if (language == "HTML") {
    return `${chalk.red(' HTML')}`
  } else if (language == "CSS") {
    return `${chalk.blue(' CSS')}`
  } else if (language == "Python") {
    return `${chalk.blue(' Python')}`
  } else if (language == "Rust") {
    return `${chalk.red(' Rust')}`
  } else if (language == "C") {
    return `${chalk.blue(' C')}`
  } else if (language == "C++") {
    return `${chalk.blue(' C++')}`
  } else if (language == "Elixir") {
    return `${chalk.magenta(' Elixir')}`
  } else if (language == "PHP") {
    return `${chalk.blue(' PHP')}`
  } else if (language == "TypeScript") {
    return `${chalk.blue(' TypeScript')}`
  } else if (language == "Vim script") {
    return `${chalk.green(' Vim script')}`
  }
  else {
    return "Can't detect Language"
  }
}
