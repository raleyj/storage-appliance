# VCF Storage Appliance

The VCF Storage Appliance provides SFTP backup targets, a private Harbor registry, and an authenticated publisher for subscribed vCenter Content Libraries from one Ubuntu OVA.

Version **1.4.0** is the current GA release. Download the assets from the [v1.4.0 release](https://github.com/raleyj/storage-appliance/releases/tag/v1.4.0). Download all three numbered OVA parts and the reassembly script for your OS. The complete OVA exceeds GitHub's single-asset limit.

Windows PowerShell: `./Join-Storage-Appliance-1.4.0.ps1`

Linux or macOS: `sh ./join-storage-appliance-1.4.0.sh`

Expected reassembled OVA SHA-256: `155a224e720f626aa343922d092d05c171625d61b76f86caed7dd8efc7c75ee3`

The public metadata ZIP includes the OVF descriptor, manifest, detached checksum signature, public key, build-input SPDX SBOM, qualification results, and the [Administrator Guide](docs/Storage-Appliance-Administrator-Guide.docx), [Deployment Guide](docs/Storage-Appliance-Deployment-Guide.docx), and [Troubleshooting Guide](docs/Storage-Appliance-Troubleshooting-Guide.docx).

## Changes in 1.4.0

- Optional Ubuntu `admin` password SSH, disabled by default, with a configurable port and administrator CIDR restrictions.
- SSH service lifecycle and administrator network controls in Appliance management.
- Harbor 2.14.6 offline bundle.
- Correct first-time creation of `/home/admin` when the OS password is saved.

The exact OVA passed 184 Linux tests, signature and OVF checks, and a fresh target-vCenter deployment covering SFTP, Harbor, subscribed Content Library synchronization, and password SSH. See [release notes](RELEASE-NOTES.md) for details.

This release supplies a new-deployment OVA. A 1.4.0 in-place update package and migration from earlier releases have not been qualified. Product-specific backup and restore still require site validation. Appliance and service-data backup are not included.

No license is granted unless a license file is added to this repository.
