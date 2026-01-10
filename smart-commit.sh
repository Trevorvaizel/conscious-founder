#!/bin/bash

###############################################################################
# Smart Submodule Commit Script
# Intelligently handles commits for main repo + submodule setup
# Author: Rabbit (with BMAD agent assistance)
# Version: 2.0.0 - Submodule Edition
###############################################################################

set -e  # Exit on error

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Auto-detect project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"
MODULE_PATH="${MODULE_PATH:-_bmad/modules/conscious-founder}"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Smart Submodule Commit${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

###############################################################################
# CHECK IF MESSAGE PROVIDED
###############################################################################

if [ -z "$1" ]; then
    echo -e "${RED}Error: Commit message required${NC}"
    echo ""
    echo "Usage: ./smart-commit.sh \"your commit message\""
    echo ""
    echo "Example:"
    echo "  ./smart-commit.sh \"feat: improved analyst agent\""
    echo ""
    exit 1
fi

COMMIT_MSG="$1"
AUTO_YES=false

# Check for -y or --yes flag
for arg in "$@"; do
    if [ "$arg" = "-y" ] || [ "$arg" = "--yes" ]; then
        AUTO_YES=true
    fi
done

###############################################################################
# VERIFY WE'RE IN THE RIGHT PLACE
###############################################################################

if [ ! -d "$PROJECT_ROOT/_bmad" ]; then
    echo -e "${RED}Error: Not in a BMAD project${NC}"
    echo "Please run from project root (where _bmad/ folder exists)"
    exit 1
fi

if [ ! -d "$MODULE_PATH" ]; then
    echo -e "${RED}Error: Module not found at $MODULE_PATH${NC}"
    exit 1
fi

if [ ! -f "$PROJECT_ROOT/.gitmodules" ]; then
    echo -e "${YELLOW}Warning: .gitmodules not found${NC}"
    echo "Are you sure this is a submodule setup?"
    echo ""
    if [ "$AUTO_YES" = true ]; then
        echo -e "${GREEN}Auto-confirming (-y flag)${NC}"
    else
        read -p "Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
fi

echo -e "${GREEN}✓ Project: $PROJECT_ROOT${NC}"
echo -e "${GREEN}✓ Module: $MODULE_PATH${NC}"
echo ""

###############################################################################
# CHECK FOR CHANGES
###############################################################################

echo -e "${YELLOW}Scanning for changes...${NC}"
echo ""

# Check module
echo -e "${BLUE}Module:${NC}"
if [ -n "$(git -C "$MODULE_PATH" status --porcelain 2>/dev/null)" ]; then
    MODULE_CHANGES=$(git -C "$MODULE_PATH" status --short)
    echo -e "${GREEN}✓ Changes detected${NC}"
    echo "$MODULE_CHANGES"
    MODULE_HAS_CHANGES=true
else
    echo -e "${YELLOW}⚠ No changes${NC}"
    MODULE_HAS_CHANGES=false
fi
echo ""

# Check main repo (excluding module)
echo -e "${BLUE}Main Project:${NC}"
MAIN_CHANGES=$(git status --porcelain | grep -v "$MODULE_PATH" || true)
if [ -n "$MAIN_CHANGES" ]; then
    echo -e "${GREEN}✓ Changes detected${NC}"
    echo "$MAIN_CHANGES"
    MAIN_HAS_CHANGES=true
else
    echo -e "${YELLOW}⚠ No changes${NC}"
    MAIN_HAS_CHANGES=false
fi
echo ""

###############################################################################
# SUMMARY AND CONFIRMATION
###############################################################################

if [ "$MODULE_HAS_CHANGES" = false ] && [ "$MAIN_HAS_CHANGES" = false ]; then
    echo -e "${YELLOW}No changes to commit${NC}"
    exit 0
fi

echo -e "${BLUE}Summary:${NC}"
if [ "$MODULE_HAS_CHANGES" = true ]; then
    echo -e "  ${GREEN}☑ Module${NC}"
fi
if [ "$MAIN_HAS_CHANGES" = true ]; then
    echo -e "  ${GREEN}☑ Main project${NC}"
fi
echo ""
echo -e "${BLUE}Message:${NC} \"$COMMIT_MSG\""
echo ""

if [ "$AUTO_YES" = true ]; then
    echo -e "${GREEN}Auto-confirming (-y flag)${NC}"
else
    read -p "Commit these changes? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Cancelled${NC}"
        exit 0
    fi
fi
echo ""

###############################################################################
# COMMIT MODULE CHANGES
############################################################################///

if [ "$MODULE_HAS_CHANGES" = true ]; then
    echo -e "${YELLOW}[1/2] Committing module changes...${NC}"

    echo -e "${BLUE}  → Adding files...${NC}"
    git -C "$MODULE_PATH" add .

    echo -e "${BLUE}  → Committing...${NC}"
    git -C "$MODULE_PATH" commit -m "$COMMIT_MSG"

    echo -e "${GREEN}✓ Module committed${NC}"

    # Try to push, but don't fail if authentication issues
    echo -e "${BLUE}  → Pushing to GitHub...${NC}"
    if git -C "$MODULE_PATH" push origin main 2>&1; then
        echo -e "${GREEN}✓ Module pushed to GitHub${NC}"
        echo -e "   Repo: https://github.com/Trevorvaizel/conscious-founder-bmad-module${NC}"
        PUSH_SUCCESS=true
    else
        echo -e "${YELLOW}⚠ Push failed (authentication?)${NC}"
        echo -e "${YELLOW}  Module committed locally but not pushed${NC}"
        echo -e "${YELLOW}  You'll need to push manually:${NC}"
        echo -e "${YELLOW}    cd $MODULE_PATH && git push${NC}"
        PUSH_SUCCESS=false
    fi
    echo ""

    # Only update main repo reference if push succeeded
    if [ "$PUSH_SUCCESS" = true ]; then
        echo -e "${YELLOW}[1/2] Updating main repo module reference...${NC}"
        git add "$MODULE_PATH"
        git commit -m "update: module reference - $COMMIT_MSG" || echo -e "${YELLOW}  (No main repo changes to commit)${NC}"
        echo ""
    else
        echo -e "${YELLOW}⚠ Skipping main repo update until submodule is pushed${NC}"
        echo ""
    fi
fi

###############################################################################
# COMMIT MAIN REPO CHANGES
###############################################################################

if [ "$MAIN_HAS_CHANGES" = true ]; then
    echo -e "${YELLOW}[2/2] Committing main project changes...${NC}"
    cd "$PROJECT_ROOT"

    echo -e "${BLUE}  → Adding files...${NC}"
    git add .

    echo -e "${BLUE}  → Committing...${NC}"
    git commit -m "$COMMIT_MSG"

    echo -e "${GREEN}✓ Main project committed${NC}"

    # Try to push, but don't fail if authentication issues
    echo -e "${BLUE}  → Pushing to GitHub...${NC}"
    if git push origin main 2>&1; then
        echo -e "${GREEN}✓ Main project pushed to GitHub${NC}"
        echo -e "   Repo: https://github.com/Trevorvaizel/conscious-founder${NC}"
    else
        echo -e "${YELLOW}⚠ Push failed (authentication?)${NC}"
        echo -e "${YELLOW}  Main project committed locally but not pushed${NC}"
        echo -e "${YELLOW}  You'll need to push manually:${NC}"
        echo -e "${YELLOW}    git push${NC}"
    fi
    echo ""
fi

###############################################################################
# DONE
############################################################################///

echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}✓ All changes committed!${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "${BLUE}Submodule Status:${NC}"
git submodule status
echo ""
