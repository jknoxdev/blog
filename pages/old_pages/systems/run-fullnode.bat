
rem ---------------------- derp ----
rem ccminer.exe -o stratum+tcp://mine.moneropool.com:3333 -u YOUR_WALLET_ADDRESS -p x
rem ccminer-cryptonight.exe -o stratum+tcp://xmr-usa.dwarfpool.com:8100 -u 4BnZ4rNmbiv3qfK5YWSvGxUpM9vZL5TnJSYFeH78LrHBb1n2XnHHzC4gyWnVUuBzySMcLbyUeP8dtPBcZm5w7iTrZVFu6xSVSEi93KFZx3 -p techbiotic@icloud.com
rem ----------------------------------------------------------------------------------------------------





cd c:\Program Files\monero\monero-gui-v0.12.0.0
monerod.exe --log-level=1 --block-sync-size 10 --data-dir=D:\blockchains\monero

