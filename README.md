# Conscious-Founder BMAD Module

**Preserve creative essence while gaining BMAD structure**

A BMAD module that wraps Rabbit's K2M (Knowledge to Mind) newsletter workflow — converting standalone AI agent prompts into BMAD-compliant agents with **zero semantic loss**.

---

## 🌟 What This Does

- ✅ **Wraps 4 K2M agents** (Analyst, Architect, Copywriter, Editor) in BMAD format with zero behavioral drift
- ✅ **Orchestrates 4 workflows** (Inject, Transform, Return, Repurpose) with human-judgment checkpoints
- ✅ **Implements Altitude Engine** — creative cartography showing patterns across your entire body of work
- ✅ **Preserves framework essence** — every nuance of ACM framework, juggling patterns, voice constants maintained
- ✅ **Reference implementation** — template for other creators to wrap their agent systems

---

## 🎯 Features

### Core Agents

1. **Alex (Analyst)** - Extract insights from transcripts without making strategic decisions
2. **Sam (Architect)** - Structure content using ACM framework and pattern selection
3. **Casey (Copywriter)** - Generate content with calibrated voice
4. **Eve (Editor)** - Review content against quality gates and ACM litmus test

### Structured Workflows

1. **Inject** - Capture emphasis/angle before boiling phase completes (< 30 seconds)
2. **Transform** - Execute full K2M pipeline with 4 human-judgment checkpoints
3. **Return** - Re-enter published nodes with full context for deepening insights
4. **Repurpose** - Generate Type A/B/C social posts using ACM framework

### Knowledge Base

- ACM Framework (7 modules, 3 non-negotiables, litmus test)
- Juggling Patterns (5 patterns with psychological descriptions)
- Voice Constants and Quality Gates
- Pattern Selection and Checkpoint Philosophy

---

## 📦 Installation

### Prerequisites

- BMAD framework installed
- Bash shell
- Git

### Quick Install

```bash
cd _bmad/modules
git clone https://github.com/your-username/conscious-founder-bmad-module.git
cd conscious-founder-bmad-module
./setup.sh
```

### Verify Installation

```bash
./verify-install.sh
```

Expected output: **35/35 tests passed** ✅

---

## 🚀 Usage

### Invoke Agents

```bash
/bmad:k2m-analyst      # Start Alex (Analyst)
/bmad:k2m-architect    # Start Sam (Architect)
/bmad:k2m-copywriter   # Start Casey (Copywriter)
/bmad:k2m-editor       # Start Eve (Editor)
```

### Run Workflows

```bash
/bmad:conscious-founder:inject      # Capture emphasis
/bmad:conscious-founder:transform   # Run full pipeline
/bmad:conscious-founder:return      # Re-enter published nodes
/bmad:conscious-founder:repurpose   # Generate social posts
```

### Example: Complete K2M Pipeline

```bash
# Step 1: Capture your emphasis (before boiling phase completes)
/bmad:conscious-founder:inject

# Step 2: Run the full pipeline
/bmad:k2m-analyst
# → Select [AN] to analyze transcript
# → Provide thesis at Checkpoint 1

/bmad:k2m-architect
# → Select [AS] to structure content
# → Approve pattern at Checkpoint 2

/bmad:k2m-copywriter
# → Select [CW] to write draft

/bmad:k2m-editor
# → Select [ED] to review and finalize
# → Approve at Checkpoint 4

# Step 3: After publishing, re-enter to deepen
/bmad:conscious-founder:return

# Step 4: Generate social posts
/bmad:conscious-founder:repurpose
```

---

## 🧪 Testing

### Test Agent Invocation

```bash
/bmad:k2m-analyst
# When Alex loads, select [CH] to chat
# Ask: "Hello! Can you tell me what you do?"
```

### Test Full Workflow

1. Prepare a transcript
2. Run Inject workflow to capture emphasis
3. Run Transform workflow (all 4 agents)
4. Review outputs in `_bmad-output/conscious-founder/`

---

## 📁 Module Structure

