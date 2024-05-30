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

## How to contribute to this Tap
### Getting Set Up To Contribute
First, you'll need to fork the repository and add your copy as a remote (can also be done with hub fork).

1: Fork the repository in GitHub with the Fork button.

2: If you have not already done so, add your GitHub fork as a remote for your homebrew-cask Tap:

```bash
$ github_user='<my-github-username>'
$ cd "$(brew --repository)"/Library/Taps/phschott/homebrew-phs
$ git remote add "${github_user}" "https://github.com/${github_user}/homebrew-phs"
```

3: If you have already added your GitHub fork as a remote for your homebrew-cask Tap, ensure your fork is up-to-date.

4: Switch to a new branch (ie. new-feature), and work from there: git checkout -b new-feature.

### Adding a Cask
With a bit of work, you can create a new Cask. The document [Adding A Cask](https://github.com/Homebrew/homebrew-cask/blob/master/doc/development/adding_a_cask.md) will help you create, test, and submit a new Cask.

## Resolving damaged issue
If your Mac states that it cannot run App because it is "damaged" (it isn't) run the following command from the Terminal app.

(You will need to adjust the "path_to" part depending on the location of the application file)

     xattr -r -d com.apple.quarantine path_to/xxx.app

This will remove the quarantine bit from the application to allow it to run.

Alternatively you can install cask with --no-quarantine option which will do the same.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
