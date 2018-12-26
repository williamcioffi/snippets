# testrepo

how to contribute and not mess up.

## general workflow

1. make a fork
2. make a branch
3. make some changes
4. make a pull request
5. discuss. any updates to the branch connected to the pull request will autoupdate the PR.

## details

### set the original upstream for your forked repo
1. list the current remote repo

`git remote -v`

2. add the upstream (original)

`git remote add upstream https://github.com/original_owner/original_repo.git`

3. check to see it was added

`git remove -v`

### sync your fork with the original
1. fetch

`git fetch upstream`

2. checkout the master branch (you shouldn't be changing this one)

`git checkout master`

3. merge the upstream master to your local copy of master

`git merge upstream/master`

this should be a fast forward because you don't make changes to the master you make them to other branches.

4. push

### making a new branch
1. make it

`git checkout -b new-branch`

2. push it to the remote

`git push -u origin new-branch`

### before making a pull request
1. make sure your branch is up to date

`git pull origin new-branch`

2. make sure your master is up to date (see above)

3. make sure your branch is up to date with master

`git checkout new-branch`

`git pull origin master`

*I'm confused by how this works... what about your changes that you made on purpose?*

### make pull request

do it on github

### delete old branch

github automatically suggests if the PR goes ok

on the local can do:

`git branch -d new-branch`

