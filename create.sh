#!/bin/bash

set -eu

if [ $# -eq 0 ]; then
    echo "Error: Please input the directory name" 1>&2
    exit 1
fi

dir=$1

branch_name=gh_pages
skelton_dir="$(pwd)/$(dirname ${0})/skelton"

(cd ${dir}
 # --- #
 git status > /dev/null 2>&1
 if [ $? -ne 0 ]; then
     echo "Error: The directory '${dir}' is not a git repository" 1>&2
     exit 1
 fi

 # --- #
 branch_count=$(git branch -a --list "*/${branch_name}" --list "${branch_name}" | wc -l)
 if [ ${branch_count} -ne 0 ]; then
     echo "Error: The git repository has already included ${branch_name} branch" 1>&2
     exit 1
 fi

 # --- If README is already exist, use it as a default README in the gh_pages branch --- #
 tempdir=$(mktemp -d "/tmp/create_gh_page_skelton.XXXXXX")
 readme=""
 for file_name in "README.md" "README.markdown" ; do
     if [ -f ${file_name} ] ; then
         readme=${file_name}
         break
     fi
 done
 
 if [ "${readme}" != "" ]; then
     cp -p ${readme} ${tempdir}
 fi
 
 git checkout --orphan gh-pages
 git rm -rf .
 ls
 cp -R ${skelton_dir}/* . -v
 
 if [ "${readme}" != "" ]; then
     cp -p ${tempdir}/${readme} .
 fi
 rm -rf ${tempdir}
 )
