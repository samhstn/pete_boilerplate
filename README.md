[![Build Status](https://travis-ci.org/shouston3/pete_boilerplate.svg?branch=master)](https://travis-ci.org/shouston3/pete_boilerplate)
[![codecov](https://codecov.io/gh/shouston3/pete_boilerplate/branch/master/graph/badge.svg)](https://codecov.io/gh/shouston3/pete_boilerplate)

Hosted here: https://sams-pete-boilerplate.herokuapp.com/

# Pete

# What and Why

A boiler plate that uses the P(hoenix) E(lixir) T(achyions) E(lm) stack

How I like to lay out projects which use this stack

I've gotten bored with building something similar each time from scratch

I don't use brunch as I find configuring it a hasstle.

I use sass as I'm a fan of short modularized css files and sass variables

I use rollup as it's in my favorite javascript bundler

I like to keep a terminal open and watch for changes for each of my sass, js and elm files individually

# How

```bash
git clone https://github.com/shouston3/pete_boilerplate.git && cd pete_boilerplate
```

# Quick start

```bash
mix deps.get

mix ecto.create

cd assets && npm run build && cd -

mix phx.start
```

# Rename project

rename pete to your project name by following this gist:

https://gist.github.com/nerdyworm/3d623b13bf0d6d664373e2f501f16423

If on osx, you can install `awk` with `brew install awk`

There is a `rename.sh` file in the root for you to run

# Heroku

Set up a new project and add the remote.

Something like:

```bash
heroku git:remote -a pete-boilerplate
```

For information on each of these steps see the Phoenix deployment guide:

https://hexdocs.pm/phoenix/heroku.html

Most of the steps from the deployment guide have already been managed though.

You will still need to set up postgres, some buildpacks and a couple of environment variables.

Run each of these lines indivudually and ensure it was configured correctly

Ensure the order of the buildpacks is exactly in the order below

The order of your buildpacks can be checked with `heroku buildpacks`

```bash
heroku buildpacks:add "https://github.com/HashNuke/heroku-buildpack-elixir.git"
heroku buildpacks:add "https://github.com/heroku/heroku-buildpack-ruby.git"
heroku buildpacks:add "https://github.com/heroku/heroku-buildpack-nodejs.git"
heroku addons:create heroku-postgresql:hobby-dev
heroku config:set POOL_SIZE=18
heroku config:set SECRET_KEY_BASE="$(mix phx.gen.secret)"
```

You will also need to change the line in `config/prod.exs` specifying host from `pete-boilerplate.herokuapp.com` to your hostname

Now push to heroku, if you need to push an empty commit, this may come in handy:

```bash
git commit --allow-empty -m "empty" && git push heroku master
```

# Travis

Simply go to `https://travis-ci.org/<your-org/username>/<your-project>`

Click activate repository

The next push should be integrated with travis

Same goes for coveralls
