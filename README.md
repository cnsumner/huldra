Huldra: a Discord Bot
===================================

_Note: This is a full rewrite of [Non-Answer Generator](https://github.com/cnsumner/non-answer-generator), originally written in rust but completely reimplemented in Dart. While the old rust bot still works, this new bot is better in almost every way and has a much more sophisticated implementation due to Dart just being a much easier language (I could not figure out how to implement certain things in rust...)._

**TL;DR: this bot sits in your discord server and learns how to talk like your users**

What
----
Machine learning at it's finest. This is it boys.

This is a Discord chat bot built on top of a custom [Markov Chain](https://en.wikipedia.org/wiki/Markov_chain) implementation.  It listens to nearly every message sent in your discord server and uses those messages as sample text to train a statistical model.  

As it learns, it will be able to generate messages that resemble things that your discord server users might say. It gets better (or worse, depending on your perspective) over time.

It will occasionally respond to messages with often nonsensical, but sometimes eerily topical responses.

Why
----

Why not??

Usage
-----

The bot will learn and also respond on it's own, no need to @ it or anything like that.

_TODO: add configuration and command usage details here_

How do I add it to my server?
------------

### Installation (follow instructions for your operating system below, then continue to configuration instructions)
#### Linux

_TODO: add details on running on linux (from precompiled binary)_

#### Windows or some other system

_TODO: add details on compiling or running from source_

### Configuration

_TODO: add configuration details_

Can you add X feature?
------------

Maybe. If I have time and think it's worthwhile. You could also add it yourself and submit a pull-request.

_TODO: add contribution info_
 
