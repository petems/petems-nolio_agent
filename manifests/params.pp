# == Class nolio_agent::params
#
# This class is meant to be called from nolio_agent.
# It sets variables according to platform.
#
class nolio_agent::params {
  case $::osfamily {
    'Debian': {
      $nolio_version             = '5_0_2_b78'
      $agent_id                  = $::fqdn
      $agent_port                = 6600
      $install_dir               = '/opt/Nolio/NolioAgent/'
      $execution_server_host     = 'dummy'
      $execution_server_port     = 6600
      $execution_server_secure   = true
      $agent_mapping_application = ''
      $agent_mapping_environment = ''
      $agent_mapping_servertype  = ''
      $temp_dir                  = '/var/tmp'
      $nolo_install_script_dir   = '/var/tmp'
      $check_connectivity        = 'false'
    }
    'RedHat', 'Amazon': {
      $nolio_version             = '5_0_2_b78'
      $agent_id                  = $::fqdn
      $agent_port                = 6600
      $install_dir               = '/opt/Nolio/NolioAgent/'
      $execution_server_host     = 'dummy'
      $execution_server_port     = 6600
      $execution_server_secure   = true
      $agent_mapping_application = ''
      $agent_mapping_environment = ''
      $agent_mapping_servertype  = ''
      $temp_dir                  = '/var/tmp'
      $nolo_install_script_dir   = '/var/tmp'
      $check_connectivity        = 'false'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
