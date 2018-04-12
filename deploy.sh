#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

TARGET_BRANCH="gh-pages"
OUT_DIR="gh-pages"

IP=`ip addr show | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
AUTHOR_EMAIL=`git log -1 --pretty=format:'%an'`

git config --global user.name "Jenkins@$IP"
git config --global user.email "$AUTHOR_EMAIL"

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

# Remove gh-pages just in case it exists (it may if Jenkins re-runs job in the same workspace directory)
rm -rf ${OUT_DIR}
# Clone the existing gh-pages for this repo into out/
# Create a new empty branch if gh-pages doesn't exist yet (should only happen on first deply)
git clone ${REPO} ${OUT_DIR}

cd ${OUT_DIR}

git checkout ${TARGET_BRANCH} || git checkout --orphan ${TARGET_BRANCH}

##echo "ls after checkout"
##ls

# Clean out existing contents
# rm -rf ./${OUT_DIR}/**/* || exit 0
rm -rf *
rm -f ./.gitattributes
rm -f ./.gitignore
rm -rf ./.idea/*

##echo "ls after rm -rf"
##ls

##git status

cd ..
cp *.pdf ${OUT_DIR}/

cd ${OUT_DIR}

# echo "ls after doCompile"
# ls

if [ -z `git diff --exit-code` ]; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
git add -A

echo "git status:"
git status

git commit -m "Deploy to GitHub Pages: ${SHA}"

eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa

# Now that we're all set up, we can push.
git push ${SSH_REPO} ${TARGET_BRANCH}