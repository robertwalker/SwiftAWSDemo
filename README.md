# SquareNumber

## Swift AWS Lambda Runtime

Here is the offical [Swift AWS Lambda Runtime](https://github.com/swift-server/swift-aws-lambda-runtime/).

## Part 1: Getting started with Swift on AWS Lambda

Here is the tutoial that this project is based on [Getting started with Swift on AWS Lambda](https://fabianfett.de/getting-started-with-swift-aws-lambda-runtime).

### Calling the Lambda Function with a simple JSON payload

```zsh
# bash, zsh or fish
curl --header "Content-Type: application/json" \
    --request POST \
    --data '{"number": 9}' \
    http://localhost:7000/invoke
```

### Build SquareNumber Code for the AWS Lambda Environment

#### Building SquareNumber with Docker

```zsh
# bash or zsh
docker run \
    --rm \
    --volume "$(pwd)/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    swift build --product SquareNumber -c release
```

```fish
# fish
docker run \
    --rm \
    --volume (pwd)"/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    swift build --product SquareNumber -c release
```

### Packing SquareNumber Executable for Deployment

```zsh
# bash or zsh
docker run \
    --rm \
    --volume "$(pwd)/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    scripts/package.sh SquareNumber
```

```fish
# fish
docker run \
    --rm \
    --volume (pwd)"/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    scripts/package.sh SquareNumber
```

## Part 2: Create your first HTTP endpoint with Swift on AWS Lambda

Here is the tutoial that this project is based on [Create your first HTTP endpoint with Swift on AWS Lambda](https://fabianfett.de/swift-on-aws-lambda-creating-your-first-http-endpoint)

### Calling the Lamba Function Locally with AWS API Gateway Request

```zsh
# bash, zsh or fish
curl --header "Content-Type: application/json" \
    --request POST \
    --data '{
        "routeKey":"POST /hello",
        "version":"2.0",
        "rawPath":"/hello",
        "stageVariables":{},
        "requestContext":{
            "timeEpoch":1587750461466,
            "domainPrefix":"hello",
            "accountId":"0123456789",
            "stage":"$default",
            "domainName":"hello.test.com",
            "apiId":"pb5dg6g3rg",
            "requestId":"LgLpnibOFiAEPCA=",
            "http":{
              "path":"/hello",
              "userAgent":"Paw/3.1.10 (Macintosh; OS X/10.15.4) GCDHTTPRequest",
              "method":"POST",
              "protocol":"HTTP/1.1",
              "sourceIp":"91.64.117.86"
            },
            "time":"24/Apr/2020:17:47:41 +0000"
        },
        "body": "{\"name\":\"Fabian\"}",
        "isBase64Encoded":false,
        "rawQueryString":"",
        "headers":{
            "host":"hello.test.com",
            "user-agent":"Paw/3.1.10 (Macintosh; OS X/10.15.4) GCDHTTPRequest",
            "content-length":"0"
        }
    }' \
    http://localhost:7000/invoke
```

### Build HelloWorld Code for the AWS Lambda Environment

#### Building HelloWorld with Docker

```zsh
# bash or zsh
docker run \
    --rm \
    --volume "$(pwd)/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    swift build --product HelloWorld -c release
```

```fish
# fish
docker run \
    --rm \
    --volume (pwd)"/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    swift build --product HelloWorld -c release
```

### Packing HelloWorld Executable for Deployment

```zsh
# bash or zsh
docker run \
    --rm \
    --volume "$(pwd)/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    scripts/package.sh HelloWorld
```

```fish
# fish
docker run \
    --rm \
    --volume (pwd)"/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    scripts/package.sh HelloWorld
```

### Calling the Lamba Function Locally with AWS API Gateway Request

```zsh
# bash, zsh or fish
curl --header "Content-Type: application/json" \
    --request POST \
    --data '{"name": "fabian"}' \
    https://{gatewayid}.execute-api.{region}.amazonaws.com/hello
```
