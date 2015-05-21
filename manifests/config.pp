# == Class nolio_agent::config
#
# This class is called from nolio_agent for service config.
#
class nolio_agent::config
(
  $nolio_varfile_location = '/var/tmp/'
)
{

  file{ "${nolio_varfile_location}/nolio/agent.silent.varfile":
    ensure   => file,
    content  => template("nolio_agent/var/tmp/nolio/agent.silent.varfile.erb"),
    replace  => true,
  }

}
