for file in ~/.{bashrc,profile,exports,aliases,functions,utilities}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
