#!/usr/bin/env bash
# get the name of the branch, only take actions when in main branch.
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
target="main"

PARENT_DIR="repo" # redundent comment for post-commit testing
PROJ_DIR="carcarpro"

if [ $branch = $target ]; then
    # echo -e "\033[1;31m This is red text \033[0m"
    echo -e "\033[1;31m [INFO] in main branch \033[0m"
    echo -e "\033[1;31m [INFO] make html \033[0m"
    make html

    echo -e "\033[1;31m [INFO] moving the generated html folder to /tmp dir \033[0m"
    mv "$HOME"/"$PARENT_DIR"/"$PROJ_DIR"/_build/html /tmp

    echo -e "\033[1;31m [INFO] checkout gh-pages branch \033[0m"
    git checkout gh-pages
    branchghpages=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
    targetghpages="gh-pages"
    if [ $branchghpages = $targetghpages ]; then
        echo -e "\033[1;31m [INFO] git pull in gh-pages branch \033[0m"
        git pull

        echo -e "\033[1;31m [INFO] copy html files to project dir \033[0m"
        cp -vr /tmp/html/* "$HOME"/"$PARENT_DIR"/"$PROJ_DIR"
        touch "$HOME"/"$PARENT_DIR"/"$PROJ_DIR"/.nojekyll 
        rm -rf /tmp/html

        echo -e "\033[1;31m [INFO] add & commit & push in gh-pages branch \033[0m"

        git add -A && git commit -m 'updated docs in gh-pages' && git push
        echo -e "\033[1;31m [INFO] checkout main & push updates \033[0m"

        git checkout $target && git push
        echo -e "\033[1;31m [INFO] Done \033[0m"
        # the ``yes`` prevents you to be prompted to confirm each overwrite
        # yes | copy -vr /tmp/html ~/PycharmProjects/$PROJ_DIR

    else
        echo -e "\033[1;31m [ERROR] checkout gh-pages failed \033[0m"
    fi
else
    echo -e "\033[1;31m [INFO] NOT in main branch, nothing to do for post-commit \033[0m"
fi