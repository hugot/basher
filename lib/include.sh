include() {
  declare package="$1"
  declare file="$2"

  if [ -z "$package" ] || [ -z "$file" ]; then
    echo "Usage: include <package> <file>" >&2
    return 1
  fi

  if [ ! -e "$BASHER_PREFIX/packages/$package" ]; then
    echo "Package not installed: $package" >&2
    return 1
  fi

  if [ -e "$BASHER_PREFIX/packages/$package/$file" ]; then
    source "$BASHER_PREFIX/packages/$package/$file" >&2
  else
    echo "File not found: $BASHER_PREFIX/packages/$package/$file" >&2
    return 1
  fi
}
