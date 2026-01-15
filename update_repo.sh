#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
REPO_DIR="/Applications/XAMPP/xamppfiles/htdocs/aniskoubaa.org/se446/big_data_course"
DEFAULT_MSG="Update course materials $(date '+%Y-%m-%d %H:%M:%S')"

# Navigate to the repository directory
cd "$REPO_DIR" || { echo -e "${RED}❌ Directory not found: $REPO_DIR${NC}"; exit 1; }

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}   SE446 Big Data Course - Git Update${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check for changes
if [[ -z $(git status -s) ]]; then
    echo -e "${GREEN}✅ No changes to commit.${NC}"
    exit 0
fi

# Show status
echo -e "${YELLOW}📋 Changed files:${NC}"
git status -s
echo ""

# Get commit message
if [ -z "$1" ]; then
    echo -e "${BLUE}💬 Enter commit message (or press Enter for default):${NC}"
    read -r USER_MSG
    COMMIT_MSG="${USER_MSG:-$DEFAULT_MSG}"
else
    COMMIT_MSG="$1"
fi

echo ""
echo -e "${CYAN}📝 Commit message: ${NC}\"$COMMIT_MSG\""
echo ""

# Remove cached files that should be ignored (LaTeX auxiliary files)
echo -e "${YELLOW}🧹 Removing cached ignored files...${NC}"
git rm -r --cached --quiet *.tex *.aux *.out *.toc *.log *.fls *.fdb_latexmk 2>/dev/null || true
git rm -r --cached --quiet lectures/**/*.aux lectures/**/*.out lectures/**/*.toc lectures/**/*.log 2>/dev/null || true
git rm -r --cached --quiet textbook/ 2>/dev/null || true

# Add all changes
echo -e "${YELLOW}➕ Adding changes...${NC}"
git add .

# Commit changes
echo -e "${YELLOW}💾 Committing changes...${NC}"
git commit -m "$COMMIT_MSG"

# Push to remote
echo -e "${YELLOW}🚀 Pushing to GitHub...${NC}"
if git push origin main; then
    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}✅ Repository updated successfully!${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
else
    echo ""
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${RED}❌ Push failed! Check your connection.${NC}"
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    exit 1
fi
