# Git Submodule Workflow Guide

## 📚 What Changed?

**Before (Manual Script Approach):**
- Two separate git repos manually coordinated
- Scripts to commit to both repos
- Fear of repos getting out of sync
- Hard to reuse module in other projects

**After (Submodule Approach):**
- Git tracks the relationship between repos
- Main repo knows exactly which version of the module it uses
- Easy to reuse module across projects
- Clean separation of concerns

---

## 🔄 Daily Workflow

### **Editing Module Files**

When you edit files in `_bmad/modules/conscious-founder/`:

```bash
# 1. Edit your files
nano _bmad/modules/conscious-founder/agents/analyst.md

# 2. Commit in the module repo
cd _bmad/modules/conscious-founder
git add .
git commit -m "feat: improved analyst agent"
git push origin main

# 3. Update main repo to use the new module version
cd ../..  # Back to project root
git add _bmad/modules/conscious-founder
git commit -m "update: conscious-founder module to latest"
git push origin main
```

### **Editing Main Project Files**

When you edit files in the main project (not the module):

```bash
# 1. Edit your files
nano README.md

# 2. Commit normally
git add .
git commit -m "docs: updated README"
git push origin main
```

### **Editing Both at Once**

```bash
# 1. Edit files in both places
nano _bmad/modules/conscious-founder/agents/analyst.md
nano README.md

# 2. Commit module changes first
cd _bmad/modules/conscious-founder
git add .
git commit -m "feat: improved analyst agent"
git push origin main

# 3. Commit main repo changes (includes module update)
cd ../..
git add .
git commit -m "docs: updated README and module reference"
git push origin main
```

---

## 🚀 Quick Commands Reference

### **Check Submodule Status**
```bash
git submodule status
```

### **Update Submodule to Latest**
```bash
cd _bmad/modules/conscious-founder
git pull origin main
cd ../..
git add _bmad/modules/conscious-founder
git commit -m "update: module to latest version"
```

### **Clone This Project (With Submodule)**
```bash
git clone --recursive https://github.com/Trevorvaizel/conscious-founder.git
```

### **If You Forgot --recursive When Cloning**
```bash
git submodule init
git submodule update
```

---

## 🛠️ New Simplified Scripts

### **Option 1: Smart Commit Script (Recommended)**

```bash
#!/bin/bash
# smart-commit.sh - Handles both repos intelligently

COMMIT_MSG="$1"

if [ -z "$COMMIT_MSG" ]; then
    echo "Usage: ./smart-commit.sh \"your commit message\""
    exit 1
fi

# Check module for changes
if [ -n "$(git -C _bmad/modules/conscious-founder status --porcelain 2>/dev/null)" ]; then
    echo "📦 Committing module changes..."
    cd _bmad/modules/conscious-founder
    git add .
    git commit -m "$COMMIT_MSG"
    git push origin main
    cd ../..

    echo "📝 Updating main repo module reference..."
    git add _bmad/modules/conscious-founder
    git commit -m "update: module reference - $COMMIT_MSG"
    git push origin main
fi

# Check main repo for changes (excluding module)
if [ -n "$(git status --porcelain | grep -v "^??" | grep -v "_bmad/modules/conscious-founder" 2>/dev/null)" ]; then
    echo "📝 Committing main repo changes..."
    git add .
    git commit -m "$COMMIT_MSG"
    git push origin main
fi

echo "✓ Done!"
```

**Usage:**
```bash
./smart-commit.sh "feat: improved agent behavior"
```

---

## 📝 Key Concepts

### **What is a Submodule?**

A submodule is a git repository embedded inside another git repository. The main repo doesn't store the module's files - it stores a **reference** to a specific commit of the module.

**Think of it like:**
- Main repo: "I use conscious-founder-bmad-module version abc1234"
- Module repo: Contains the actual code at commit abc1234

### **Why is This Better?**

1. **Version Tracking:** You know exactly which version of the module each project uses
2. **Reusability:** Easy to use the same module in multiple projects
3. **Separation:** Module has its own git history and releases
4. **No Sync Issues:** Git handles the relationship automatically

---

## ⚠️ Common Gotchas

### **1. Detached HEAD State**

Sometimes when you update submodules, they go into "detached HEAD" state:

```bash
# Check if detached
cd _bmad/modules/conscious-founder
git status  # Will say "detached HEAD"

# Fix it:
git checkout main
```

### **2. Forgot to Push Submodule Changes**

If you commit in main repo but didn't push submodule changes:

```bash
cd _bmad/modules/conscious-founder
git push origin main
cd ../..
git push origin main
```

### **3. Someone Else Updated the Submodule**

When you pull and the submodule reference changed:

```bash
git pull origin main
git submodule update --remote
```

---

## 🎯 Best Practices

1. **Always commit submodule changes before main repo**
2. **Push submodule changes immediately**
3. **Update submodule reference in main repo after pushing submodule**
4. **Use meaningful commit messages for both repos**
5. **Test in other projects before updating main repo reference**

---

## 🆚 Comparison: Before vs After

### **Before (Your Scripts)**

✅ Worked
❌ Manual coordination
❌ No version tracking
❌ Hard to reuse
❌ Scripts were complex

### **After (Submodules)**

✅ Git handles coordination
✅ Precise version tracking
✅ Easy to reuse
✅ Standard git commands
✅ Industry standard practice

---

## 🤔 Questions?

**Q: Can I still edit the module in place?**
A: Yes! Edit files in `_bmad/modules/conscious-founder/` just like before.

**Q: Do I need to change how I work?**
A: Slightly - you'll commit module changes separately from main repo changes.

**Q: Can I ignore the submodule and just use main repo?**
A: No - you need to commit submodule changes when you edit them.

**Q: What if I want to use this module in another project?**
A: Easy! Just add it as a submodule there too.

---

## 📚 Further Reading

- `git help submodule`
- `git help submodule update`
- https://git-scm.com/book/en/v2/Git-Tools-Submodules

---

**Made with ❤️ by BMAD Party Mode**
Winston + Amelia + Barry
