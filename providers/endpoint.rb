action [:critical, :recovery] do
  # Use node attributes as fallbacks if resource variable is not set

  unless new_resource.instance_variable_get('@state_start_time')
    new_resource.state_start_time = Time.now.to_i
  end

  %w(
    routing_key
    base_url
    api_key
    state_message
    entity_is_host
    monitoring_tool
    entity_display_name
  ).each do |attr|
    unless new_resource.instance_variable_get("@#{attr}")
      new_resource.instance_variable_set("@#{attr}", node['victorops'][attr])
    end
  end

  content = {
    message_type: 'CRITICAL',
    timestamp: Time.now.to_i,
    entity_id: new_resource.name,
    state_message: new_resource.state_message,
    entity_is_host: new_resource.entity_is_host,
    monitoring_tool: new_resource.monitoring_tool,
    entity_display_name: new_resource.entity_display_name,
    state_start_time: new_resource.state_start_time
  }

  http_request 'notify victorops of critical situation' do
    url "#{new_resource.base_url}#{new_resource.api_key}/#{new_resource.routing_key}"
    message content.to_json
    action :post
  end
  
  new_resource.updated_by_last_action(true)
end
