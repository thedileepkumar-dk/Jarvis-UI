<div align="center">

# ⚡ JARVIS-UI
### Universal Kinetic Frontend & Animated UI Engineering Framework

**Autonomous UI design, kinetic motion systems, and high-conversion frontend engineering for AI coding agents.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Supported Agents](https://img.shields.io/badge/Agents-Codex%20%7C%20Claude%20%7C%20OpenCode%20%7C%20Antigravity%20%7C%20Cursor-8B5CF6?style=for-the-badge)](#-one-command-installation)
[![Zero Dependency](https://img.shields.io/badge/Dependencies-Zero%20(Pure%20HTML%2FCSS%2FJS)-10B981?style=for-the-badge)](#-modular-animation-primitives)

<br/>

<p align="center">
  <b>A generative animation & UI engineering playbook that empowers any AI coding assistant to build world-class, kinetic web interfaces.</b>
</p>

[Quick Install](#-one-command-installation) • [Key Primitives](#-modular-animation-primitives) • [Domain Metaphors](#-adapting-to-any-domain) • [Interactive Demos](#-included-interactive-demos) • [Agent Prompts](#-agent-prompts)

---

</div>

## 🚀 One-Command Installation

Install **Jarvis-UI** across all your AI coding agents (**Codex, Claude Desktop/Code, OpenCode, Antigravity, and Cursor**) with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/thedileepkumar-dk/Jarvis-UI/main/install.sh | bash
```

### 🎯 Multi-Agent Compatibility Matrix

| Environment | Configured Directory | Auto-Synced |
| :--- | :--- | :---: |
| **Universal Core (macOS, Linux, WSL)** | `~/.jarvis-ui` | ⚡ Master Framework Root |
| **Codex** | `~/.codex/skills/Jarvis-UI` | ✅ Linked to `~/.jarvis-ui` |
| **Claude** (Claude Code / Desktop) | `~/.claude/skills/Jarvis-UI` | ✅ Linked to `~/.jarvis-ui` |
| **OpenCode** | `~/.config/opencode/skills/Jarvis-UI` | ✅ Linked to `~/.jarvis-ui` |
| **Antigravity / Gemini** | `~/.gemini/config/skills/Jarvis-UI` | ✅ Linked to `~/.jarvis-ui` |
| **Cursor** | `~/.cursor/rules/Jarvis-UI.mdc` | ✅ Auto-configured rule |
| **Any Specific Project** | `your-project/.agents/skills/Jarvis-UI` | `bash ~/.jarvis-ui/install.sh --project .` |

---

## 💡 What is Jarvis-UI?

Most AI agents generate generic, flat, template-like landing pages. **Jarvis-UI** provides a structured design system and kinetic animation engine engineered for tier-1 web applications.

It does **not** force hardcoded layouts. Instead, it equips agents with:
1. **Domain Metaphor Synthesis**: Designing bespoke animations based on what the product actually does.
2. **6 Mathematical Animation Primitives**: Pure CSS & SVG kinetic effects (zero heavy JS bundles).
3. **Hardware Bezel Showcases**: Live interactive 3-column cockpits instead of static screenshots.
4. **Adaptive Token System**: Harmonious color scales generated from a single primary brand hue.
5. **Physical Micro-Interactions**: Interactive 3D mouse perspective tilt, spring easing, and dynamic sheens.

---

## 🧩 Modular Animation Primitives

Jarvis-UI abstracts complex frontend physics into 6 lightweight, reusable building blocks:

```
┌────────────────────────────────────────────────────────────────────────┐
│ 1. Vector Path Tracing (Traveling SVG pulses along cubic Béziers)     │
├────────────────────────────────────────────────────────────────────────┤
│ 2. Radial & Orbital Mechanics (Gauges, dials, rotating satellites)     │
├────────────────────────────────────────────────────────────────────────┤
│ 3. 3D Card Perspective Tilt & Reactive Sheen (Mouse tracking physics)  │
├────────────────────────────────────────────────────────────────────────┤
│ 4. Volumetric Light & Ambient Mesh (Breathing radial plumes & glows)   │
├────────────────────────────────────────────────────────────────────────┤
│ 5. Live Telemetry & Counter Roll-Ups (Real-time numbers & pulses)      │
├────────────────────────────────────────────────────────────────────────┤
│ 6. Staggered Orchestration & Scroll Docking (Drop-in sticky headers)   │
└────────────────────────────────────────────────────────────────────────┘
```

### 1. Vector Path Tracing (Pipelines & DAGs)
```css
/* Animated electrical pulses traveling along SVG Bézier curves */
.trace-pulse {
  stroke-dasharray: 14 86;
  stroke-dashoffset: 100;
  animation: traceFlow 3.2s linear infinite;
}
@keyframes traceFlow {
  0% { stroke-dashoffset: 100; }
  100% { stroke-dashoffset: 0; }
}
```

### 2. Semi-Circle Status Gauge Math
```javascript
// Converts a 0–100 score into SVG needle endpoints on a 180° arc
function getNeedle(score, cx = 70, cy = 70, radius = 38) {
  const rad = ((-90 + (score / 100) * 180) * Math.PI) / 180;
  return { x2: cx + radius * Math.cos(rad), y2: cy + radius * Math.sin(rad) };
}
```

### 3. Interactive 3D Perspective Tilt with Reactive Sheen
```javascript
// Pure CSS & JS 3D tilt with dynamic light sheen
card.addEventListener('mousemove', (e) => {
  const rect = card.getBoundingClientRect();
  const x = e.clientX - rect.left - rect.width / 2;
  const y = e.clientY - rect.top - rect.height / 2;
  card.style.transform = `perspective(1000px) rotateX(${-y * 0.05}deg) rotateY(${x * 0.05}deg) scale3d(1.02, 1.02, 1.02)`;
});
```

---

## 🎨 Adapting to Any Domain

| Industry / Niche | Visual Metaphor | Kinetic Animation | Status Meter |
| :--- | :--- | :--- | :--- |
| **AI Agents & LLMs** | Prompt & Token Synapses | Multi-model routing flow paths | Hallucination Guard Score (`98.6%`) |
| **DevOps & Cloud** | Global Edge Topology | Git commit branching pipeline | Cluster Uptime SLA (`99.99%`) |
| **FinTech & Trading** | Live Market Cockpit | Order book tick flashes & range bars | Market Regime Gauge (`65.3 Bullish`) |
| **Cyber Security** | Zero-Trust Shield Mesh | Sweeping laser payload scanner | Threat Level Indicator (`Shielded`) |
| **WebGPU & Graphics** | Neural Shader Sandbox | Real-time 3D wireframe cube tilt | Shader Kernel Time (`0.12ms`) |
| **E-Commerce** | Flash Fulfillment Hub | Live purchasing velocity ticker | Conversion Rate vs Goal (`4.8%`) |

---

## 🖥️ Included Interactive Demos

The repository contains three complete, standalone reference implementations:

1. [**`saas-analytics-demo.html`**](./examples/saas-analytics-demo.html)
   - **Theme**: AI Observability & Token Telemetry ("TracePulse").
   - **Features**: Active agent latency trackers, token volume range sliders, accuracy gauges, and prompt routing pipeline.

2. [**`creative-devtools-demo.html`**](./examples/creative-devtools-demo.html)
   - **Theme**: WebGPU & Neural Shader Compiler ("Vortex").
   - **Features**: Interactive 3D mouse perspective tilt with sheen, real-time code editor, and AST multi-target synthesis pipeline.

3. [**`fintech-terminal-demo.html`**](./examples/fintech-terminal-demo.html)
   - **Theme**: Institutional Market Analytics & Risk Terminal ("NexusTrade").
   - **Features**: Live price tick badges, market regime gauge, High/Low day range bars, and broker execution flows.

---

## 🤖 Agent Prompts

When pairing with **Codex, Claude, OpenCode, or Antigravity**, use these prompt templates:

### Prompt 1: Full Landing Page
> *"Using the **Jarvis-UI** skill, design and build a modern animated landing page for our new cloud security platform 'AegisNet'. Include an atmospheric ambient hero with orbiting chips, an interactive 3-column security operations cockpit, an animated threat-routing pipeline, and a dynamic monthly/yearly pricing switch."*

### Prompt 2: Interactive Product Showcase Component
> *"Using **Jarvis-UI**'s 3D perspective tilt and hardware bezel patterns, build a live interactive product stage showing our AI prompt compiler with real-time stats."*

### Prompt 3: Custom Flow Diagram
> *"Using **Jarvis-UI**'s vector path tracing primitive, build an animated data ingestion pipeline showing 4 input sources connecting to a central glowing engine."*

---

## 📂 Repository Structure

```text
Jarvis-UI/
├── SKILL.md                          # Primary agent specification file
├── install.sh                        # Universal curl/local installer script
├── README.md                         # This documentation
├── references/
│   ├── animation-recipes.md          # Implementation formulas for all 6 primitives
│   ├── domain-metaphors.md           # Domain-by-domain animation mapping guide
│   └── design-system.md              # Adaptive color tokens, typography & shadows
├── resources/
│   ├── kinetic-primitives.css        # Universal CSS keyframe & micro-physics engine
│   ├── animation-math-helpers.js     # Zero-dependency vanilla JS math utilities
│   └── svg-widgets.html              # Clean reusable SVG templates
└── examples/
    ├── saas-analytics-demo.html      # AI & Cloud telemetry demo
    ├── creative-devtools-demo.html   # WebGPU compiler demo with reactive 3D tilt
    └── fintech-terminal-demo.html    # Financial trading terminal demo
```

---

## 📄 License

MIT License © 2026 Dileep Kumar. Built for the modern AI engineering community.
