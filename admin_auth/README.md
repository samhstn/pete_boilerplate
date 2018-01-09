# Admin Auth

### Quick Start

```bash
git clone https://github.com/shouston3/pete_boilerplate.git

./select admin_auth

mix do deps.get, ecto.create, ecto.migrate
```

To generate an admin, run:

```bash
mix run priv/repo/seeds.exs
```

See this admin by logging in with username: admin@test.com and password: supersecret
