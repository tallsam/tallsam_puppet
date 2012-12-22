class tallsam {
  package { 'vim':
    ensure => installed,
  }
  file { '/home/dev/.vimrc':
    source => '.vimrc',
    owner => 'dev',
    group => 'dev',
    mode => '640',
    require => Package['vim'],
  }
}

class{'tallsam': }
