# CI/CD Goat's Docker-in-Docker daemon (the `docker` service of upstream's docker-compose.yaml):
# the same docker:20.10.21-dind image, pinned by digest, with that service's `environment:`
# (TLS off) and `command:` (GitLab's registry trusted over HTTP) baked in, as Isoloom specs carry
# neither.
FROM docker:20.10.21-dind@sha256:3153fa63f54628783638632ace7aa3d0f4bfb9f04ae43400122451257f9c8990
ENV DOCKER_TLS_CERTDIR=""
CMD ["--insecure-registry=gitlab:5050"]
