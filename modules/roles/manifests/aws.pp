class roles::aws {
  include ::profiles::ntp
  include ::profiles::python_tools
  include ::profiles::packages
  include ::profiles::users
}