class tallsam {
  include tallsam::git
  include tallsam::shell
  include tallsam::ubuntu
  include tallsam::vim
  include tallsam::gui
  include tallsam::drupal

  Class['tallsam::ubuntu'] ->
    Class['tallsam::git'] ->
    Class['tallsam::shell'] ->
    Class['tallsam::gui'] ->
    Class['tallsam::vim'] ->
    Class['tallsam::drupal']
}

Class['tallsam']
