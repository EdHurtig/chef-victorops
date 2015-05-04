#
# Cookbook Name:: victorops
# Recipe:: default
#
# Copyright 2015 Eddie Hurtig
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

%w(
  api_key
  routing_key
).each do |attr|
  if node['victorops'][attr].empty?
    fail "The node['victorops']['#{attr}'] attribute is empty, please set it."
  end
end

# Default endpoints can be specified with attributes, but really should
# be specified in the cookbook that will be notifying victorops itself
node['victorops']['endpoints'].each do |name, routing_key|
  victorops_endpoint name do
    routing_key routing_key
    action :nothing
  end
end
