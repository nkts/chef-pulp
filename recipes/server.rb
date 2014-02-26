#
# Cookbook Name:: pulp
# Recipe:: server
#
# Copyright 2014, Marius Karnauskas
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
package 'pulp-server' do
    action [ :install ]
end

directory '/etc/pulp/logging' do
    recursive true
    not_if { ::File.directory?('/etc/pulp/logging') }
end

directory '/etc/pulp/server/plugins.conf.d' do
    recursive true
    not_if { ::File.directory?('/etc/pulp/server/plugins.conf.d') }
end

template '/etc/pulp/server.conf' do
    source 'server.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
end

directory '/etc/httpd/conf.d' do
    recursive true
    not_if { ::File.directory?('/etc/httpd/conf.d') }
end

template '/etc/httpd/conf.d/pulp.conf' do
    source 'pulp.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[httpd]'
end