class tallsam::gui {
  package { 'terminator':
    ensure => installed,
  }
  package { 'git':
    ensure => installed,
  }
  package { 'gcolor2':
    ensure => installed,
  }
  package { 'gimp':
    ensure => installed,
  }
  package { 'shutter':
    ensure => installed,
  }
}

class{'tallsam::gui': }
