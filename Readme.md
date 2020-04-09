# deploy-container

In order to make deploys go faster, we use this container that has the tools required to deploy already baked in. It's faster to get circle to just pull this then run off to the races.

### Building

This is built by automatically by Docker Hub and stored there so it's public. This is necessary so that Circle can pull it and run it.

If you want to build it manually, you can run this process:


```
docker build -t superpro/deploy-container:latest .
docker push superpro/deploy-container:latest
```