#!/usr/bin/env bash
# vim:sts=2:ts=2
#
#

[ "$1" == "" ] && {
  echo
  echo "Usage: $0 [-v] <dir-path>"
  echo
  exit 1
}

[ "$1" == "-v" ] && _verbose="true"

_msg() {
	[ "${_verbose}" == "true" ] && echo $@
}

##
## Step 0: create a temp file
##
_tmp_list="./dup.$(date '+%Y-%m-%d.%s').$(pwd | tr '/' '_' | tr ' ' '-').txt"
cat <<HEADER > "${_tmp_list}"
## Args: [$@]
## Date: [$(date '+%Y-%m-%d-%H:%M:%S')]
##
HEADER


##
## Step 1: Use MD5 to id each file
##
for _path in "$@"
do
	# not DIR: skip
	[ ! -d "${_path}" ] && continue

	_msg "# Path: [${_path}]"

	# removes trailing '/', if exists
  find "${_path%/*}" -type f | while read _file
  do
		_msg "# File: ['${_file}']"
		_md5=$(md5sum  "${_file}" | awk '{print $1'})
		echo "${_md5} ['${_file}']" >> "${_tmp_list}"
  done
done


##
## Step 2: find duplicates based on MD5 hash
##
awk '{print $1}' "${_tmp_list}" | grep -v '^#' | sort | uniq -d | while read _dup
do
  echo ""
	echo "== Dup: [${_dup}]"
	grep "${_dup}"  "${_tmp_list}"
done


##
## Final
##
_msg ""
_msg "##"
_msg "## Total files: $(grep -v '^#' ${_tmp_list} | wc -l )"
_msg "## Duplicates: $(sort  ${_tmp_list} | awk '{print $1}' | grep -v '^#' | uniq -d | wc -l)"
_msg "##"

