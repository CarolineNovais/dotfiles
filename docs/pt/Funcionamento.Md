
## How the "dotfiles" command works

Quando [dotfiles][dotfiles] é executado pela primeira vez, acontece essas coisas:

1. In Ubuntu, Git is installed if necessary via APT (it's already there in OSX).
1. This repo is cloned into your user directory, under `~/.dotfiles`.
1. Files in `/copy` are copied into `~/`. ([read more](#the-copy-step))
1. Subdirectories in `/copy` are copied into `/`
1. Files in `/link` are symlinked into `~/`. ([read more](#the-link-step))
1. You are prompted to choose scripts in `/init` to be executed. The installer attempts to only select relevant scripts, based on the detected OS and the script filename.
1. Your chosen init scripts are executed (in alphanumeric order, hence the funky names). ([read more](#the-init-step))

On subsequent runs, step 1 is skipped, step 2 just updates the already-existing repo, and step 5 remembers what you selected the last time. The other steps are the same.

### Outros Sub-diretórios

* `/backups` Diretório criado para backups, usado quando arquivos pessoais do utilizador serão removidos.
* `/bin` directory contains executable shell scripts (including the [dotfiles][dotfiles] script) and symlinks to executable shell scripts. This directory is added to the path.
* `/caches` directory contains cached files, used by some scripts or functions.
* `/conf` directory just exists. If a config file doesn't **need** to go in `~/`, reference it from the `/conf` directory.
* `/source` Pasta com os arquivos que serão carregados quando abrir um novo shell (em ordem alfabética, por isso os números na frente dos arquivos, para ordenar a execução deles).
* `/test` Pasta para os testes unitários do dotfiles
* `/vendor` Pasta com bibliotecas de terceiros

### The "copy" step
Any file in the `/copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [copy/.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

### The "link" step
Any file in the `/link` subdirectory gets symlinked into `~/` with `ln -s`. Edit one or the other, and you change the file in both places. Don't link files containing sensitive data, or you might accidentally commit that data! If you're linking a directory that might contain sensitive data (like `~/.ssh`) add the sensitive files to your [.gitignore](.gitignore) file!

### The "init" step
Scripts in the `/init` subdirectory will be executed. A whole bunch of things will be installed, but _only_ if they aren't already.

#### OS X

* Minor XCode init via the [init/10_osx_xcode.sh](init/10_osx_xcode.sh) script
* Homebrew via the [init/20_osx_homebrew.sh](init/20_osx_homebrew.sh) script
* Homebrew recipes via the [init/30_osx_homebrew_recipes.sh](init/30_osx_homebrew_recipes.sh) script
* Homebrew casks via the [init/30_osx_homebrew_casks.sh](init/30_osx_homebrew_casks.sh) script
* [Fonts](/cowboy/dotfiles/tree/master/conf/osx/fonts) via the [init/50_osx_fonts.sh](init/50_osx_fonts.sh) script

#### Linux (Ubuntu and Debian)
* APT packages and git-extras via the [init/20_linux_apt.sh](init/20_ubuntu_apt.sh) script

#### Both
* Node.js, npm and nave via the [init/50_node.sh](init/50_node.sh) script
* Ruby, gems and rbenv via the [init/50_ruby.sh](init/50_ruby.sh) script
* Vim plugins via the [init/50_vim.sh](init/50_vim.sh) script

Since you'll be using the [dotfiles][dotfiles] command on subsequent runs.

There's a lot of stuff that requires admin access via `sudo`, so be warned that you might need to enter your password here or there.

## Aliases and Functions
To keep things easy, the `~/.bashrc` and `~/.bash_profile` files are extremely simple, and should never need to be modified. Instead, add your aliases, functions, settings, etc into one of the files in the `source` subdirectory, or add a new file. They're all automatically sourced when a new shell is opened. Take a look, I have [a lot of aliases and functions](source). I even have a [fancy prompt](source/50_prompt.sh) that shows the current directory, time and current git/svn repo status.

## Scripts
In addition to the aforementioned [dotfiles][dotfiles] script, there are a few other [bin scripts](bin). This includes [nave](https://github.com/isaacs/nave), which is a [git submodule](vendor).

* [dotfiles][dotfiles] - (re)initialize dotfiles. It might ask for your password (for `sudo`).
* [src](link/.bashrc#L8-18) - (re)source all files in `/source` directory
* Look through the [bin](bin) subdirectory for a few more.

## Prompt
I think [my bash prompt](source/50_prompt.sh) is awesome. It shows git and svn repo status, a timestamp, error exit codes, and even changes color depending on how you've logged in.

Git repos display as **[branch:flags]** where flags are:

**?** untracked files  
**!** changed (but unstaged) files  
**+** staged files

SVN repos display as **[rev1:rev2]** where rev1 and rev2 are:

**rev1** last changed revision  
**rev2** revision

Check it out:

![My awesome bash prompt](http://farm8.staticflickr.com/7142/6754488927_563dd73553_b.jpg)
