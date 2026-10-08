# CI/CD Goat

[CI/CD Goat](https://github.com/cider-security-research/cicd-goat) by Cider Security (now Palo
Alto Networks): a deliberately vulnerable CI/CD environment with eleven challenges against real
pipelines, covering the OWASP Top 10 CI/CD security risks. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the nine machines of
upstream's `docker-compose.yaml`. The source is vendored unchanged in [`app/`](app) (spoilers in
`app/solutions/`).

| Machine | Services |
| --- | --- |
| ctfd | CTFd on 8000 (challenges and hints; alice / alice) |
| jenkins-server | Jenkins on 8080 (alice / alice), agents 50000 |
| jenkins-agent | SSH 22 (Jenkins agent) |
| gitea | Gitea on 3000 (thealice / thealice) |
| gitlab | GitLab on 80, published on 4000 (alice / ali12345), registry 5050 |
| gitlab-runner | GitLab runner (Docker executor) |
| docker | Docker-in-Docker daemon on 2375 |
| prod | Lighttpd on 80 (published 8008), SSH 22 (published 2222) |
| localstack | LocalStack 3.0.2 on 4566 |

## Run it

```bash
isoloom generate
isoloom up docker
isoloom test docker
```

Then log in to CTFd at http://localhost:8000/ as alice / alice. Upstream allows 5 minutes for the
set-up; GitLab takes 10 to 15 minutes on first start. Heavy: about 6 GB of memory (GitLab alone
about 3.5 GB). The network needs the internet at runtime: GitLab's set-up runs `terraform init`
(provider download) and the runners pull their job images.

Differences from upstream's compose file:

- The machines run upstream's images published for release 1.2.7, pinned by digest, not
  `latest`. They are not rebuilt from `app/`: upstream's own instructions use the published
  images, and a rebuild today would drift (unpinned pip packages in the Jenkins agent, Jenkins
  plugin dependencies resolved against today's update centre for a 2022 Jenkins core).
- Isoloom specs carry no `environment:` or `command:`: the values upstream's compose file sets
  (the Jenkins agent's SSH key, GitLab's `GITLAB_OMNIBUS_CONFIG`, the DinD daemon's TLS setting
  and insecure registry) are baked into thin images in [`build/`](build).
- So the stack fits an 8 GB Docker host, Jenkins' heap is capped at 768 MB and GitLab runs two
  Puma workers (Omnibus starts one per CPU otherwise); without this the kernel killed Jenkins'
  JVM while GitLab set itself up.
- Container names become the machines' host names, as upstream's images expect.

Lab guide: upstream's [README](app/README.md) and the hints in CTFd. Upstream version and commit:
[UPSTREAM.md](UPSTREAM.md).

## Licence

Apache-2.0, as CI/CD Goat ([LICENSE](LICENSE)), copyright Cider Security. The images bundle
third-party software under their own licences: Jenkins (MIT), Gitea (MIT), GitLab EE (the GitLab
Enterprise Edition licence; it runs here without a subscription, as Free tier features), CTFd
(Apache-2.0), LocalStack (Apache-2.0) and Docker (Apache-2.0). This environment is deliberately
vulnerable: keep it isolated.
