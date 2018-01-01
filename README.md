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
