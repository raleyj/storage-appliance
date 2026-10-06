## VCF Storage Appliance 1.1.0

Version 1.1.0 refreshes the deployable OVA and brings the current production appliance management experience into the public release.

### Highlights

- Default web administrator renamed to `admin`, with 15-character password support.
- SFTP accounts are presented as readable cards instead of raw JSON, with generated-password reveal/copy, enable, disable, remove, quota, authentication, and approved-client-network controls.
- Harbor project, repository, artifact, member, and robot-account administration is available through the appliance interface.
- Content Library catalog inventory, publish/update, credential, and withdrawal workflows are integrated.
- Appliance Status, management, signed updates, HTTPS certificate, and administrator-account pages match the unified appliance design.
- Header navigation, account menu, light/dark themes, and cached service status improve day-to-day operation.
- The guided first-deployment workspace initializes the selected containerized services.

### Download and reassemble the OVA

GitHub cannot accept the 2.1 GiB OVA as one asset. Download both numbered OVA parts and the reassembly script for your platform.

Windows PowerShell:

```powershell
.\Join-Storage-Appliance-1.1.0.ps1
```

Linux or macOS:

```bash
chmod +x join-storage-appliance-1.1.0.sh
./join-storage-appliance-1.1.0.sh
```

Expected reconstructed OVA SHA-256:

```text
8f3f304f9cff0814d4573e730c422cf52cb4c8e8491ee12d473b690e1d675ea1
```

`Storage-Appliance-1.1.0-public-metadata.zip` contains the OVF descriptor and manifest, signed checksum, public verification key, SPDX SBOM, exact-artifact smoke-validation records, deployment and operations notes, and the current documentation set.

### Validation

- 167 Linux unit and security tests passed.
- OVF manifest, signed checksum, and VMware OVF Tool checks passed.
- The exact 1.1.0 OVA was imported and first-boot smoke tested with standard login enforced and development auto-login disabled.
- Full guided setup and end-to-end service qualification were not repeated for 1.1.0; version 1.0.3 remains the most recently completed full service qualification baseline.

### Known limits

- Product-specific restore procedures require separate qualification.
- Offline Harbor vulnerability-database refresh and vulnerability scanning are not supported.
- Appliance and service-data backup is intentionally not included.
