# -*- coding: utf-8 -*-
# vim: ft=sls
{% set location = salt['pillar.get']('config_formula:lookup:base_location', '/app/config') %}
{% set files_found = salt['cp.list_master_dirs']() %}


{% if files_found | select('match', '^config') | list | length > 2 %}
files_on_disk:
  file.recurse:
    - name: {{ location }}
    - source: salt://config/files
    - clean: True
    - template: jinja
    - include_empty: True
{% endif %}
