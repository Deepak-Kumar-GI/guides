# User Deletion TUI

Interactive terminal interface for deleting BCM Kubernetes users.

## Quick Start

```bash
./delete_user_tui.sh           # Interactive mode
./delete_user_tui.sh --dry-run # Preview mode (no changes)
./delete_user_tui.sh --help    # Show help
```

## Deletion Modes

| Mode | Description |
|------|-------------|
| **Full Deletion** | Removes K8s namespace + system account + home directory |
| **Kubernetes Only** | Removes K8s access, preserves system account |
| **System Only** | Removes orphan system accounts (no K8s access) |

## Workflow

1. Accept disclaimer
2. Select deletion mode
3. Select users from checklist (Space to toggle, Enter to confirm)
4. Review and confirm deletion
5. View summary with results

## Logs

Logs are written to `logs/delete/`:

| File | Purpose |
|------|---------|
| `delete_*.log` | Full session log |
| `delete_*.errors.log` | Errors only |
| `latest_delete.log` | Symlink to most recent |

## Configuration

Settings in `delete_config.sh`:

| Setting | Default | Description |
|---------|---------|-------------|
| `DELETE_OPERATION_TIMEOUT` | 120s | Timeout per deletion operation |
| `BULK_DELETE_WARNING_THRESHOLD` | 5 | Warn when deleting more than N users |

## Keyboard Controls

| Key | Action |
|-----|--------|
| Arrow keys | Navigate menu/list |
| Space | Toggle selection (checklist) |
| Tab | Move between list and buttons |
| Enter | Confirm selection |
| Esc | Cancel/Exit |


**Note:** Please follow these final steps to delete user data from the DGX as well.

1. SSH into `<worker>`
2. Navigate to `/workspace/private-storage/`
3. Remove the `<cluster-user-name>` directory using:

   ```bash
   rm -rf <cluster-user-name>
   ```
