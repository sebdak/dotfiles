jwtd () {
  if [ ! -x "$(command -v jq)" ]; then
    echo 'Install jq to use jwtd'
    return 1
  fi
  local input="${1:-}"
  if [ -z "$input" ]; then
    if [ ! -t 0 ]; then
      input=$(cat /dev/stdin)
    else
      echo >&2 '✗ Need an argument or have a piped input!'
      return 1
    fi
  fi
  echo "$input" \
    | jq -Rrce 'split(".")[1] | . + "=" * (. | 4 - length % 4)' \
    | openssl base64 -d -A \
    | jq .
}
