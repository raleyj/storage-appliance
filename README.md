# Lab Storage Appliance

The Lab Storage Appliance is a deployable Ubuntu-based OVA that consolidates three common vSphere lab services behind one hardened web-management interface:

- SFTP backup targets with per-client authentication, quotas, and approved-network controls
- A private Harbor registry for OCI images and Helm charts
- A publisher for subscribed vCenter Content Libraries

Version **1.0.3** is the current general-availability build.

## Download

Download the assets from the [v1.0.3 release](https://github.com/raleyj/storage-appliance/releases/tag/v1.0.3).

The OVA is larger than GitHub's per-file upload limit, so it is distributed as two numbered parts. Download both parts and either reassembly script, then reconstruct the OVA before deployment.

### Windows PowerShell

```powershell
.\Join-Storage-Appliance-1.0.3.ps1
```

### Linux or macOS

```bash
chmod +x join-storage-appliance-1.0.3.sh
./join-storage-appliance-1.0.3.sh
```

Expected OVA SHA-256:

```text
7127a943e863643fb932b71a4df63e954fb2dcbc47d43e96d55c1ad488d05bea
```

## Deployment

Deploy `Storage-Appliance-1.0.3.ova` through the vCenter **Deploy OVF Template** workflow. The deployment form collects:

- VM and appliance hostname
- DNS domain
- DHCP or static IPv4 configuration
- DNS and NTP servers
- Web administrator, restricted-console recovery, and Harbor bootstrap credentials
- Initial management-network access policy

After first boot, open `https://<appliance-fqdn>/admin/`, install a trusted HTTPS certificate, and use the guided first-deployment workspace to initialize the required services.

## Security model

- No Ubuntu login, host SSH service, web terminal, or generic shell API
- Default-deny host and container-ingress firewall
- Separate service filesystems for SFTP, Harbor, and Content Library data
- Masked OVA credential properties that can be cleared after initialization
- Signed appliance updates with rollback to the prior software release
- Restricted VMware console workflow for web-administrator recovery

## Qualification

The exact 1.0.3 OVA was deployed to vCenter and passed:

- 165 Linux unit and security tests
- OVF manifest, signed checksum, and VMware OVF Tool verification
- DHCP first boot and guided service initialization
- SFTP upload/download, quota, key rotation, cross-account isolation, and no-shell checks
- Harbor private-project, authenticated administration, OCI push/pull, and resumable upload checks
- Content Library authentication, VCSP v2 metadata, and range-resume checks
- Firewall rollback, service lifecycle, reboot persistence, and restricted-console recovery

The disposable qualification VM was removed after the test run. See the release qualification record and SPDX SBOM in the release metadata archive.

## Supported scope and limitations

- Target platform: VMware vCenter/ESXi 9.1.0, Ubuntu Server 24.04 LTS guest
- Harbor vulnerability-database refresh and offline vulnerability scanning are not supported
- Product-specific restore workflows require separate qualification
- Appliance and service-data backup is intentionally not included

No license is granted unless a license file is added to this repository.
