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
mix ecto.create

cd assets && npm run build && cd -

mix phx.start
```

# Rename project

rename pete to your project name by following this gist:

https://gist.github.com/nerdyworm/3d623b13bf0d6d664373e2f501f16423

If on osx, you can install `awk` with `brew install awk`

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

```bash
heroku buildpacks:add "https://github.com/HashNuke/heroku-buildpack-elixir.git"
heroku buildpacks:add "https://github.com/heroku/heroku-buildpack-ruby.git"
heroku buildpacks:add "https://github.com/heroku/heroku-buildpack-nodejs.git"
heroku addons:create heroku-postgresql:hobby-dev
heroku config:set POOL_SIZE=18
heroku config:set SECRET_KEY_BASE="$(mix phx.gen.secret)"
```
