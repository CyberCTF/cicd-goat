# Upstream

| Dir | Repository | Version | Commit | Licence |
| --- | --- | --- | --- | --- |
| app | https://github.com/cider-security-research/cicd-goat | 1.2.7 | 0ed10925f3983857cf219b2ac1c327b861fcccca | Apache-2.0 |

`app/` is that release, unchanged, without its Git history (it holds the solutions in
`app/solutions/`: spoilers). The machines run upstream's images published for this release on
Docker Hub (`cidersecurity/goat-*:1.2.7`, built by upstream's release workflow from `app/`),
pinned by digest in `isoloom.yml` and `build/*/Dockerfile`, with `localstack/localstack:3.0.2` and
`docker:20.10.21-dind` as upstream's compose file names them. To update, replace `app/` with a
newer release, then this table and the digests.
