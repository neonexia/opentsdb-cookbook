#
# Author:: Christophe Furmaniak
#
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
#
include_recipe "opentsdb::init_opentsdb"


log "Starting opentsdb if not already running"
template "/etc/opentsdb/opentsdb.conf" do
	source "opentsdb.conf.erb"
	mode "0644"
end

service 'opentsdb' do
	status_command 'service opentsdb status'
	supports [:restart => true, :reload => false, :status => true]
	action :start
end
