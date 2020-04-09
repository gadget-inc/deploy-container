# deploy-container

In order to make deploys go faster, we use this container that has the tools required to deploy already baked in. It's faster to get circle to just pull this then run off to the races.

### Building

Run like so:

```
./build.sh
```

We build one image per ruby version in use by apps this thing supports, and tag each image with the ruby version so each app can be upgraded piecemeal.