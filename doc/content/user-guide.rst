EMC ScaleIO Fuel Plugin User Guide
==================================

Once the Fuel ScaleIO plugin has been installed (following
`Installation Guide`_), you can create an *OpenStack* environments that
uses ScaleIO as the block storage backend.

Prepare infrastructure
----------------------

TODO


Select Environment
------------------

#. Create a new environment with the Fuel UI wizard. Select "Juno on CentOS 6.5" from OpenStack Release dropdown list and continue until you finish with the wizard.

   .. image:: images/wizard.png
      :width: 80%

#. Add VMs to the new environment according to `Fuel User Guide <https://docs.mirantis.com/openstack/fuel/fuel-6.1/user-guide.html#add-nodes-to-the-environment>`_ and configure them properly.


Plugin configuration
--------------------

#. Go to the Settings tab and scroll down to "ScaleIO Fuel Plugin" section. You need to fill all fields with your preferred ScaleIO configuration. If you don't know the purpose of a field you can leave it with its default value.

   .. image:: images/settings.png
      :width: 80%

#. Take the time to review and configure other environment settings such as the DNS and NTP servers, URLs for the repositories, etc.


Finish environment configuration
--------------------------------

#. Go to the Network tab and configure the network according to your environment.

#. Run `network verification check <https://docs.mirantis.com/openstack/fuel/fuel-6.1/user-guide.html#verify-networks>`_

#. Press `Deploy button <https://docs.mirantis.com/openstack/fuel/fuel-6.1/user-guide.html#deploy-changes>`_ to once you are done with environment configuration.

#. After deployment is done, you will see in Horizon that all Cinder hosts use ScaleIO as a backend.

   .. image:: images/horizon.png
      :width: 80%


ScaleIO verification
--------------------

Once the OpenStack cluster is setup, we can make use of ScaleIO volumes. This is an example about how to attach a volume to a running VM.

#. Login into the OpenStack Cluster:

    .. image:: images/horizon-login.png
       :width: 80%

#. Review the block storage services by navigating to the "Admin -> System -> System Information" section. You should see the ScaleIO volume.

    .. image:: images/block-storage-services.png
       :width: 80%

#. Review the System Volumes by navigating to "Admin -> System -> Volumes". You should see the ScaleIO volume type:

    .. image:: images/volume-type.png
       :width: 80%

#. Create a new OpenStack volume using the ScaleIO volume type.

    .. image:: images/new-volume.png
       :width: 80%

#. Review the newly created volume.

    .. image:: images/review-new-volume.png
       :width: 80%

#. In the ScaleIO Control Panel, you will see that there is one volume defined but none have been mapped yet.

    .. image:: images/sio-volume-defined.png
       :width: 80%

#. Once the volume is attached to a VM, the ScaleIO Control Panel will reflect the mapping.

    .. image:: images/sio-volume-mapped.png
       :width: 80%