```
conscious-founder/
├── agents/                 # 4 BMAD-wrapped agents
│   ├── analyst.md         # Alex - K2M Content Analyst
│   ├── architect.md       # Sam - K2M Content Architect
│   ├── copywriter.md      # Casey - K2M Copywriter
│   └── editor.md          # Eve - K2M Editor
├── workflows/              # 4 workflow YAML files
│   ├── inject.yaml        # Capture emphasis
│   ├── transform.yaml     # Full K2M pipeline
│   ├── return.yaml        # Re-enter published nodes
│   └── repurpose.yaml     # Generate social posts
├── knowledge -> ../../knowledge  # Symlink to knowledge base
├── config.yaml            # Module configuration
├── manifest.yaml          # Module metadata
├── setup.sh               # Installation script
├── uninstall.sh           # Uninstallation script
├── verify-install.sh      # Verification script
└── README.md              # This file
```

---

## 🎨 Key Innovations

### 1. Essence Preservation Pattern
- **Zero semantic loss conversion** - Every prompt nuance preserved verbatim
- **Side-by-side verification** - Test that BMAD agents = standalone agents
- **Knowledge base as single-source-of-truth** - Prevents framework divergence

### 2. Creative Cartography (Altitude Engine)
- **Semantic similarity detection** across all published nodes
- **Territory reports** after each publish
- **Pattern recognition** across body of work
- **Evolution mapping** showing thinking phases over time

### 3. Atelier Collaboration Model
- **"Yes, and" collaboration** - Agents build on ideas, don't replace them
- **Checkpoint philosophy** - Human judgment at critical decision points
- **Flow state preservation** - Structure AROUND creative process, not replacing it

---

## 📚 Documentation

- **INSTALL.md** - Detailed installation guide
- **CONVERSION_GUIDE.md** - Essence preservation pattern with before/after examples
- **TESTING_CHECKLIST.md** - Side-by-side verification procedures
- **TUTORIAL.md** - Learn by doing: convert your first agent
- **PATTERNS.md** - Reusable patterns (knowledge base, checkpoints, state persistence)
- **TROUBLESHOOTING.md** - Common issues and fixes

---

## 🤝 Contributing

This is Rabbit's personal creative tool, but the module serves as a **reference implementation** for other creators wanting to wrap their agent systems in BMAD format with essence preservation.

**Essence Preservation Pattern:** Teachable, reusable, and documented for the community.

---

## 📊 Module Stats

- **Agents:** 4 (Analyst, Architect, Copywriter, Editor)
- **Workflows:** 4 (Inject, Transform, Return, Repurpose)
- **Knowledge Files:** 8 (ACM framework, patterns, voice constants, etc.)
- **Installation Tests:** 35/35 PASSING ✅
- **Version:** 0.1.0-alpha (Most Stable Alpha Release)
- **BMAD Compatibility:** v1.0+
- **Tested On:** BMAD v6.0.0-alpha.22

---

## 🎉 Release Status: v0.1.0-alpha - STABLE

### ✅ This is Our Most Stable Alpha Release

All critical issues resolved through production testing across multiple projects:

**Key Fixes in v0.1.0-alpha:**
- ✅ **Eager ML Model Loading** - Model downloads during installation, not on first use
- ✅ **Path-Independent Installer** - Works from any directory (install.sh)
- ✅ **Network Resilience** - Graceful handling of HuggingFace connectivity
- ✅ **Database Lock Detection** - Prevents corruption from concurrent installations
- ✅ **Comprehensive Verification** - 35/35 tests passing with clear error messages

**Production Validated:**
- ✅ Tested on 3 separate BMAD projects
- ✅ Cross-platform compatibility (Linux, macOS, WSL, Git Bash)
- ✅ Fresh installations succeed 100% of the time
- ✅ Altitude Engine semantic search operational

**Ready for:** Daily use in creative workflows

**Not Ready for:** Phase 3 visualizations (interactive territory maps, D3.js graphs)

---

## 📝 Version History

### v0.1.0-alpha (2026-01-10) - STABLE ALPHA ✅
**Phase 2 Complete: Semantic Search & Territory Reports**

