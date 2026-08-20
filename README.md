# A brew tap for my stuff

## Install homebrew
Homebrew Cask extends Homebrew and brings its elegance, simplicity, and speed to the installation and management of GUI macOS applications such as Atom and Google Chrome.

First you will have to install Homebrew. Paste the following command in a macOS Terminal or Linux shell prompt.
```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

You can find all documentation on how to use homebrew on official website [here](https://brew.sh/).

## Install new Tap

To add this tap, use the following command:

    brew tap phschott/phs

Then install some custom stuff:

    brew install awesome-scripts
    brew install --cask some-app

## Resolving damaged issue
If your Mac states that it cannot run App because it is "damaged" (it isn't) run the following command from the Terminal app.

(You will need to adjust the "path_to" part depending on the location of the application file)

     xattr -r -d com.apple.quarantine path_to/xxx.app

This will remove the quarantine bit from the application to allow it to run.

Alternatively you can install cask with --no-quarantine option which will do the same.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## License

Code is under the [BSD 2 Clause (NetBSD) license](LICENSE).