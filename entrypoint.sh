#!/bin/bash -eu

if [ "$GIT_REPO" = "NONE" ]; then
    echo "Git repository not specified."
    echo "Method 1) Use this image using automated build. (make)"
    echo "docker run -e GIT_REPO=https://example.com/.git -v `pwd`/result.grf:/result.grf yakumosaki/openttd-newgrf-builder"
    echo "Built NewGRF is 'result.grf' on your current directory"
    echo "NOTE: first part of -v must be a full path. Use (pwd)/result.grf for fish users."
    echo "-"
    echo "Method 2) Use this image using manual build."
    echo "docker run -it --entrypoint bash yakumosaki/openttd-newgrf-builder"
    echo "    --- and manualy build ---"
    echo "docker cp containerid:filepath hostpath"
    echo ""
    exit 127
fi

echo "====================================================="
echo "Clone repo"
echo "====================================================="
git clone $GIT_REPO newgrf
cd newgrf

echo "====================================================="
echo "Build"
echo "====================================================="
make

echo "====================================================="
echo "Copy artifact"
echo "====================================================="
echo "Find *.grf"
find . -type f -name *.grf

NEWGRF=`find . -type f -name *.grf | head -n 1`
echo "artifact is $NEWGRF. copying to /result.grf"
cp $NEWGRF /result.grf

echo "*****************************************************"
echo "                      Done"
echo "*****************************************************"
