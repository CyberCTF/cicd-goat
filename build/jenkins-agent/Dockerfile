# CI/CD Goat's Jenkins agent: upstream's published image for release 1.2.7, built by upstream's
# CI from app/jenkins-agent/, pinned by digest. The only difference from upstream's
# docker-compose.yaml: its `environment:` value (the Jenkins server's public key, which the agent
# accepts for SSH) is baked in here, as Isoloom specs carry no environment.
FROM cidersecurity/goat-jenkins-agent:1.2.7@sha256:b07415f10c9520b410ac3742f053c4744a38c368c87af349ce00264284b2ab43
ENV JENKINS_AGENT_SSH_PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC33zkdtvwp8giZLp1mVUbqzCKi0KIiWD8/towT0+9k1SCDYjJ/YVPqKidkSefYaKBgJ1yFcWa9qroXAUd5nACXN3Xdes2fe4w+xZ8GQTpqHKyStEHy6R9QXi00r/VxGcmBYZWLifEyzV//PiRC+hUaG27JeeBnkZ1FEOyXUunpaPixNaDkfnLbCimflkd2uYH2arMY+FdOH950ezow/+v4vsNrzoMwVVCCSg/dIJBS2G/JaoAbbQgIGo63Kyz0j++rIInsXMFmxhy9hEpViX/tEorFzGh4gUvJPLy3IDjWjUz/Nfte9By6usQjN/1plJcuP+rUqrjjGeMpfhDP6aq5ZvfuPTmXOVkWJ9vJZaK2BCtSZk1vOJR4luxCyUZQbKgb3jS9YZ4N1ZS26z3EKwJGP/acNtEMx2u2zhY7zXdG7ca1Qo1yeVDMRctlvH++KMEYX/ZR6LqYlJyV6TFICZVUT7dLF65gq68UyIFswMu9pQ8/VvIMkkO6eiU1cqFr8gc="
