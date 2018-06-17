# -*- coding: utf-8 -*-
# vim: ft=sls
{% set directories = salt['pillar.get']('config_formula:lookup:directories', {'default': {'base_location': '/app/config'}}) %}
{% set files_found = salt['cp.list_master_dirs']() %}
{% set files = files_found | select('match', '^config/files/') | list %}


{% for dir, data in directories.items() %}
{% if files | length > 0 %}
{% for file in files %}
{{dir}}_files_on_disk:
  file.recurse:
    - name: {{ data.base_location }}
    - source: salt://config/files/{{ file|split('/')|last }}
    - clean: True
    - template: jinja
    - include_empty: True
{% endif %}
{% endfor %}
