#!/bin/sh
# CI/CD Goat's setup has finished: the challenge repositories exist in Gitea (Wonderland
# organization) and GitLab (setup done, alice's projects), and CTFd lists the challenges to alice.
set -u
get() { curl -sS --max-time 20 "$@" 2>/dev/null; }
get http://gitea:3000/api/v1/repos/search?limit=50 -u thealice:thealice | grep -q '"full_name"' || { echo "gitea repositories"; exit 1; }
# GitLab's set-up (Terraform, repositories, registry images) ends by creating alice's token:
# wait for it, up to 25 minutes.
i=0
until get "http://gitlab/api/v4/projects?private_token=998b5802ec365e17665d832f3384e975" | grep -q '"path_with_namespace"'; do
  i=$((i + 1)); [ $i -lt 100 ] || { echo "gitlab projects"; exit 1; }; sleep 15
done
get http://jenkins-server:8080/login | grep -qi jenkins || { echo "jenkins login page"; exit 1; }
echo "Gitea and GitLab hold the challenge repositories; Jenkins answers"
