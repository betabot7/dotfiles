#!/bin/bash
#************************************************************************
#*  Name      - Install diffconflicts
#*  Function  - installs diffconflicts script into /usr/local/bin and
#*                   registers with git
#*  Notes     - None
#*
#*  Copyright - (c) 2014, Kast Solutions.  All Rights Reserved.
#*
#*  Modifications
#*  Date      Who                    Description
#*  03-06-14  Keith Kastor           Initial Release
#************************************************************************
#

cp ./diffconflicts /usr/local/bin/diffconflicts

git config --global merge.tool diffconflicts
git config --global mergetool.diffconflicts.cmd 'diffconflicts vim $BASE $LOCAL $REMOTE $MERGED'
git config --global mergetool.diffconflicts.trustExitCode true
git config --global mergetool.diffconflicts.keepBackup false

echo "Done."
