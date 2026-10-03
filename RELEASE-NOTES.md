## Lab Storage Appliance 1.0.3

This is the first public general-availability OVA for the Lab Storage Appliance.

### Included services

- SFTP backup targets with client accounts, quotas, approved-network controls, and no shell access
- Private Harbor registry administration for projects, repositories, artifacts, members, and robot accounts
- Authenticated VCSP v2 Content Library publishing for ISO, OVF, and OVA content
- Unified `/admin/` management, health, updates, certificate, account, activity, and storage workflows

### Download and reassemble the OVA

GitHub cannot accept the 2.1 GiB OVA as one asset. Download both numbered OVA parts and the reassembly script for your platform.

Windows PowerShell:

```powershell
.\Join-Storage-Appliance-1.0.3.ps1
```

Linux or macOS:

```bash
chmod +x join-storage-appliance-1.0.3.sh
./join-storage-appliance-1.0.3.sh
```

Expected reconstructed OVA SHA-256:

```text
7127a943e863643fb932b71a4df63e954fb2dcbc47d43e96d55c1ad488d05bea
```

`Storage-Appliance-1.0.3-public-metadata.zip` contains the OVF descriptor and manifest, signed checksum, public verification key, signed 1.0.3 update, SPDX SBOM, exact-artifact qualification records, deployment/operations notes, and the complete DOCX documentation set.

### Qualification

The exact OVA was deployed to vCenter and passed 165 Linux tests, VMware OVF Tool verification, guided setup, SFTP transfer/quota/isolation, Harbor OCI push/pull, Content Library VCSP/range checks, service lifecycle, firewall rollback, reboot persistence, and restricted-console recovery. The disposable qualification VM was removed afterward.

### Known limits

- Product-specific restore procedures require separate qualification.
- Offline Harbor vulnerability-database refresh and vulnerability scanning are not supported.
- Appliance and service-data backup is intentionally not included.
