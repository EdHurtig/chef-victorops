default['victorops']['base_url'] =
'https://alert.victorops.com/integrations/generic/20131114/alert/'

default['victorops']['api_key'] = ''
default['victorops']['routing_key'] = ''

default['victorops']['endpoints'] = []

default['victorops']['entity_is_host'] = true
default['victorops']['monitoring_tool'] = 'chef'
default['victorops']['entity_display_name'] = node['fqdn']

default['victorops']['ack_msg'] = ''
default['victorops']['ack_author'] = ''
