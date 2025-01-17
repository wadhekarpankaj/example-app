
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

Modify the CallMe service url in .env.prod file

```bash
  CALLME_SERVICE_URL=http://{call_me_service_url}/callme
```

Docker build

```bash
  docker build -t example-app:latest .
```

Start the container

```bash
  docker run -d -p 8000:8000 example-app:latest
```


## API Documentation

/start - Initiates the call to CallMe service

```bash
  curl -X 'POST' 'http://localhost:8000/start' -H 'Content-Type: application/json' -d '{"url": "http://example_service_url:8000/hello"}'
```

/hello - Captures the message from CallMe service

```bash
  curl -X 'POST' 'http://localhost:8000/hello' -H 'Content-Type: application/json' -d '{"hello": "some text"}'
```

/callback_data - Retrieve the message sent by Call Me service

```bash
  curl -X 'GET' 'http://localhost:8000/callback_data' -H 'accept: application/json'
```

/health - Health Status of API

```bash
  curl -X 'GET' 'http://localhost:8000/health' -H 'Content-Type: application/json'
```

## CI/CD Flow

![CI/CD Overview](./docs/CI_CD.drawio.png)