# Log Monitoring & Alert System (Bash)

## 📌 Overview

This project is a production-safe log monitoring system built using Bash.  
It monitors log files, detects `ERROR`, `WARNING`, and `CRITICAL` patterns, generates timestamped reports, and triggers alerts based on configurable thresholds.

The system processes logs incrementally using state tracking, ensuring that only new log entries are analyzed on each run.

**Supported log types:**
- `/var/log/syslog`
- `/var/log/auth.log`
- Custom application logs

---

## 🚀 Features

- Incremental log processing (no duplicate scanning)
- `ERROR` / `WARNING` / `CRITICAL` detection
- Threshold-based alert system
- Timestamped report generation
- State file tracking
- Compatible with log rotation
- Optional email alerts
- Cron automation supported
- Production-safe (does not delete system logs)

---

## 📁 Project Structure

```
log-monitoring/
│
├── monitor.sh
├── config.conf
├── state/
│   └── monitor.state
├── reports/
└── archive/
```

---

## ⚙ Configuration

Edit `config.conf`:

```bash
LOG_FILE="/var/log/syslog"
REPORT_DIR="./reports"
ARCHIVE_DIR="./archive"
STATE_DIR="./state"

ERROR_THRESHOLD=5
WARNING_THRESHOLD=10
CRITICAL_THRESHOLD=1

ENABLE_EMAIL_ALERT=false
EMAIL="admin@example.com"
```

---

## 🔧 Setup

### 1️⃣ Make script executable

```bash
chmod +x monitor.sh
```

### 2️⃣ Run script

**For system logs:**

```bash
sudo ./monitor.sh
```

**For custom logs:**

```bash
./monitor.sh
```

---

## ⏰ Automate with Cron

Edit your crontab:

```bash
crontab -e
```

**Run every hour:**

```bash
0 * * * * /path/to/log-monitoring/monitor.sh >> /path/to/log-monitoring/cron.log 2>&1
```

---

## 🛡 Production Safety

- Does **NOT** clear system logs
- Works safely with Linux log rotation
- Uses a state file to process only new log entries
- Suitable for cron-based automation

---

## 🧪 Requirements

- Linux OS
- Bash
- `mail` utility (if email enabled)
- `sudo` access (if monitoring system logs)

---