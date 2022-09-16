#!/usr/bin/env bash

#
# To prevent debug code from being accidentally committed, simply add a comment near your
# debug code containing the keyword DONTCOMMIT and this script will abort the commit.
#
if git commit -v --dry-run | grep --color -B 2 -A 2 'DONTCOMMIT'  #>/dev/null 2>&1
then
  RED='\033[0;31m'
  BLUE='\033[0;34m'
  NC='\033[0m' # No Color
  echo -e "${RED}ERROR${NC}"
  echo "Trying to commit non-committable code."
  echo -e "Remove the ${BLUE}DONTCOMMIT${NC} string and try again."
  exit 1
fi
exit 0
