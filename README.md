# logigator-development-distribution

Repository for helping to develop Logigator.

### Project Repositories
- [Logigator Editor](https://github.com/logigator/logigator-editor)
- [Logigator Home](https://github.com/logigator/logigator-home)
- [Logigator Shared Comps](https://github.com/logigator/logigator-shared-comps)
- [Logigator Backend](https://github.com/logigator/logigator-backend)
- [Logigator Simulation](https://github.com/logigator/logigator-simulation)

### Creating Issues
Issues should be created in the above mentioned repository, not in this one.

## Getting Started
### Prerequisites
You need to have node and npm installed. We recommend installing it via [nvm](https://github.com/nvm-sh/nvm).
Additionally you need PHP 7.2 or higher and a MariaDB or MySQL Database to use the backend.

#### Debian Node Installation
```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install lts/*
```

### Installation
Download the contents of the repository, open the command line in that directory and install it's dependencies.
```
git clone git@github.com:logigator/logigator-development-distribution.git 
npm install
npm run setup-dev:<https/ssh>:<win32/darwin:linux>
```

### Setting Up Backend
Copy the contents of `logigator-backend/config.php.example` to `logigator-backend/config.php` and fill in the missing information. 
If you leave out the Google and Twitter Keys, Google and Twitter Login will not work. If the email accounts are not field in it won't be possible to register at all. 

### Setting Up Database
Run `logigator-backend/db_create.sql` in your database. It will create a user 'logigator' and a database 'logigator', you can change this to whatever you configured in `config.php`.

### Hosts
Please add the following lines to your hosts file: <br>
`C:\Windows\System32\drivers\etc\hosts` or `/etc/hosts`
```
127.0.0.1		logigator-local-dev.com
127.0.0.1		editor.logigator-local-dev.com
127.0.0.1		api.logigator-local-dev.com
```

### Starting the Projects
There are a few scripts in `package.json` of this repo.

- `start:backend` - serves the backend on port 8203
- `start:proxy` - starts a proxy-server to the Backend and all dev-servers
- `start:backend-and-proxy` - starts backend and proxy-server
- `start:home` - serves logigator-home on port 8201 
- `start:shared-comps` - serves logigator-shared-comps for live reloading
- `start:editor:web` - serves the logigator-editor on port 8202
- `start:edtior:electron` - serves logigator-editor electron app

It is also possible to run the scripts directly in the repositories.

It is not required to start all projects to develop, you can run `logigator-editor` without `logigator-home` or `logigator-shared-comps` for example.

### Simulation-Mode in the Editor
If the simulation-mode is not working, is this most likely due to a missing Webassembly module. 
To fix this issue you must build the [Simulation Code](https://github.com/logigator/logigator-simulation) by your self. 
Instructions for doing so can be found in the simulation repo. 
After you built the simulation-code, just copy the contents of `logigator-simulation/webAssembly/dist/` to `logigator-editor/src/assets/wasm`.

## License
This Project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
