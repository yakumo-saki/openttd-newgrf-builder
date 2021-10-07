# OpenTTD-newgrf-Builder container

Dockerfile for compiling NewGRFs.  


## usage

### Method 1 auto build (use make for compiling)

```
docker run -e GIT_REPO=https://example.com/someuser/newgrf -e GIT_BRANCH=branch -v `pwd`/result:/result yakumosaki/openttd-newgrf-builder
```

Built NewGRF is '' on your current directory.

#### NOTES

* first part of -v must be a full path. Use (pwd)/result.grf for fish users.
* -e GIT_BRANCH=main is optional. Can omit when using default branch.

### Method 2 Use this image using manual build

```
docker run -it --entrypoint bash yakumosaki/openttd-newgrf-builder
```

and manualy build or do something.

```
docker cp containerid:filepath hostpath
```


