# chswift

[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

The missing Swift version manager.

## Installation

```bash
$ brew tap neonichu/formulae
$ brew install chswift
```

Amend configuration as advised by the installation procedure.

## Usage

Running without any arguments will show installed Swift versions and the currently selected one:

```bash
$ chswift 
 * 1.1 (swift-600.0.57.4)
   1.2 (swiftlang-602.0.47.4 clang-602.0.48)
```

Specify a version number to change the current Swift:

```bash
$ chswift 1.2
$ swift --version
Apple Swift version 1.2 (swiftlang-602.0.47.4 clang-602.0.48)
Target: x86_64-apple-darwin14.3.0
```

Fall back to the Swift defined by your `xcode-select` configuration:

```bash
$ chswift system
```

You can also configure a local environment in *.swift-version* files, which contain only the the version you want to use. To use Swift 1.2, do the following in your directory:

```bash
$ echo 1.2 >.swift-version
```

You can verify it's working using the following. 

```bash
$ swift --version
Apple Swift version 1.2 (swiftlang-602.0.47.4 clang-602.0.48)
Target: x86_64-apple-darwin14.3.0
```

### Managing Swift Versions

In order to have multiple Swift versions listed when you run chswift, you will need to have multiple Xcode versions running. The simplest way is to use [xcode-install](https://github.com/neonichu/xcode-install). If you rely solely on the Mac App Store, updates will change your system's Swift version.

## Testing

```bash
$ brew install shunit2
$ make test
```

## Thanks

This project is based on ideas and code of the amazing [chruby][1]. If
you are also in the market for a Ruby chooser, you have found it.


[1]: https://github.com/postmodern/chruby
