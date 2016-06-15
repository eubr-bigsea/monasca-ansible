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

.. literalinclude:: ../../defaults/main.yml
   :language: yaml

Dependencies
------------

none

Example Playbook
----------------

.. code-block:: yaml

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
