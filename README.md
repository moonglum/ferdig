# ferdig [![Travis CI Build Status](https://travis-ci.org/moonglum/ferdig.svg)](https://travis-ci.org/moonglum/ferdig)

This is a sample application for a [#lesscode](http://lesscode.is) Ruby web stack I'm test driving:

* [tynn](http://tynn.xyz) for routing
* [hmote](https://github.com/harmoni/hmote) for templating
* [silueta](https://github.com/harmoni/silueta) for the value objects
* [cutest](https://github.com/djanowski/cutest) for testing
* [PostgreSQL](http://www.postgresql.org) as the database, with:
    * [sql_capsule](https://github.com/piisalie/sql_capsule) for accessing the database
    * [nomadize](https://github.com/piisalie/nomadize) for migrations
* And the following big dependencies: Rake (will try make instead), Bundler (will try gs, bs or gst instead) and Capybara (can't really replace it)

I also want to add the following components when I need them:

* [minuteman](https://github.com/elcuervo/minuteman) for analytics
* [ost](https://github.com/soveran/ost) for background jobs
* [scrivener](https://github.com/soveran/scrivener) or [dry-validation](http://dryrb.github.io/dry-validation) for validation
* [shield](https://github.com/cyx/shield) for authentication

Why is it called ferdig? You can find the explanation [here](https://twitter.com/frodsan/status/659303409074503684).

## Motivation

It's an old saying that "If all you have is a hammer, everything looks like a nail", but I frequently found myself asking: "What if I just want to put a nail in the wall?"
So I want to try the #lesscode way :smile:

Another motivation is a very simple one: Most of the libraries is written by friends of mine – and I simply wanted to try them.

## License

This code is released under GNU General Public License v3.0
