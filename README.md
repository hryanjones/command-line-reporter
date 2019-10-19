# command-line-reporter
A small command line utility to verbally tell you when a long running task succeeds or fails.

## Compatibility

Tested on Ubuntu, should work on a Mac, probably won't work on Windows.

## Installation

1. `git clone` this repository
2. (optional, but recommended) alias `./reporter.sh` to something short like `r`
3. (optional) change the success/failure/done words in the top of the file `./report.sh`

## Usage

(**note**: all examples below assume the aliasing to `r` per step 2 above.)

There are two ways to use it:
1. put `r` before a command like:
  * `> r true`
    * computer say's "yay!" because the command suceeded
  * `> r false`
    * computer say's "crap a doo" because the command failed
2. type `r` after the command has started:
  * > some-command you realize may take time after starting it, type "r"
    * computer says "done"

## Here's a video of how it works: https://youtu.be/wNObcPa1reE

### Failure only

(this section assumes you alias `reporter.sh --failure-only` to `rf`)

Sometimes it's useful to only know when a command fails, in this case you can use the `--failure-only` flag as the first argument:
* `rf false`
  * computer says "crap a doo"
* `rf true`
  * computer doesn't say anything


## Help

Feel free to report issues on the repo on GitHub: https://github.com/hryanjones/command-line-reporter