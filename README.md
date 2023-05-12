Simple bash tool to recover files quarantined by ClamAV or other antivirus to their original place parsing a log. 

usage syntax is './clamav-recover.sh /dir/clamav.log --restore

if no --restore flag - it will just find and display what moved files found in a log.

It's using regex to identify which file were moved where.

magic regex is here "s/\(.*\): moved to '\(.*\)'/\1/p"

detected string is 
path/file.ext: moved to 'path/file.ext'

this format used by ClamAV, you may adopt it for antivirus or other tools you're using.

PS

This tool was written due to solution not found over WWW.

Somehow ClamAV found many false-positive files and moved it in one quarantine folder.
The log I got - han neccesary information, so i written it in bash i do not know :) so sorry for some ugly code if any.
Your feedback is always appreciated! BR
