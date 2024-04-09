#!/usr/bin/env sh
#.getopts

while getopts :o:h-: option
  do case $option in
         h ) print_help;;
         o ) output_file=$OPTARG;;
         - ) case $OPTARG in
                 help ) print_help;;
                 output-file=* ) output_file=${OPTARG##*=};;
                 * ) echo "bad option $OPTARG" >&2; exit 1;;
             esac;;
         '?' ) echo "unknown option: $OPTARG" >&2; exit 1;;
         : ) echo "option missing argument: $OPTARG" >&2; exit 1;;
         * ) echo "bad state in getopts" >&2; exit 1;;
     esac
  done
  shift $((OPTIND-1))
  (( $# > 0 )) && printf 'remaining arg: %s\n' "$@"
