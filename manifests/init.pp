# == Class: nolio_agent
#
# Full description of class nolio_agent here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class nolio_agent (
  $nolio_version             = $::nolio_agent::params::nolio_version
  $agent_id                  = $::nolio_agent::params::agent_id
  $agent_port                = $::nolio_agent::params::agent_port
  $nolio_agent_install_dir   = $::nolio_agent::params::install_dir
  $execution_server_host     = $::nolio_agent::params::execution_server_host
  $execution_server_port     = $::nolio_agent::params::execution_server_port
  $execution_server_secure   = $::nolio_agent::params::execution_server_secure
  $agent_mapping_application = $::nolio_agent::params::agent_mapping_application
  $agent_mapping_environment = $::nolio_agent::params::agent_mapping_environment
  $agent_mapping_servertype  = $::nolio_agent::params::agent_mapping_servertype
  $temp_dir                  = $::nolio_agent::params::temp_dir
  $nolo_install_script_dir   = $::nolio_agent::params::nolo_install_script_dir
  $check_connectivity        = $::nolio_agent::params::check_connectivity
) inherits ::nolio_agent::params {

  # validate parameters here

  class { '::nolio_agent::config': } ->
  class { '::nolio_agent::install': }


}
