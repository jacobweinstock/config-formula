# -*- coding: utf-8 -*-
# vim: ft=sls
{% set directories = salt['pillar.get']('config_formula:lookup:directories', {'default': {'base_location': '/app/config')}} %}
{% set files_found = salt['cp.list_master_dirs']() %}


{% for dir, base_location in directories.items() %}
{% if files_found | select('match', '^config') | list | length > 2 %}
{{dir}}_files_on_disk:
  file.recurse:
    - name: {{ base_location }}
    - source: salt://config/files
    - clean: True
    - template: jinja
    - include_empty: True
{% endif %}
{% endfor %}
