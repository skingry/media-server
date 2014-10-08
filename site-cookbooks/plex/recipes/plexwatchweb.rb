#
# Cookbook Name:: plex
# Recipe:: plexwatchweb
#
# Copyright 2014, Seth Kingry
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

include_recipe "nginx"
include_recipe "php-fpm"

git "/usr/share/nginx/plexWatchWeb" do
  repository "https://github.com/ecleese/plexWatchWeb.git"
  revision "master"
  action :sync
end

cookbook_file "/usr/share/nginx/plexWatchWeb/config/config.php"

template "/etc/nginx/sites-available/plexWatchWeb" do
  notifies :restart, "service[nginx]"
end

nginx_site "plexWatchWeb"

