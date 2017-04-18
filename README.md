# Spry

[![Join the chat at https://gitter.im/gokr/spry](https://badges.gitter.im/gokr/spry.svg)](https://gitter.im/gokr/spry?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![nimble](https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble_js.png)](https://github.com/yglukhov/nimble-tag)

[![Build Status](https://travis-ci.org/gokr/spry.svg?branch=master)](https://travis-ci.org/gokr/spry)

[![Join the chat at https://gitter.im/gokr/spry](https://badges.gitter.im/gokr/spry.svg)](https://gitter.im/gokr/spry?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)


This is the [Spry language](http://sprylang.org), inspired by Rebol/Smalltalk/Self/Forth and Nim. Characteristics:

* A dynamically typed minimalistic language with a free form syntax similar to Rebol/Forth
* Parser produces an AST which in turn is interpreted by the interpreter
* Functional in nature and has closures and non local return
* Homoiconic which means code and data has the same form
* Meant to be 100% live and support interactive development

For the moment Spry is procedural, but an object model facilitating polymorphic dispatch is planned.

Here are [my articles about Spry](http://goran.krampe.se/category/spry)

## Why would I play with this?

* You love Rebol/Ren/Red but think it could perhaps be simplified, smaller and different :)
* You love Smalltalk but can imagine a simplified Smalltalkish language 
* You love Smalltalk but want to play with multicore or small platforms and more easily use the C/C++ eco system
* You love Nim but want to have a dynamic language running inside Nim
* ...or you just love freaky programming language ideas!

## Installation

Spry should only depend on Nim, so it should work fine on Windows, OSX, Linux etc, but
for the moment **I only use Linux for Spry development**. The shell scripts can probably be rewritten
in nimscript and thus everything can be fully cross platform.

### Vagrant
Included is a VagrantFile for Ubuntu 16.04. Just do `vagrant up` and `vagrant ssh` into it to find spry installed. Test with `ispry`.

### Linux
1. Get [Nim](http://www.nim-lang.org)! I recommend following the [instructions at the bottom](http://nim-lang.org/download.html).
2. Install Nimble, [the Nim package manager](https://github.com/nim-lang/nimble). Yeah, its very nice and simple to use. Its not really needed but makes some things easier.
3. Clone this repo. Then run `nimble install` in it.
4. Finally run all tests using `cd tests && ./run.sh` (runjs.sh is for running them in nodejs, but not fully green right now)

For the other platforms the steps are basically the same.

So now that you have installed Spry, you can proceed to play with the samples in the `samples` directory.
See README in there for details.

### Other platforms

...same procedure modulo platform differences :)


## Playing with it

1. If you want to build the interpreter manually, go into `src` and run
`nim c -d:release spry` to build the Spry interpreter, or `nim c -d:release ispry` for the REPL. It should produce a single binary.
That's the standard invocation to build a nim program in release mode.

2. Then go into samples and look at `hello.sy` as the next mandatory step :).
Its simply Spry source being run by the `spry` executable interpreter using the "shebang" trick.

4. Then you can cd into bench and run `bench.sh` which starts by building the standalone Spry interpreter
and then use it to run `factorial.sy` which is a program that calculates `factorial 12`
100k times. It takes 2.7 seconds on my laptop which is quite slow, about 6x slower than
Rebol3, 20x slower than Python and 100x slower than Pharo Smalltalk. :) You can run `compare.sh`
to see yourself. With a bit of work removing unneeded silly stuff in the interpreter it should
be reasonable to reach Rebol3 in performance.

4. Ok, so at this point **you want to learn a bit more how Spry works**. Not much material around yet since its evolving but you can:

* On Linux or OSX you should be able to build a trivial "IDE", see below.
* Look at `tests/*.nim` which is a series of low level Spry code snippets and expected output.
* Look at the various `samples`
* Try running `tutorial1.sy` in tutorials, which is just showing we can do interactive tutorials with the repl
* Try out the interactive REPL by running `ispry`
* And of course, read the source code `spryvm.nim`. Its hopefully not that messy.

## IDE
There is also a beginning of a Spry VM module (src/modules/spryui.nim) for making GUI stuff using the excellent [libui](http://github.com/andlabs/libui) project. A small trivial little IDE written in Spry itself exists and you can build it on Linux or OSX.

* **OSX:** Just run `./makeideosx.sh` in `src` and if you are lucky that produces a binary file called `ideosx`. Try running it with `./ideosx`.
* **Linux:** Just run `./makeideo.sh` in `src` and if you are lucky that produces a binary file called `ide`. Try running it with `./ide`.

## History
Spry started out as a Rebol inspired interpreter - since I felt the homoiconicity
of Rebol was interesting to experiment with. Lispish, but not insanely filled
with parenthesis :)

Then I started sliding towards Smalltalk when I added both support for infix
arguments (so that a "receiver" can be on the left, similar to Nim), and later
even keyword syntax for functions taking multiple arguments. I also changed func
definitions to be more light weight (compared to Rebol) like Smalltalk blocks.

Spry is meant to mix with Nim. The idea is to use Nim for heavy lifting and binding
with the outside world, and then let Spry be a 100% live dynamically typed
language inside Nim. Spry will stay a very small language, but hopefully useful.

And oh, this is just for fun and I am not a good Nim hacker nor a language
implementor. :)