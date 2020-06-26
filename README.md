# Dockerfile run DAOBet from latest snapshot

## Build
```bash
docker build . -t daobet-from-snapshot
```

## Run

```bash
docker run --env ENV_NAME=mainnet --env DO_S3_KEY_ID=<SECRET_S3_KEY_ID> --env DO_S3_KEY_SECRET=<SECRET_S3_KEY> daobet-from-snapshot:latest
```
