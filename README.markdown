# scrool does dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine. The very
prejudiced mix: OS X, bash, Ruby, Rails, git, homebrew, rbenv, Textmate. If you
match up along most of those lines, you may dig my dotfiles.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read Zach Holman's post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## install

- `git clone git://github.com/scrool/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`
- `vim +BundleInstall! +BundleClean +qall`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.bash` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.


## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/scrool/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks
* [Zach Holman](http://github.com/holman)
* [pcasaretto](http://github.com/pcasaretto)

## Interesting repos
* https://github.com/rtomayko/dotfiles
* https://github.com/skwp/dotfiles
* https://github.com/jeffbuttars/Viming-With-Buttars
* https://github.com/zaiste/vimified
* https://github.com/spf13/spf13-vim
* https://github.com/thenovices/dotfiles
* https://github.com/cypher/dotfiles
* https://github.com/holman/dotfiles
* https://bitbucket.org/zeekay/dotfiles/src
* https://bitbucket.org/ches/dotfiles/src

## Requirements
* gnome-256color terminal:
  * sudo apt-get install ncurses-term
