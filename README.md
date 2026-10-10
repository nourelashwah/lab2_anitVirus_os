# Antivirus System - Operating Systems Lab 2

## Project Description
This project implements a simple antivirus system using Bash scripting in Linux. It monitors a specified directory, detects potentially malicious files, and moves them to a separate directory for review.

The project also provides a restore script that allows users to restore quarantined files or permanently delete them.

## Features
- **Directory Monitoring:** Monitors a specified directory for changes.
- **Malicious File Detection:** Detects files with potentially dangerous extensions, such as `.exe`, `.bat`, `.vbs`, `.scr`, and `.ps1`.
- **Keyword Detection:** Checks file contents for suspicious keywords, including `virus`, `trojan`, `ransomware`, `worm`, and `malware`.
- **Whitelist:** Allows specified filenames to be excluded from detection.
- **Quarantine:** Copies detected files to a separate directory and removes them from the monitored directory.
- **File Restoration:** Allows users to restore quarantined files or permanently delete them.
- **Scheduled Scanning:** Includes a script designed to perform periodic scans using cron.

## Project Structure

| File/Directory | Description |
|---|---|
| `antivirusd.sh` | Monitors a directory and scans files when changes are detected. |
| `antivirus-cron.sh` | Performs a scan when executed, making it suitable for scheduled execution using cron. |
| `restore.sh` | Provides an interactive menu to restore or delete quarantined files. |
| `Makefile` | Simplifies running the antivirus and restore scripts. |
| `whitelist.txt` | Contains filenames excluded from detection. |
| `malicious_dir/` | Stores quarantined files. |
| `scratch/` | Contains test files and scripts used during development. |
| `directory-info.last` | Stores information about the directory from the previous scan. |
| `directory-info.new` | Stores updated directory information for comparison. |

## Requirements
- Linux operating system
- Bash shell
- `make` utility
- Standard Linux utilities, including `grep`, `cmp`, `ls`, and `cp`

## How to Run

### 1. Clone the Repository

Clone the project repository and navigate to its directory.

```bash
git clone <repository-url>
cd lab2_anitVirus_os
