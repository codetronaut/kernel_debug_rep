#!/bin/sh

git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git fetch linux-next
git fetch --tags linux-next
git checkout master
git remote update
git tag -l "next-*" | tail
git checkout -b my_local_branch `git tag -l "next-*" | tail -n 1`
