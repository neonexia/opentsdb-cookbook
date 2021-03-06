#
# Cookbook Name:: opentsdb
# Recipe:: intall
#
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

include_recipe 'opentsdb::prepare'

remote_file '/tmp/opentsdb-2.0.1.noarch.rpm' do
	source 'https://github.com/OpenTSDB/opentsdb/releases/download/v2.0.1/opentsdb-2.0.1.noarch.rpm'
end

package 'opentsdb.noarch' do
	action :install
	source '/tmp/opentsdb-2.0.1.noarch.rpm'
	provider Chef::Provider::Package::Rpm
end
