class tallsam::ubuntu {

  # Openssh

  package { "openssh-server":
    ensure => installed,
  }

  service { "openssh-server":
    ensure => running,
    enable => true,
    require => Package["openssh-server"],
  }

  # Disable screensaver lock and screen off, which make no sense on a VM.
  exec {
    "disable screensaver lock":
      command => "/bin/sh -c 'DISPLAY=:0 dconf write /org/gnome/desktop/screensaver/lock-enabled false'",
      onlyif  => "/bin/sh -c 'test $(DISPLAY=:0 dconf read /org/gnome/desktop/screensaver/lock-enabled) = true'",
      user    => $testuser,
      require => Package["dconf-tools", "ubuntu-desktop"],
    ;
    "disable screen off":
      command => "/bin/sh -c 'DISPLAY=:0 dconf write /org/gnome/desktop/session/idle-delay \"uint32 0\"'",
      onlyif  => "/bin/sh -c 'test $(DISPLAY=:0 dconf read /org/gnome/desktop/session/idle-delay) != \"uint32 0\"'",
      user    => $testuser,
      require => Package["dconf-tools", "ubuntu-desktop"],
  }
}
