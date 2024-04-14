#!/bin/bash
## Watches fixtures and runs Cypress if any changes

DIR=`dirname $0`
SPECS=$DIR/cypress/e2e
FIXTURES=$DIR/cypress/fixtures

if [ ! -d $FIXTURES ]; then
    echo "*** Error: Directory $FIXTURES does not exist"
    echo
    exit
fi

echo "Watching for  changes in [$FIXTURES] ..."
inotifywait -r -e close_write,moved_to,create -m $FIXTURES |
while read -r directory events filename; do
  echo $filename changed!

  echo "Debounce: $(timeout 8 cat | wc -l) more change(s) included."
  echo "Running Tests  ..."
  cypress run
done
