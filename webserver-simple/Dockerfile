# FROM ansible/ubuntu-ansible:stable
# or, for example, FROM ansible/ubuntu14.04-ansible:stable

# Latest Ubuntu LTS
FROM ubuntu:14.04
RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts

# Add playbooks to the Docker image
ADD ansible Ansible
WORKDIR Ansible

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local

# Other Dockerfile directives are still valid
EXPOSE 22 3000 80
ENTRYPOINT ["/usr/local/bin/apachectl", "-DFOREGROUND"]
