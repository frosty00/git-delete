#!/bin/bash
for branch in $(git branch | sed 's/^*//'); do
  current_branch=$(git branch | grep -e '^*')
  if [[ "* $branch" == "$current_branch" ]]; then
    printf "Skipping $branch\n"
    continue
  fi
  read -p "Would you like to delete $branch? (y/n)" -N 1 answer
  if [[ "$answer" == "y" ]]; then
    git branch -D "$branch"
    printf "\nDeleted $branch\n"
  else
    printf "\nSkipping $branch\n"
  fi
done
