# NFT Leverage

## Factory

Uses an immutable beacon for the logic to be deployed

Deploys new Beacon Proxies
The address of the proxy is used as ID for the NFT

Mints a new NFT with the ID to the user
The ownership of the NFT is the ownership of the Proxy

The proxy implements LeverageLogic, and can be interacted directly