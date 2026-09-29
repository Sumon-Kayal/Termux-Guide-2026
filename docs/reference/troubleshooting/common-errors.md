# Common Errors

### "Command not found" Errors
```bash
# Reload environment
source ~/.bashrc

# Or create new shell session
exit
# Then reopen Termux
```

### Environment Is Badly Broken (Reset Without Reinstalling)
**Warning:** `termux-reset` erases everything under `$PREFIX`, including installed packages, configuration files, and databases. It preserves your home directory and shared or external storage, including home shell startup files. Back up any needed data under `$PREFIX` and save your installed package list before proceeding — see [Backup & Restore](../../advanced-workflows/security/backups.md).

```bash
# Erase $PREFIX to reset the Termux environment
termux-reset
```

After the reset, fully close and reopen Termux to reinstall the bootstrap environment. Reinstall your packages, then restore the needed configuration files and databases from your backup. Home startup files may reference packages that must be reinstalled.

---

## Frequently Asked Questions (FAQ)
