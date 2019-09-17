# deploy-container

In order to make deploys go faster, we use this container that has the tools required to deploy already baked in. It's faster to get circle to just pull this then run off to the races.

### Building

This is built by Docker Hub and stored there so it's public. This is necessasry so that Circle can pull it and run it.