# victorops [![Build Status](https://travis-ci.org/edhurtig/chef-victorops.svg)](https://travis-ci.org/edhurtig/chef-victorops)

Adds LWRPs for reporting to VictorOps during a chef-client run

# Recipes

## default

Configures a few default endpoints if specified in the `node['victorops']['endpoints']` hash

# Resources

## `victorops_endpoint`

```ruby
victorops_endpoint "disk_space.warning/#{node['fqdn']}" do
   routing_key 'ops'
   action :warning
   only_if { ... }
end

some_resource 'bleah' do 
    notifies :critical, "victorops_endpoint[disk_space.warning/#{node['fqdn']}]"
end
```

**Attributes**

Most of these attributes map to fields for the [VictorOps REST API](http://victorops.force.com/knowledgebase/articles/Integration/Alert-Ingestion-API-Documentation/)

* `name` String (name attribute)
  * The entity_id for the incident    
* `routing_key` String. Default `node['victorops']['routing_key']`
  * The Routing Key for the Incident. 
* `api_key` String.  Default `node['victorops']['api_key']`
  * Your Victorops API Key.  
* `state_message` String.  Default `node['victorops']['state_message']`
  * The message to pass into the incident report 
* `entity_is_host` Boolean.  Default `node['victorops']['entity_is_host']`
  * Used within VictorOps to select the appropriate display format for the incident.
* `monitoring_tool` String.  Default `node['victorops']['monitoring_tool']`
  * Used within VictorOps to select the appropriate display format for the incident.
* `entity_display_name` Boolean.  Default `node['victorops']['entity_display_name']`
  * Used within VictorOps to select the appropriate display format for the incident.
* `state_start_time` Integer. 
  * The time that the problem started.  Defaults to the current time
* `base_url` String.  Default `node['victorops']['base_url']`
  * The base URL to the Victorops API
`
# Usage

Include this recipe in a wrapper cookbook:

```
depends 'victorops', '~> 1.0'
```

```
include_recipe 'victorops::default'
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests with `kitchen test`, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Author:: Eddie Hurtig (eddie@hurtigtechnologies.com)
