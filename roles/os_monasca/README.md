os_monasca
==========

Install and configure OpenStack Monasca.

The following services are installed:
- Chrony
- MariaDB
- Zookeeper
- Kafka
- Storm
- InfluxDB
- Grafana
- monasca-api
- monasca-persister
- monasca-notification
- monasca-thresh

Requirements
------------

none

Role Variables
--------------

    ## Monasca
    monasca_common_git_repo: "https://git.openstack.org/openstack/monasca-common.git"
    monasca_api_git_repo: "https://git.openstack.org/openstack/monasca-api.git"
    monasca_persister_git_repo: "https://git.openstack.org/openstack/monasca-persister.git"
    monasca_notification_git_repo: "https://git.openstack.org/openstack/monasca-notification.git"
    monasca_thresh_git_repo: "https://git.openstack.org/openstack/monasca-thresh.git"
    monasca_ui_git_repo: "https://git.openstack.org/openstack/monasca-ui.git"
    monasca_client_git_repo: "https://git.openstack.org/openstack/python-monascaclient.git"
    monasca_git_branch: "master"
    
    ## Grafana
    grafana_plugins_git_repo: "https://github.com/twc-openstack/grafana-plugins.git"
    grafana_plugins_git_branch: "v2.6.0"
    grafana_git_repo: "https://github.com/twc-openstack/grafana.git"
    grafana_git_branch: "v2.6.0-keystone"
    
    ## Keystone
    keystone_ip_address: "127.0.0.1"
    # admin credentials
    os_username: "admin"
    os_password: "secretadmin"
    os_project_name: "admin"
    
    # monasca-user credentials
    os_mon_username: "mini-mon"
    os_mon_password: "password"
    os_mon_project_name: "mini-mon"
    
    # monasca-read-only-user credentials
    os_mon_read_only_username: "monasca-read-only-user"
    os_mon_read_only_password: "password" 
    
    # monasca-agent credentials
    os_mon_agent_username: "monasca-agent"
    os_mon_agent_password: "password"
    
    ## Database
    mysql_root_pass: "secretdatabase"
    
    ## InfluxDB
    influxdb_version: "0.9.5"
    
    ## Kafka
    base_kafka_version: "0.8.1.1"
    kafka_version: "2.9.2-{{ base_kafka_version }}"
    
    ## Storm
    storm_version: "1.0.1"
    storm_logback_dir: "log4j2"
    
    ## NTP
    ntp_servers:
      - ntp.lsd.ufcg.edu.br
    
    ## System info
    monasca_system_user_name: monasca
    monasca_system_group_name: monasca
    monasca_system_shell: /bin/false
    monasca_system_comment: monasca system user
    monasca_system_user_home: "/var/lib/{{ monasca_system_user_name }}"
    
    pip_install_options: ""
    
    monasca_required_pip_packages:
      - virtualenv
      - virtualenv-tools
      - httplib2
    
    # Common pip packages
    monasca_pip_packages:
      - python-keystoneclient
      - keystoneauth1
      - simport

Dependencies
------------

none

Example Playbook
----------------

    - name: Install Monasca
      hosts: monasca
      user: root
      roles:
        - { role: "os_monasca", tags: [ "os-monasca" ] }
      vars:
        - keystone_ip_address: "{{ groups['devstack'][0] }}"

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
