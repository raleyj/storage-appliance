# VCF Storage Appliance

The VCF Storage Appliance is a deployable Ubuntu-based OVA that consolidates three common VMware Cloud Foundation lab services behind one hardened web-management interface:

- SFTP backup targets with per-client authentication, quotas, and approved-network controls
- A private Harbor registry for OCI images and Helm charts
- A publisher for subscribed vCenter Content Libraries

Version **1.1.0** is the current general-availability build.

## Download

Download the assets from the [v1.1.0 release](https://github.com/raleyj/storage-appliance/releases/tag/v1.1.0).

The OVA is larger than GitHub's per-file upload limit, so it is distributed as two numbered parts. Download both parts and either reassembly script, then reconstruct the OVA before deployment.

### Windows PowerShell

```powershell
.\Join-Storage-Appliance-1.1.0.ps1
```

### Linux or macOS

```bash
chmod +x join-storage-appliance-1.1.0.sh
./join-storage-appliance-1.1.0.sh
```

Expected OVA SHA-256:

```text
8f3f304f9cff0814d4573e730c422cf52cb4c8e8491ee12d473b690e1d675ea1
```

## What changed in 1.1.0

- The default web administrator is `admin`, with support for 15-character passwords.
- SFTP account management now uses readable account cards and supports generated-password reveal/copy, enable, disable, remove, quota, authentication, and approved-client-network controls.
- Harbor day-2 administration is integrated into the appliance interface for projects, repositories, artifacts, members, and robot accounts.
- The Content Library page shows published catalog items and supports publish, update, and withdrawal workflows.
- Appliance Status, management, updates, certificates, administrator accounts, themes, navigation, and status caching have been refined.
- The first-deployment workflow initializes the selected containerized services from the appliance interface.

## Deployment

Deploy `Storage-Appliance-1.1.0.ova` through the vCenter **Deploy OVF Template** workflow. The deployment form collects:

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

The exact 1.1.0 OVA passed 167 Linux unit and security tests, OVF manifest and signed-checksum verification, VMware OVF Tool checks, and an import/first-boot smoke test with standard login enforcement. The 1.0.3 release remains the most recently completed full guided-setup and end-to-end service qualification baseline.

See the smoke-validation record and SPDX SBOM in the release metadata archive.

## Supported scope and limitations

- Target platform: VMware vCenter/ESXi 9.1.0, Ubuntu Server 24.04 LTS guest
- Harbor vulnerability-database refresh and offline vulnerability scanning are not supported
- Product-specific restore workflows require separate qualification
- Appliance and service-data backup is intentionally not included

No license is granted unless a license file is added to this repository.
