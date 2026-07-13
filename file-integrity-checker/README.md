
```bash
# Initialize hashes for directory or file
./integrity-check init /var/log

# Check integrity (returns exit code 1 if tampering detected)
./integrity-check check /var/log/syslog

# Update hash after authorized modification
./integrity-check update /var/log/syslog

# Check all log files
./integrity-check check /var/log/
```

## Example Output

```bash
$ ./integrity-check check /var/log/
/var/log/syslog: Status: Unmodified
/var/log/auth.log: Status: MODIFIED (Hash mismatch)

WARNING: 1 file(s) modified!
```

### Links
- [Project URL](https://roadmap.sh/projects/file-integrity-checker)
