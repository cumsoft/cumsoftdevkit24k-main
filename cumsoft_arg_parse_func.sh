#!/usr/bin/env sh

# Usage: 
# $ ./foo here is -v an option --output foo.txt command here
# verbose mode
# Output file is 'foo.txt'


  while [ $# -gt 0 ] ; do
    x="$1"; shift
    case "$x" in
      -v|--verbose)
         echo "verbose mode" ;;
      -o|--output)
         OUTFILE="$1" ; shift ;
         echo "Output file is '$OUTFILE'" ;;
    esac
  done

