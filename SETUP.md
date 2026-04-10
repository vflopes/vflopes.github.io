## Use Jekyll Through a Custom Docker Image

Build the image once (or after changing dependencies):

```bash
docker compose build
```

Start the site:

```bash
docker compose up
```

Open http://localhost:4000

Stop the site:

```bash
docker compose down
```

Optional helper:

```bash
alias jk='docker compose'
```

Then use `jk up`, `jk down`, and `jk build`.