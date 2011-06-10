# path to export files     	
EXPORTPATH=/tmp/test/
       # url of repository
REPOS=file:///home/user/repos/projekt/
       # path to repository
REPOSPATH=/home/user/repos/projekt/
# last revision	
REV="$( svnlook youngest $REPOSPATH )"

# function to list and export file by file
pathexport() # $1
{
mkdir -p $EXPORTPATH${2%/*}
svn export --force $1$2 $EXPORTPATH$2
}

# make export path
mkdir -p $EXPORTPATH
# list all changed files 
for i in $( svnlook changed -r $REV $REPOSPATH ); do
  if [ "${#i}" -gt "2" ] 
      then pathexport $REPOS $i
  fi
done