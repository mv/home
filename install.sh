#!/usr/bin/env bash
#
# mv/home (git repos) install
# Marcus Vinicius Ferreira  ferreira.mv[ at ]gmail.com
#
#    git clone git://github.com/mv/home mv_home
#


_copy() {
  printf "==== home: copy    %-50s  %s\n"  "[${1}]" "[${2}]"
  /bin/cp "${1}"  ${2}
}

_lnsnf() {
  printf "==== home: link    %-50s  %s\n"  "[${1}]" "[${2}]"
  ln -snf  "${1}"  ${2}
}

_save() {
  if [[ -L ${1} ]]
  then echo "==== home: save    ${1}: skipping..."
  elif [[ -f ${1} ]]
  then echo "==== home: save    ${1}: saved"
       /bin/cp ${1}  ${1}.$( date '+%s' )
  else echo "==== home: save    ${1}: ignore..."
  fi
}


DIR=$( pwd $(dirname "${0}") )

echo
echo "==== home: install [${0}] "
echo "==== home: dir     [${DIR}] "

_save ~/.bashrc
_save ~/.bash_profile
_copy ${DIR}/bashrc       ~/.bashrc
_copy ${DIR}/bash_profile ~/.bash_profile


for f in ${DIR}/dot.*
do
  _lnsnf "${f}"  ~/.${f#*dot.}
done

_lnsnf  ${DIR}/bin    ~/bin
_lnsnf  ${DIR}/bash.d ~/bash.d


cd ~/bin/  && _lnsnf ssh-clearssh.sh Matching
cd ~/bin/  && _lnsnf ssh-clearssh.sh Offending

_save ~/.gitconfig
_copy  ${DIR}/gitconfig ~/.gitconfig
