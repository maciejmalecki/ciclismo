#!/bin/bash

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

ls -al

git stash
git remote rm origin
git remote add origin https://maciejmalecki:"$GITHUB_TOKEN"@github.com/maciejmalecki/ciclismo.git

ls -al

#mv adoc/img out-adoc
find . -maxdepth 1 ! -name 'doc' ! -name '.git' ! -name '.gitignore' ! -name '.circleci' -exec rm -rf {} \;
mv doc/build/docs/asciidoc/* .
rm -R doc/

ls -al

git add -fA
git commit --allow-empty -m "$(git log main -1 --pretty=%B)"
git push -f origin main:gh-pages

echo "published successfully"
