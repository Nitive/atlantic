if [ ! "$(command -v composer)" ]; then
  echo "Installing Composer"
  brew install composer
fi
