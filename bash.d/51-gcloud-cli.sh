
#!/bin/bash
# vim:ft=sh:
#
# using gcp/google cloud cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2025-01:

###
### auto-completion
###
_location="
  /usr/share/google-cloud-sdk/completion.bash.inc
  /usr/local/share/google-cloud-sdk/completion.bash.inc
  /usr/local/etc/bash_completion.d/google-cloud-sdk
"

for _file in ${_location}
do
    if [ -f "${_file}" ]
    then source "${_file}" && break
    fi
done


###
### Config/default
###
# gcloud config set project      inoa-143500
# gcloud config set compute/zone us-central1-c

export CLOUDSDK_CORE_PROJECT=inoa-143500
export CLOUDSDK_COMPUTE_ZONE=us-central1-c

###
### PS1: gcp
###

function __gcp_ps1() {
  #
  # build the prompt:
  #
  [ "${CLOUDSDK_CORE_PROJECT}" ]  && _ps1="${CLOUDSDK_CORE_PROJECT}"
  [ "${CLOUDSDK_COMPUTE_ZONE}" ]  && _ps1="${_ps1}:${CLOUDSDK_COMPUTE_ZONE}"

  echo "[gcp:${_ps1}]"
}

###
### Utils
###
alias gcloud-projects="gcloud projects list"
#lias gcloud-project-desc="gcloud compute project-info describe"
