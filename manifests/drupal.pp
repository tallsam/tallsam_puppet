class tallsam::drupal {
  package { 'php-pear':
    ensure => installed,
  }

  exec { "install_drush":
    command => 'pear channel-discover pear.drush.org;
                pear install drush/drush;
                drush --version;
                chown dev:dev /home/dev/.drush -R',
    logoutput => true,
    path => ["/usr/local/bin", "/bin", "/usr/bin"],
    require => Package['php-pear'],
  }

  exec { "install_vimrc":
    command => 'drush @none dl vimrc -y;
                rm ~/.vim/bundle/drupal-vimrc;
                ln -s /home/dev/.drush/vimrc/bundle/vim-plugin-for-drupal ~/.vim/bundle/drupal-vimrc;
                chown dev:dev /home/dev/.drush -R;
                chown dev:dev /home/dev/.vim -R;',
    logoutput => true,
    path => ["/usr/local/bin", "/bin", "/usr/bin"],
    require => Exec['install_drush'],
  }

}

class{'tallsam::drupal' :}
