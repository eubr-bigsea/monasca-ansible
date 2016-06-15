os_monasca_agent
================

Install and configure OpenStack Monasca Agent.

The following service is installed:
- monasca-agent

Requirements
------------

none

Role Variables
--------------

    ## Monasca
    monasca_agent_git_repo: "https://git.openstack.org/openstack/monasca-agent.git"
    monasca_git_branch: "master"
    monasca_ip_address: "127.0.0.1"
    
    ## Keystone
    keystone_ip_address: "127.0.0.1"
    os_username: "admin"
    os_password: "secretadmin"
    os_project_name: "admin"
    
    ## Database
    mysql_root_pass: "secretdatabase"
    
    ## System info
    monasca_system_user_name: monasca
    monasca_system_group_name: monasca
    monasca_system_shell: /bin/false
    monasca_system_comment: monasca system user
    monasca_system_user_home: "/var/lib/{{ monasca_system_user_name }}"
    
    monasca_agent_required_pip_packages:
      - virtualenv
      - virtualenv-tools
      - httplib2
    
    # Common pip packages
    monasca_agent_pip_packages:
      - simport
      - psutil==3.0.1
      - PyMySQL
      - MySQL-python
      - kafka-python==0.9.2

Dependencies
------------

none

Example Playbook
----------------

    - name: Install Monasca Agent
      hosts: monasca-agent
      user: root
      roles:
        - { role: "os_monasca_agent", tags: [ "os-monasca-agent" ] }
      vars:
        - keystone_ip_address: "{{ groups['devstack'][0] }}"
        - monasca_ip_address: "{{ groups['monasca'][0] }}"

Tested on
---------

Ubuntu 14.04 trusty tahr

Author Information
------------------
Flávio Ramalho

flaviosr@lsd.ufcg.edu.br

License
-------
Apache
