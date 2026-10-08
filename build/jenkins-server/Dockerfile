# CI/CD Goat's Jenkins server: upstream's published image for release 1.2.7, built by upstream's
# CI from app/jenkins-server/, pinned by digest. One difference: the JVM heap is capped at
# 768 MB (upstream sets no -Xmx, so the JVM sizes itself from the Docker host's memory; next to
# GitLab on an 8 GB Docker host, the kernel's OOM killer then killed Jenkins' JVM). JAVA_OPTS
# keeps upstream's value otherwise.
FROM cidersecurity/goat-jenkins-server:1.2.7@sha256:8269915551f861ec426ae5b99f3b5b8f9f3fc3332dd1bc64eb24c072e5605b23
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Xmx768m"
