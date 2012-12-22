class tallsam::lamp {
  package { 'php5':
    ensure => installed,
  }
  file {'/etc/php.ini':
    ensure => file,
  }
  package { 'php-apc':
    ensure => installed,
    require => Package['php5'],
  }
  package { 'apache2-mpm-itk':
    ensure => installed,
  }
  package { 'libapache2-mod-upload-progress':
    ensure => installed,
  }
  package { 'mysql-server':
    ensure => installed,
  }
  package { 'php5-mysql':
    ensure => installed,
    require => Package['mysql-server'],
  }
  package { 'mytop':
    ensure => installed,
    require => Package['mysql-server'],
  }
  package { 'php5-xdebug':
    ensure => installed,
    require => Package['php5'],
  }
  package { 'memcached':
    ensure => installed,
  }
  package { 'varnish':
    ensure => installed,
  }
  service { 'mysql':
    ensure => running,
    enable => true,
    require => Package['mysql-server'],
  }
  service { 'apache2':
    ensure => running,
    enable => true,
    require => Package['apache2-mpm-itk'],
    subscribe => File['/etc/php.ini'],
  }
}

class{'tallsam::lamp': }
