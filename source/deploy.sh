#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf public/*

hugo -t hugo-lamp

vim -s test.text public/404.html
vim -s test.text public/index.html
vim -s test.text public/post/index.html
vim -s test.text public/post/blogpost/index.html
vim -s test.text public/post/page/1/index.html
vim -s test.text public/tags/index.html

vim public/index.html
vim public/post/blogpost/index.html

cp -R public/* ../docs
cd ../docs

git add .
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"

git push origin master

cd ../source