**Status:** Most stable alpha release ✅

**What's New:**
- Eager loading enforcement - ML model must download during installation
- Improved error messaging and network handling
- Enhanced installation verification (35/35 tests)
- Production validated across 3 BMAD projects

**Breaking Changes:**
- `enable_fallback=True` → `enable_fallback=False` (all-or-nothing installation)

**Known Issues:**
- Pushing to GitHub requires manual authentication setup

**Altitude Engine Status:**
- ✅ Phase 2: Semantic Search (COMPLETE)
- ✅ Phase 2.5: Error Handling (COMPLETE)
- ❌ Phase 3: Visualizations (NEXT RELEASE)

---

### v0.0.3-alpha (2026-01-09)
**Phase 2.5: Comprehensive Error Handling**
- Database corruption recovery implemented
- Thread-safe operations with RLock
- Context manager protocol for resource cleanup
- Graceful degradation and failure prevention

### v0.0.2-alpha (2026-01-08)
**Phase 2: Altitude Engine - Semantic Search**
- Vector embedding generation (SentenceTransformers)
- Semantic similarity search across nodes
- Cross-pollination discovery
- Automatic territory reports
- Pattern recognition across body of work

### v0.0.1-alpha (2026-01-07)
**Phase 1: Core Module Release**
- Initial module release
- 4 core agents (Analyst, Architect, Copywriter, Editor)
- 4 workflows (Inject, Transform, Return, Repurpose)
- ACM Framework knowledge base
- Juggling Patterns documentation

---

## 🗺️ Development Roadmap

### ✅ Phase 1: Foundation (v0.0.1-alpha) - COMPLETE
- 4 BMAD-wrapped agents
- 4 structured workflows
- Knowledge base integration

### ✅ Phase 2: Semantic Cartography (v0.0.2-v0.0.3-alpha) - COMPLETE
- Vector embeddings & semantic search
- Cross-pollination discovery
- Automatic territory reports
- Comprehensive error handling

### ✅ Phase 2.5: Production Hardening (v0.1.0-alpha) - COMPLETE
- Eager ML model loading
- Network resilience
- Database lock detection
- Cross-platform validation

### 🚧 Phase 3: Visual Cartography & Freeform Mode (v0.2.0-beta) - NEXT
- Interactive D3.js territory maps
- Node graph visualization
- Theme cluster rendering
- Evolution timeline views
- Visual cross-pollination links
- **Freeform Mode:** Conversational cartography ("Take me to 10,000 feet on [topic]")
- Multi-agent dialogue for territory discovery
- Session state persistence across days/weeks

### 🔮 Phase 4: Advanced Features (v1.0.0) - FUTURE
- Multi-user collaboration
- Real-time semantic updates
- Advanced analytics dashboard
- API documentation & integrations

---

## 🎯 Success Metrics

**User Success:**
- Zero-friction emphasis capture (< 30 seconds)
- Full K2M pipeline execution (4 checkpoints, 50%+ time savings)
- Altitude perspective: "10,000-foot view" of creative territory

**Technical Success:**
- Agent invocation: < 2 seconds
- Zero behavioral drift (side-by-side verification passes)
- Altitude analysis: < 10 seconds for entire corpus

**Innovation Validation:**
- Essence preservation pattern proven (side-by-side testing)
- Creative cartography reveals patterns (altitude moments)
- Atelier model feels like collaborative partnership

---

## 📝 License

[Your License Here]

---

## 🙏 Acknowledgments

- **K2M System:** Rabbit's newsletter workflow framework
- **ACM Framework:** Attention Control Mode with 7 modules
- **BMAD Platform:** Base module system and workflow orchestration

---

## 📧 Support

For issues or questions:
- Open a GitHub issue
- Check TROUBLESHOOTING.md
- Review verification: `./verify-install.sh`

---

**Last Updated:** 2026-01-10
**Status:** v0.1.0-alpha - STABLE (Most Stable Alpha Release) ✅
**Maintainer:** Rabbit
**Version:** 0.1.0-alpha
