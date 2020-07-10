# ansible scripts
A collection of useful ansible-related shell scripts

## Installation
### scripts
Install scripts along with their respective completion scripts

```shell
make prefix=<dir on your $PATH> install
```

... or with `sudo`

```shell
sudo make install
```

### completion

#### bash
```shell
[sudo] make [prefix=<dir on your $PATH>] bash_completion
```

#### zsh
```shell
[sudo] make [prefix=<dir on your $PATH>] zsh_completion
```

## Usage
Before running any of these scripts, make sure the environment variable `ANSIBLE_PROJECT_DIR` points to an ansible project directory.

### Scripts
List all environments
```shell
ansible-environments
```

List all groups for an environment
```shell
ansible-groups [env]
```

List all hosts for an environment and a group
```shell
ansible-hosts [env] [group]
```

## Directory Layout
These scripts expect the following directory structure and will not work otherwise:

```
- environments
	- env_a
		- inventory
	- env_b
		- inventory
	- ...
		- inventory
```

## TODO
- make ansible-related stuff work for [best practice directory-layouts](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#directory-layout) as well
- support inventory-files in ini format
- add subcommand to permanently configure ansible project dir (replace usage of environment variable `ANSIBLE_PROJECT_DIR`)
- add flag to transiently set ansible project dir (don't write this to config)

