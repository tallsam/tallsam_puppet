class tallsam::git {
  package { 'git':
    ensure  => installed,
  }
  file { '.gitconfig':
    path    => '/home/dev/.gitconfig',
    ensure  => file,
    require => Package['git'],
    source  => "puppet:///modules/tallsam/.gitconfig",
  }
  file { '.git-completion.sh':
    path    => '/home/dev/.git-completion.sh',
    ensure  => file,
    require => Package['git'],
    source  => "puppet:///modules/tallsam/.git-completion.sh",
  }
}

class{'tallsam::git': }
