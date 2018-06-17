================
config-formula
================

A SaltStack formula that puts directories onto minions. It will take the directory structure in ``config/files/`` and recursively copy it onto a minion.
By default, it copies the directory structure to ``/app/config/`` on the minion.
Different directories can be put into different locations by specifying a ``base_location`` in the pillar data. See ``pillar.example``.
Files can be jinja templated.

**NOTE**

See the full `Salt Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``config``
------------

Installs the directories found in ``config/files/``.
