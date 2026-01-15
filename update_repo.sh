#!/bin/bash

# Configuration
REPO_DIR="/Applications/XAMPP/xamppfiles/htdocs/aniskoubaa.org/se446/big_data_course"
COMMIT_MSG="Update course materials $(date '+%Y-%m-%d %H:%M:%S')"

# Navigate to the repository directory
cd "$REPO_DIR" || { echo "❌ Directory not found: $REPO_DIR"; exit 1; }

# Check for changes
if [[ -z $(git status -s) ]]; then
    echo "✅ No changes to commit."
    exit 0
fi

# Add all changes
echo "➕ Adding changes..."
git add .

# Commit changes
echo "Pm Committing changes..."
git commit -m "$COMMIT_MSG"

# Push to remote
echo "🚀 Pushing to GitHub..."
git push origin main

echo "✅ Repository updated successfully!"
