# SquareNumber

## Swift AWS Lambda Runtime

Here is the offical [Swift AWS Lambda Runtime](https://github.com/swift-server/swift-aws-lambda-runtime/).

## Getting started with Swift on AWS Lambda (Part 1)

Here is the tutoial that this project is based on [Getting started with Swift on AWS Lambda](https://fabianfett.de/getting-started-with-swift-aws-lambda-runtime).

## Calling the Lambda Function

### Run from Terminal

```bash
curl --header "Content-Type: application/json" \
    --request POST \
    --data '{"number": 9}' \
    http://localhost:7000/invoke
```

## Build your Code for the AWS Lambda Environment

### Building with Docker

```zsh
docker run \
    --rm \
    --volume "$(pwd)/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    swift build --product SquareNumber -c release
```

```fish
docker run \
    --rm \
    --volume (pwd)"/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    swift build --product SquareNumber -c release
```

## Packing your Executable for Deployment

```zsh
docker run \
    --rm \
    --volume "$(pwd)/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    scripts/package.sh SquareNumber
```

```fish
docker run \
    --rm \
    --volume (pwd)"/:/src" \
    --workdir "/src/" \
    swift-lambda-builder \
    scripts/package.sh SquareNumber
```

## Create your first HTTP endpoint with Swift on AWS Lambda (Part 2)

Here is the tutoial that this project is based on [Create your first HTTP endpoint with Swift on AWS Lambda](https://fabianfett.de/swift-on-aws-lambda-creating-your-first-http-endpoint)
