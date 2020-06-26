ENV=${ENV:-testnet}
DAOBET_DATA_DIR=${DAOBET_DATA_DIR:-/data}
DAOBET_CONFIG_DIR="/etc/daobet/configs/${ENV}"

# Donwload snapshot loader tool
wget https://github.com/DaoCasino/daobet-snapshot-loader/raw/master/snapshot-loader.py

# Download snapshot and save path
export ENV_NAME=${ENV}
export DOWNLOAD_PATH='/snapshots'
DAOBET_SNAPSHOT_PATH=$(python3 snapshot-loader.py --last-load)

# Clear old data if it already exists
rm -rf ${DAOBET_DATA_DIR}/*
rm -rf ${DAOBET_SNAPSHOT_PATH}/*

# Create daobet dirs
mkdir -p ${DAOBET_DATA_DIR}
mkdir -p ${DAOBET_SNAPSHOT_PATH}

# Start daobet node from snapshot
exec /usr/bin/daobet-node \
    -d ${DAOBET_DATA_DIR} \
    --config-dir ${DAOBET_CONFIG_DIR} \
    --genesis-json=${DAOBET_CONFIG_DIR}/genesis.json \
    --snapshot=${DAOBET_SNAPSHOT_PATH} \
    --disable-replay-opts
