
# aws-profile -l #| fzf
# cat ~/.aws/config | awk '/^\[profile / {print $2}' | tr -d ']'
cat ~/.aws/config | grep -E '^\[profile ' | tr -d ']' | awk '{print $2}'

