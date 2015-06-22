class role::aws {
  include ::profiles::ntp
  include ::profiles::python
  include ::profiles::packages
}