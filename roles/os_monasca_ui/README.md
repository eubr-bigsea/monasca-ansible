os_monasca_ui
=============

Configures the Monasca Monitoring dashboard on OpenStack Horizon.

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
 
    - name: Deploy monasca-ui on Horizon
      hosts: devstack
      user: root
      roles:
        - { role: "os_monasca_ui", tags: [ "os-monasca-ui" ] }
      vars:
        - grafana_ip_address: "{{ groups['monasca'][0] }}"

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
