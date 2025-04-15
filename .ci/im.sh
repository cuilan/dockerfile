#!/usr/bin/env bash

set -e

MESSAGE=`echo $1`

generate_post_data()
{
  cat <<EOF
{
  "content": {
    "text": "$MESSAGE"
  },
  "msg_type": "text"
}
EOF
}

curl -X "POST" "https://open.feishu.cn/open-apis/bot/v2/hook/xxxxxxxxxxx" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d "$(generate_post_data)"
