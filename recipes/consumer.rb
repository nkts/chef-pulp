#
# Cookbook Name:: pulp
# Recipe:: consumer
#
# Copyright 2014-2015, Marius Karnauskas
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
# Will consume Pulp repositories?!
#
%w(pulp-consumer-client pulp-rpm-consumer-extensions).each do |pkg|
  package pkg do
    action :install
  end
end

directory '/etc/pulp/consumer/conf.d' do
end

template '/etc/pulp/consumer/consumer.conf' do
  source 'consumer.conf.erb'
  variables :config => node['pulp']['consumer']
end
