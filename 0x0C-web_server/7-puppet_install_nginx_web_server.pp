#!/usr/bin/env bash
# Configuring and Automating server using puppet

package { 'nginx':
  ensure => installed,
}

# manages the Nginx configuration file located at /etc/nginx/sites-available/default
file_line { 'install':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.github.com/Emedo586 permanent;',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

#  manages the Nginx service.
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
