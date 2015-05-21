# == Class nolio_agent::install
#
# This class is called from nolio_agent for install.
#
class nolio_agent::install
(
  $nolio_version             = '5_0_2_b78'
  $nolo_install_script_dir   = '/var/tmp'
  $nolio_install_script_name = 'nolio_agent_linux_${nolio_version}.sh'
  $install_script_flags      = '-q'
  $varfile_location          = '/var/tmp/agent.silent.varfile'
)
{

  $nolio_install_script_full_path = "${nolo_install_script_dir}/${nolio_install_script_name}"

  # Make sure install script is executable
  file { $nolio_install_script_full_path:
    ensure => file,
    mode   => '0755',
  }
  ->
  # This executes the install for the Nolio agent based on a response file created from the install class
  exec { "${nolio_install_script_full_path} $install_script_flags -varfile ${temp_dir}/agent.silent.varfile":
    cwd     => '/var/tmp/nolio/',
    creates => '/opt/Nolio/NolioAgent',
  }

}
