# VCF Storage Appliance 1.4.0

This signed OVA contains SFTP backup, Harbor registry, Content Library, and optional Ubuntu host SSH management. The Ubuntu `admin` account uses a separate password, approved administrator CIDRs, and a configurable port. Host SSH is disabled on a new deployment until configured and enabled. The active offline Harbor bundle is version 2.14.6, and first-time creation of the Ubuntu admin account now creates its home directory.

The exact rebuilt OVA passed checksum, signature, manifest, OVF Tool, and 184 Linux unit tests. A new target vCenter deployment passed first boot, authenticated management, certificate import, SFTP transfer and quota, Harbor private OCI push and pull, Content Library publication and range download, subscribed vCenter library synchronization, first-time Ubuntu admin creation and password SSH, and service lifecycle and storage checks. SSH was disabled after the test. The temporary vCenter subscription library was removed.

This is a new-deployment OVA. An in-place 1.4.0 update and migration from earlier releases have not been qualified. Product-specific backup and restore remain site validation steps. The temporary DNS record, vCenter subscription library, and disposable test VM were removed after qualification.

Verify `SHA256SUMS.sig` against `SHA256SUMS` with `storage-release-public.pem`, then compare the OVA hash to `SHA256SUMS` before deployment. The OVA contains blank masked deployment password properties and no lab credentials.
