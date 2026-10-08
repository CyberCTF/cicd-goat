# CI/CD Goat's GitLab: upstream's published image for release 1.2.7, built by upstream's CI from
# app/gitlab/, pinned by digest. The only difference from upstream's docker-compose.yaml: its
# GITLAB_OMNIBUS_CONFIG `environment:` value is baked in here (the same settings, one per
# statement), as Isoloom specs carry no environment, plus one setting: two Puma workers
# (`puma['worker_processes'] = 2`). Omnibus otherwise starts one per CPU of the Docker host
# (six here, about 700 MB each), and the stack then ran out of an 8 GB Docker host's memory.
FROM cidersecurity/goat-gitlab:1.2.7@sha256:94b295f0d4dc2529b9db78ae217a232aa4c68ec08c367f2f6c93c631e3cb4b0b
ENV GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab'; registry_external_url 'https://gitlab:5050'; letsencrypt['enable'] = false; gitlab_rails['initial_shared_runners_registration_token'] = 'GR1348hansd87fyzDiqyZeuHuxe'; gitlab_rails['smtp_enable'] = false; gitlab_kas['enable'] = false; sentinel['enable'] = false; logrotate['enable'] = false; pages_nginx['enable'] = false; grafana['enable'] = false; prometheus_monitoring['enable'] = false; alertmanager['enable'] = false; puma['worker_processes'] = 2"
