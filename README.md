# VCF Storage Appliance

The VCF Storage Appliance is a deployable Ubuntu-based OVA that consolidates three common VMware Cloud Foundation lab services behind one hardened web-management interface:

- SFTP backup targets with per-client authentication, quotas, and approved-network controls
- A private Harbor registry for OCI images and Helm charts
- A publisher for subscribed vCenter Content Libraries

Version **1.2.0** is the current general-availability build.

## Download

Download the assets from the [v1.2.0 release](https://github.com/raleyj/storage-appliance/releases/tag/v1.2.0).

The OVA is larger than GitHub's per-file upload limit, so it is distributed as two numbered parts. Download both parts and either reassembly script, then reconstruct the OVA before deployment.

### Windows PowerShell

```powershell
.\Join-Storage-Appliance-1.2.0.ps1
```

### Linux or macOS

```bash
chmod +x join-storage-appliance-1.2.0.sh
./join-storage-appliance-1.2.0.sh
```

Expected OVA SHA-256:

```text
6d153a7bc0839c66e44f84563a5f606e3935aafb36b5d20079fa3f8635057d15
```

Existing 1.1 deployments can use the signed `Storage-Appliance-1.2.0-update.tar.gz` package through **Appliance updates**. Its SHA-256 is `c67c6c7b005b51cd97d3595b54a4c551c06b05998c08dc3f6e80a6b008d19889`.

## What changed in 1.2.0

- Generated SFTP client passwords are now 19 characters, keeping them below 20 characters while preserving cryptographically secure random generation.
- Generated or newly entered SFTP passwords can be shown or copied before saving; saved password values remain non-retrievable and must be rotated if lost.
- SFTP account enable, disable, and remove controls remain directly beneath each account status. Removal requires a disabled account and preserves the backup directory and files.
- The deployment, administrator, and troubleshooting guides now document the 1.2 account lifecycle, password handling, signed update, and exact release validation.
- A signed in-place update was validated on the live appliance with accounts, service configuration, and stored data preserved.

## Deployment

Deploy `Storage-Appliance-1.2.0.ova` through the vCenter **Deploy OVF Template** workflow. After first boot, open `https://<appliance-fqdn>/admin/`, install a trusted HTTPS certificate, and use the guided first-deployment workspace to initialize the required services.

## Security model

- No Ubuntu login, host SSH service, web terminal, or generic shell API
- Default-deny host and container-ingress firewall
- Separate service filesystems for SFTP, Harbor, and Content Library data
- Masked OVA credential properties that can be cleared after initialization
- Signed appliance updates with rollback to the prior software release
- Restricted VMware console workflow for web-administrator recovery

## Qualification

The exact 1.2.0 OVA passed 167 Linux unit and security tests, OVF manifest and signed-checksum verification, VMware OVF Tool checks, and an import/first-boot smoke test with standard login enforcement. The signed 1.2.0 update was applied to the live appliance and verified with its configuration and service data preserved.

See the smoke-validation record, live-upgrade validation record, and SPDX SBOM in the release metadata archive.

## Supported scope and limitations

- Target platform: VMware vCenter/ESXi 9.1.0, Ubuntu Server 24.04 LTS guest
- Harbor vulnerability-database refresh and offline vulnerability scanning are not supported
- Product-specific restore workflows require separate qualification
- Appliance and service-data backup is intentionally not included

No license is granted unless a license file is added to this repository.
