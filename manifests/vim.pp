class tallsam::vim {

  package { 'vim':
    ensure => installed,
  }

  package { 'curl':
    ensure => installed,
  }

  file { '/home/dev/.vimrc':
    source => 'puppet:///modules/tallsam/.vimrc',
    ensure => present,
    owner => 'dev',
    group => 'dev',
    mode => '640',
    require => Package['vim'],
  } 

  exec { "install_snipmate":
    command => 'git clone git://github.com/msanders/snipmate.vim.git snipmate;
                mv snipmate/* /home/dev/.vim/;
                rm -rf snipmate;
                chown dev:dev /home/dev/.vim -R;',
    logoutput => true,
    path => ["/usr/local/bin", "/bin", "/usr/bin"],
    require => Package['vim'],
  }

  exec { "install_syntastic":
    command => 'mkdir -p /home/dev/.vim/bundle;
                curl -so /home/dev/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;
                cd /home/dev/.vim/bundle; rm -rf syntastic; git clone https://github.com/scrooloose/syntastic.git;
                chown dev:dev /home/dev/.vim -R',
    logoutput => true,
    path => ["/usr/local/bin", "/bin", "/usr/bin"],
    require => Exec['install_snipmate'],
  }


}

class{'tallsam::vim': }
