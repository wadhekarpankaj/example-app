
# Example Application

A small web application


## Run Locally

Clone the project

```bash
  git clone git@github.com:wadhekarpankaj/example-app.git
```

Go to the project directory

```bash
  cd example-app
```

Docker build

```bash
  docker build -t ctc-app:latest .
```

Start the container

```bash
  docker run -d -p 8000:8000 ctc-app:latest
```


## Folder structure
## CI/CD Flow