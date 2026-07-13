# Guix Configuration Quick Reference

List of commands for managing guix declaratively

## System Updates

Update packages & channels:

```bash
# Update Guix
guix pull

# Update from pinned channel
guix pull -C ~/dotfiles/channels.scm
```

## System Reconfiguration

Apply configuration changes:

```bash
# Reconfigure system
sudo guix system reconfigure -L ~/dotfiles ~/dotfiles/system/...

# Reconfigure home
guix home reconfigure -L ~/dotfiles ~/dotfiles/home/...

# Save channel versions for reproducibility
guix describe -f channels > ~/dotfiles/channels.scm

# Commit changes
git add ~/dotfiles
git commit
```

## Cleanup and Maintenance

Free up disk space and manage generations:

```bash
# Garbage collection
guix gc

# Delete old system generations
guix system delete-generations

# Delete old home generations
guix home delete-generations

# Format Scheme files according to Guix style
guix style -f ...
```

## Package Management

Find and examine packages:

```bash
# Search for packages
guix search ...
guix show ...

# View package definition
guix edit ...

# Test building a package
guix build -L ~/dotfiles ...
```

## Testing and Development

Test configurations before deployment:

```bash
# Test home configuration in container
guix home container -L ~/dotfiles ...

# Test configuration in REPL
guix repl -L ~/dotfiles ...
```
