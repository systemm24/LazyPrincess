#!/bin/bash

# Check if UPSTREAM_REPO is set and non-empty
if [ -z "$UPSTREAM_REPO" ]; then
  echo "Cloning main Repository"
  git clone https://github.com/lazyindu/test1.git /LazyPrincess
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO"
  git clone "$UPSTREAM_REPO" /LazyPrincess
fi

# Navigate to the /LazyPrincess directory
cd /LazyPrincess || { echo "Failed to change directory to /LazyPrincess"; exit 1; }

# Install required Python packages
pip3 install -U -r requirements.txt || { echo "Failed to install Python packages"; exit 1; }

# Start the bot
echo "Starting Bot...."
python3 bot.py || { echo "Failed to start the bot"; exit 1; }
