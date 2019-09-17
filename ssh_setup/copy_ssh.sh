#!/usr/bin/env bash
set -euf -o pipefail

if [[ "${1:-}" == "" ]]; then
  >&2 echo "Give target ip as command line argument"
  exit 1
fi

PI_IP="$1"

echo "When prompted, use the password:"
echo "raspberry"
rsync -av ~/.ssh pi@"$PI_IP":~/
ssh-copy-id pi@"$PI_IP"
ssh pi@"$PI_IP" "rm ~/.ssh/config"
