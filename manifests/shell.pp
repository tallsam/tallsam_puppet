class tallsam::shell {
  file { '.bashrc':
    path    => '/home/dev/.bashrc',
    ensure  => file,
    source  => "puppet:///modules/tallsam/.bashrc",
  }
}

class{'tallsam::shell': }
