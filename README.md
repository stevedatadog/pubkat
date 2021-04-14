# pubkat

A utility for publishing scenarios to katacoda during development.

## Background
This utility assumes you're working in a larger repository and that you only want to publish a specific directory to a separate Katacoda scenario repository. For example, I have `/Users/stephen/Code/LearningLabs` which is a clone of the Datadog Learning Center repository. I don't want the entire LearningLabs repository in my personal Katacoda repository. I only want the scenarios I'm working on.

During development of a new course, e.g. `new-course`, I want to periodically publish my work to my personal Katacoda scenario repository, which is in `/Users/stephen/Code/katacoda-scenarios`. I used to manually copy `LearningLabs/new-course` to `katacoda-scenarios/new-course`. Then I would git add, commit, and push to trigger the github webhook that would update https://www.katacoda.com/stevecalnan/courses/new-course. Now, I just type the following:

```
cd ~/Code/LearningLabs/new-course
pubkat .
```

## Usage
1. Clone this repository: `git clone git@github.com:stevedatadog/pubkat.git`
2. Link `pubkat` to somewhere convenient in your executable `$PATH`: `ln -s pubkat/pubkat.sh ~/bin/pubkat`
3. Make it executable: `chmod u+x ~/bin/pubkat`
3. Set the environment variable `KATACODA_DIR` to the path to your local Katacoda scenario repository: `export KATACODA_DIR=~/Code/katacoda-scenarios`.

For new scenarios, you must manually create the destination directory in your Katacoda scenarios repository. For example, `mkdir ~/Code/katacoda-scenarios/new-course`. This is a safeguard to prevent pubkat from doing horrible things, like pushing your entire home directory to your remote Katacoda scenario repository. (Not a true story, but I came close.)

`pubkat [source path] [optional commit message]` 

If you don't provide a commit message, a random commit message will be created for you consisting of one of these emojis: 😺 😸 😹 😻 😼 😽 🙀 😿 😾.

`pubkat ~/Code/LearningLabs/new-course "My low-value commit message"`

