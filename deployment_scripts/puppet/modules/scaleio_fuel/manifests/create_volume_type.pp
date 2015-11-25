class scaleio_fuel::create_volume_type {

  $scaleio            = $::fuel_settings['scaleio']
  $protection_domain  = $scaleio['protection_domain']
  $storage_pool       = $scaleio['storage_pool']
  $volume_type        = 'sio_thin'

  exec { "Create Cinder volume type \'${volume_type}\'":
    command => "bash -c 'source /root/openrc; cinder type-create ${volume_type}'",
    path    => ['/usr/bin', '/bin'],
    unless  => "bash -c 'source /root/openrc; cinder type-list |grep -q \" ${volume_type} \"'",
  } ->

  exec { "Create Cinder volume type extra specs for \'${volume_type}\'":
    command => "bash -c 'source /root/openrc; cinder type-key ${volume_type} set sio:pd_name=${protection_domain} sio:provisioning_type=thin sio:sp_name=${storage_pool}'",
    path    => ['/usr/bin', '/bin'],
    onlyif  => "bash -c 'source /root/openrc; cinder type-list |grep -q \" ${volume_type} \"'",
  }
}