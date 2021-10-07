# OpenTTD-newgrf-Builder container

Dockerfile for compiling NewGRFs.

## usage

### Method 1 auto build (use make for compiling)

```
docker run -e GIT_REPO=https://example.com/someuser/newgrf -v `pwd`/result.grf:/result.grf yakumosaki/openttd-newgrf-builder
```

Built NewGRF is 'result.grf' on your current directory.

NOTE: first part of -v must be a full path. Use (pwd)/result.grf for fish users.

### Method 2 Use this image using manual build

```
docker run -it --entrypoint bash yakumosaki/openttd-newgrf-builder
```

and manualy build or do something.

```
docker cp containerid:filepath hostpath
```


