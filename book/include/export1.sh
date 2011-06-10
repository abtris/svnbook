# path to export files 
EXPORTPATH=/home/user/export/projekt
# url of repository
REPOS=file:///home/user/repos/projekt/trunk/
# path to repository
REPOSPATH=/home/user/repos/projekt/
# last revision	
REV="$( svnlook youngest $REPOSPATH )"
# make export path
mkdir -p $EXPORTPATH
# svn force export (nothing to screen)
svn export --force $REPOS $EXPORTPATH  >> /dev/null
cd $EXPORTPATH
cd ..
# make tar.gz file for projekt 
tar -czvf projekt-R$REV-`date +%Y%m%d-%H%M%S`.tgz projekt >> /dev/null