#!/bin/bash
for branch in $(git branch | grep -v '^*'); do
  read -p "Would you like to delete $branch? (y/n)" -N 1 answer
  if [[ "$answer" == "y" ]]; then
    git branch -D "$branch"
    printf "\nDeleted $branch\n"
  else
    printf "\nSkipping $branch\n"
  fi
done
