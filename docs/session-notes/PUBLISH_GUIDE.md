# Simple Dual-Repo Publishing

## Run From ANYWHERE in Your Project! 🚀

### Usage

From project root (or anywhere):

```bash
./publish.sh "your commit message"
```

That's it! No need to cd into specific folders!

---

## Examples

### Example 1: Update Module
```bash
# Edit module file
nano _bmad/modules/conscious-founder/agents/analyst.md

# Run publish (from project root!)
./publish.sh "feat: improved analyst agent"

# ✅ Both repos updated automatically
```

### Example 2: Update Project Docs
```bash
# Update sprint status
nano SPRINT_STATUS.md

# Run publish
./publish.sh "docs: updated sprint status"

# ✅ Main project updated
```

### Example 3: Update Both
```bash
# Edit multiple files
nano SPRINT_STATUS.md
nano _bmad/modules/conscious-founder/agents/architect.md

# Run publish ONCE
./publish.sh "feat: updated sprint status and architect agent"

# ✅ Both repos updated with one command!
```

---

## What It Does

1. ✅ Auto-detects which repos have changes
2. ✅ Shows you what will be committed
3. ✅ Asks for confirmation
4. ✅ Commits main project (if changes)
5. ✅ Commits module (if changes)
6. ✅ Pushes both to GitHub

---

## Even Simpler Than Before!

**Before this script:**
```bash
cd _bmad/modules/conscious-founder
./publish.sh "message"
```

**Now:**
```bash
./publish.sh "message"
```

**Run it from anywhere in your project!** 🎉

---

## Smart Detection

The script automatically:
- Detects if main project has changes
- Detects if module has changes
- Only commits what needs to be committed
- Same message for both repos

---

## Quick Reference

```bash
# From project root (recommended)
./publish.sh "your message"

# Edit something, then:
nano _bmad/modules/conscious-founder/agents/analyst.md
./publish.sh "feat: improved analyst"

# Done! ✅
```

---

## Why This Is Better

✅ **No directory navigation** - Run from anywhere
✅ **Auto-detection** - Knows what changed where
✅ **One command** - Handles both repos automatically
✅ **Fast** - Less typing, less thinking

**Maximum efficiency!** 🚀
