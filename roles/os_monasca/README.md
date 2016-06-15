os_monasca
==========

Install and configure OpenStack Monasca.

The following services are installed:
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

.. literalinclude:: ../../defaults/main.yml
   :language: yaml

Dependencies
------------

none

Example Playbook
----------------

.. code-block:: yaml

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
