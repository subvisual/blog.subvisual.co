$data = hiera('gb-blog')

gb::ruby { 'ruby-2.2.0': }

gb::postgresql { 'gb-blog':
  password => $data[db_password]
}

gb::capistrano { 'gb-blog': }

gb::nginx_conf { 'gb-blog':
  path => 'config/nginx.conf',
}
