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
```bash
# Restore Termux's default shell profile and environment files
# without wiping your packages or home directory
termux-reset
```
**Note:** `termux-reset` rewrites configuration files under `$PREFIX/etc` and your shell startup files back to defaults. Back up any customized dotfiles (`.bashrc`, `.vimrc`, etc.) first — see [Backup & Restore](../../advanced-workflows/security/backups.md).

---

## Frequently Asked Questions (FAQ)
