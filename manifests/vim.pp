class tallsam::vim {
  package { 'vim':
    ensure => installed,
  }
  file { '/home/dev/.vimrc':
    source => 'puppet:///modules/tallsam/.vimrc',
    owner => 'dev',
    group => 'dev',
    mode => '640',
    require => Package['vim'],
  }
}

class{'tallsam::vim': }
