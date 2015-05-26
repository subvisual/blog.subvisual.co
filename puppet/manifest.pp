$data = hiera('blog.subvisual.co')

gb::ruby { 'ruby-2.2.2': }

gb::postgresql { 'blog.subvisual.co':
  password => $data[db_password]
}

gb::capistrano { 'blog.subvisual.co': }

gb::nginx_conf { 'blog.subvisual.co':
  path => 'config/nginx.conf',
}

package { 'bower':
  ensure   => present,
  provider => 'npm',
}
