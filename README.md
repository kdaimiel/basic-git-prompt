Basic Git Prompt for Bash.

## Usage

Prompt will add branch name under a git repository. For example:

`~/basic-git-prompt$ (master)`



Git status is based on colors:
- <span style="color:red">(master)</span> Local repository has commits to be push.
- <span style="color:yellow">(master)</span> Local repository has changes to be committed.
- <span style="color:blue">(master)</span> Local repository has differences.
- <span style="color:cyan">(master)</span> Local repository has untracked files.
- <span style="color:green">(master)</span> Local repository is up to date.

## Installation

Easy way of installation via git.

```sh
  cd ~
  git clone https://github.com/kdaimiel/basic-git-prompt.git .basic-git-prompt
```
Add to ~/.bashrc:

```sh
  source ~/.basic-git-prompt/git-prompt.sh
```
