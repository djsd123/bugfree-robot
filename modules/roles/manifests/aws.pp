class roles::aws {
# This role needs to be chopped up into smaller roles and named appropriately
  include ::profiles::ntp
  include ::profiles::python_tools
  include ::profiles::packages
  include ::profiles::users
  include ::profiles::logstash_forwarder
  include ::profiles::log_rotation
  include ::profiles::se_linux
  include ::profiles::monit_service
  include ::profiles::sudoers
  include ::profiles::env_variables
  include ::profiles::drvapp
}