# Conscious-Founder Module Installation Guide

**Installing Conscious-Founder in a New Repository**

---

## Quick Install (Recommended)

### Step 1: Copy the Module

```bash
# From your current repo, copy the module folder
cp -r /path/to/conscious-founder/_bmad/modules/conscious-founder \
      /path/to/new-repo/_bmad/modules/

# Navigate to new repo
cd /path/to/new-repo
```

### Step 2: Run Setup

```bash
cd _bmad/modules/conscious-founder
./setup.sh
```

### Step 3: Verify Installation

```bash
./verify-install.sh
```

**That's it!** Your module is installed and ready to use.

---

## What Gets Installed

The setup script will:
1. ✅ Verify BMAD installation
2. ✅ Create output directories
3. ✅ Register agent configs in `_bmad/_config/agents/`
4. ✅ Link knowledge base
5. ✅ Verify all components

---

## After Installation

### Use Your Agents

```bash
/bmad:k2m-analyst
/bmad:k2m-architect
/bmad:k2m-copywriter
/bmad:k2m-editor
```

### Use Your Workflows

```bash
/bmad:conscious-founder:inject
/bmad:conscious-founder:transform
/bmad:conscious-founder:return
/bmad:conscious-founder:repurpose
```

---

## Manual Install (If Setup Script Fails)

If the setup script doesn't work, follow these steps:

### 1. Create Directory Structure

```bash
mkdir -p _bmad/modules/conscious-founder/{agents,workflows}
mkdir -p _bmad/_config/agents
mkdir -p _bmad/knowledge
mkdir -p _bmad-output/conscious-founder/{analysis,structure,drafts,published,emphasis,nodes}
```

### 2. Copy Module Files

Copy these files from the source:
- `agents/*.md` → `_bmad/modules/conscious-founder/agents/`
- `workflows/*.yaml` → `_bmad/modules/conscious-founder/workflows/`
- `config.yaml` → `_bmad/modules/conscious-founder/`
- `manifest.yaml` → `_bmad/modules/conscious-founder/`

### 3. Copy Agent Configs

Copy from `_bmad/_config/agents/`:
- `k2m-analyst.customize.yaml`
- `k2m-architect.customize.yaml`
- `k2m-copywriter.customize.yaml`
- `k2m-editor.customize.yaml`

To `_bmad/_config/agents/` in the new repo.

### 4. Copy Knowledge Base

Copy all files from `_bmad/knowledge/` to the new repo's `_bmad/knowledge/`.

### 5. Create Knowledge Symlink

```bash
cd _bmad/modules/conscious-founder
rm -rf knowledge
ln -s ../../../knowledge knowledge
```

---

## Prerequisites

Your new repo must have:

1. ✅ BMAD framework installed (`_bmad/` directory structure)
2. ✅ BMAD config (`_bmad/bmb/config.yaml`)
3. ✅ Bash shell (for setup scripts)

---

## Verification

After installation, test with:

```bash
# Test agent loading
/bmad:k2m-analyst

# Verify all tests pass
_bmad/modules/conscious-founder/verify-install.sh
```

Expected output: **35/35 tests passed** ✅

---

## Uninstallation

To remove the module:

```bash
cd _bmad/modules/conscious-founder
./uninstall.sh
```

This will:
- Remove agent configs
- Remove knowledge symlink
- Ask if you want to delete output data
- Clean up module directory

---

## Troubleshooting

### "Agent not found" error

**Solution:** Check that agent configs are registered:
```bash
ls _bmad/_config/agents/k2m-*.yaml
```

You should see 4 files. If not, copy them manually.

### "Knowledge files not found" error

**Solution:** Verify knowledge symlink:
```bash
ls -la _bmad/modules/conscious-founder/knowledge
```

Should show: `knowledge -> ../../../knowledge`

If not, recreate it:
```bash
cd _bmad/modules/conscious-founder
rm -rf knowledge
ln -s ../../../knowledge knowledge
```

### "Output directories not writable"

**Solution:** Fix permissions:
```bash
chmod -R u+rwX _bmad-output/conscious-founder
```

---

## Portable Installation Package

To create a standalone package for distribution:

```bash
# From conscious-founder repo
cd _bmad/modules
tar -czf conscious-founder-package.tar.gz conscious-founder/

# This creates a compressed package with everything needed
```

To install from package:

```bash
# Extract to new repo
tar -xzf conscious-founder-package.tar.gz -C /path/to/new-repo/_bmad/modules/

# Run setup
cd /path/to/new-repo/_bmad/modules/conscious-founder
./setup.sh
```

---

## Next Steps

After installation:

1. **Test basic invocation:**
   ```bash
   /bmad:k2m-analyst
   ```

2. **Try a simple workflow:**
   - Chat with Alex: Select [CH]
   - Ask: "Can you explain what you do?"

3. **Run full pipeline:**
   - Use Inject to capture emphasis
   - Run Transform with all 4 agents
   - Publish your content
   - Use Return to re-enter
   - Use Repurpose for social posts

---

## Support

If you encounter issues:

1. Run `verify-install.sh` and check which tests fail
2. Check that BMAD is properly installed in the new repo
3. Verify all file permissions are correct
4. Ensure knowledge base files exist

**Module Status:** Production Ready ✅
**Test Coverage:** 35/35 tests passing
**BMAD Compatibility:** v1.0+

---

**Last Updated:** 2026-01-09
**Author:** Rabbit
