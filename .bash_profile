for file in ~/.{bashrc,profile,exports,aliases,aliases_work,functions,utilities}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
