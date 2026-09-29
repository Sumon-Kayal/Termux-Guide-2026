# Git Workflow

## Git Workflow

**Initial Setup:**
```bash
# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Set default editor
git config --global core.editor "vim"

# Cache credentials (1 hour)
git config --global credential.helper 'cache --timeout=3600'
```

**Common Commands:**
```bash
# Clone repository
git clone https://github.com/user/repo.git

# Check status
git status

# Add and commit
git add .
git commit -m "Update message"

# Push changes
git push -u origin HEAD

# Pull latest changes
git pull

# Create new branch
git checkout -b feature-branch

# View commit history
git log --oneline --graph
```

**GitHub CLI:**
```bash
# Install GitHub CLI
pkg install gh

# Authenticate
gh auth login

# Create repository
gh repo create my-project --public

# Clone your repos
gh repo clone username/repository

# Create issue
gh issue create

# View pull requests
gh pr list
```
