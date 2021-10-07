#!/bin/bash -eu

if [ "$GIT_REPO" = "NONE" ]; then
    echo "Git repository not specified."
    echo "Method 1) Use this image using automated build. (make)"
    echo "docker run -e GIT_REPO=https://example.com/user/repo.git -e GIT_BRANCH=main -v `pwd`/result:/result yakumosaki/openttd-newgrf-builder"
    echo "Built NewGRF is 'result.grf' on your current directory"
    echo "NOTE: first part of -v must be a full path. Use (pwd)/result.grf for fish users."
    echo "NOTE: -e GIT_BRANCH=main is optional. Can omit when using default branch."
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

if [ "$GIT_BRANCH" != "NONE" ]; then
    echo "Switch to branch $GIT_BRANCH"
    git checkout $GIT_BRANCH
fi

echo ""
echo "====================================================="
echo "Build"
echo "====================================================="
make

echo ""
echo "====================================================="
echo "Copy artifact"
echo "====================================================="
echo "Find *.grf"
find . -type f -name "*.grf" | xargs -I{} cp -v {} /result/

#NEWGRF=`find . -type f -name *.grf | head -n 1`
#echo "artifact is $NEWGRF. copying to /result/result.grf"
#cp $NEWGRF /result.grf

echo ""
echo "*****************************************************"
echo "                      Done"
echo "*****************************************************"
