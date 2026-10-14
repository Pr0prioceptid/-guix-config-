# Guix Configuration Quick Reference

List of commands for managing guix declaratively

## System Updates

Update packages & channels:

```bash
# Update Guix
guix pull

# Update Guix & Nonguix
guix pull -C ~/my-config/ch/channels.scm

# Update from pinned channel
guix pull -C ~/my-config/ch/lock.scm
```

## System Reconfiguration

Apply configuration changes:

```bash
# Reconfigure system
sudo guix system reconfigure -L ~/my-config ~/my-config/config.scm

# Reconfigure home
guix home reconfigure -L ~/my-config ~/my-config/home-configuration.scm

# Save channel versions for reproducibility
guix describe -f channels > ~/my-config/ch/lock.scm

# Commit changes
git add ~/my-config
git commit
```

## Cleanup and Maintenance

Free up disk space and manage generations:

```bash
# Garbage collection
guix gc

# Delete old system generations
guix system delete-generations

# Combination of the two above in one command
guix gc -d ...

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
guix build -L ~/my-config -f ...

# Test building a system configuration
guix system build -L ~/my-config ~/my-config/config.scm
```

## Testing and Development

Test configurations before deployment:

```bash
# Test home configuration in container
guix home container -L ~/my-config ...

# Test configuration in REPL
guix repl -L ~/my-config ...
```

## Extra requirements

private key for age1qzj... must be available at `/root/.config/sops/keys.txt'
