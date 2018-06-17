# -*- coding: utf-8 -*-
# vim: ft=sls
{% set directories = salt['pillar.get']('config_formula:lookup:directories', {'default': {'base_location': '/app/config'}}) %}
{% set files_found = salt['cp.list_master_dirs']() %}
{% set files = files_found | select('match', '^config/files/') | list %}

{% set result = [] %}
{% for dir in files %}
{% do result.append(dir.split('/')|last) %}
{% endfor %}

{% set dir_result = {} %}
{% for name in result %}
{% if directories.get(name) %}
{% do dir_result.update({name: {'base': directories[name]['base_location']}}) %}
{% else %}
{% do dir_result.update({name: {'base': '/app/config'}}) %}
{% endif %}
{% endfor %}

{% for name, base in dir_result.iteritems() %}
{{name}}_files_on_disk:
  file.recurse:
    - name: {{ base.base }}/{{ name }}
    - source: salt://config/files/{{ name }}
    - clean: True
    - template: jinja
    - include_empty: True
{% endfor %}

