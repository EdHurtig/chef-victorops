actions :critital, :recovery, :info, :warning, :acknowledgement
default_action :critital

attribute :name, kind_of: String, name_attribute: true
attribute :routing_key, kind_of: String
attribute :api_key, kind_of: String

attribute :state_message, kind_of: String
attribute :entity_is_host, kind_of: [TrueClass, FalseClass]
attribute :monitoring_tool, kind_of: String
attribute :entity_display_name, kind_of: String
attribute :state_start_time, kind_of: Integer
attribute :base_url, kind_of: String
