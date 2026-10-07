## VCF Storage Appliance 1.2.0

Version 1.2.0 refreshes the deployable OVA and signed update package with the latest SFTP credential workflow.

### Highlights

- Generated SFTP client passwords are 19 characters: below 20 characters while still using cryptographically secure random generation.
- Show and Copy controls remain available for generated or newly entered passwords before saving. Saved password values cannot be retrieved and must be rotated if lost.
- Enable, Disable, and Remove actions are positioned beneath the account status. Removal requires a disabled account and preserves the backup directory and files.
- Deployment, administration, and troubleshooting guides now describe the 1.2 behavior and release validation.
- The signed in-place update was applied to the live appliance with accounts, service configuration, and stored data preserved.

### Download and reassemble the OVA

GitHub cannot accept the OVA as one asset. Download both numbered OVA parts and the reassembly script for your platform.

Windows PowerShell:

```powershell
.\Join-Storage-Appliance-1.2.0.ps1
```

Linux or macOS:

```bash
chmod +x join-storage-appliance-1.2.0.sh
./join-storage-appliance-1.2.0.sh
```

Expected reconstructed OVA SHA-256:

```text
6d153a7bc0839c66e44f84563a5f606e3935aafb36b5d20079fa3f8635057d15
```

The signed in-place update asset is `Storage-Appliance-1.2.0-update.tar.gz` with SHA-256 `c67c6c7b005b51cd97d3595b54a4c551c06b05998c08dc3f6e80a6b008d19889`.

`Storage-Appliance-1.2.0-public-metadata.zip` contains the OVF descriptor and manifest, signed checksum, public verification key, SPDX SBOM, exact-artifact smoke-validation records, live-upgrade validation, deployment and operations notes, and the current documentation set.

### Validation

- 167 Linux unit and security tests passed.
- OVF manifest, signed checksum, and VMware OVF Tool checks passed.
- The exact 1.2.0 OVA was imported and first-boot smoke tested with standard login enforced and development auto-login disabled.
- The signed 1.2.0 update was applied to the live appliance and verified with existing accounts, service configuration, and stored data preserved.

### Known limits

- Product-specific restore procedures require separate qualification.
- Offline Harbor vulnerability-database refresh and vulnerability scanning are not supported.
- Appliance and service-data backup is intentionally not included.
