---
name: Jarvis-UI
description: Master framework for designing and developing world-class, kinetic, professional, and animated web frontends and landing pages for ANY website or domain. Use this skill when asked to create modern, responsive websites featuring custom SVG animations, particle effects, interactive hardware/app mockups, data-flow pipelines, 3D card tilt physics, ambient lighting, and bespoke micro-interactions tailored to the user's specific product requirements.
---

# Universal Kinetic Frontend & Animation Engineering Skill

This skill guides AI agents (Antigravity, Claude, Codex, etc.) to engineer ultra-modern, production-grade, kinetic web frontends for **any website requirement**. 

Instead of copying a single hardcoded layout or forced widgets, this skill provides a **generative animation & design architecture**. It empowers agents to select, combine, and engineer custom visual metaphors, interactive mockups, and micro-animations tailored specifically to the project at hand.

---

## 1. The Core Engineering Principles

Every world-class, kinetic website achieves its premium aesthetic through five foundational pillars:

```
┌────────────────────────────────────────────────────────────────────────┐
│ 1. Atmospheric Ambient Lighting & Volumetric Depth                     │
│    (Dynamic mesh blooms, frosted glassmorphism, depth contrast)        │
├────────────────────────────────────────────────────────────────────────┤
│ 2. Domain-Specific Metaphor & Visual Anchor                            │
│    (Custom interactive product stage: terminal, canvas, 3D card, etc.) │
├────────────────────────────────────────────────────────────────────────┤
│ 3. Mathematical Animation Primitives                                   │
│    (Vector path tracing, orbital mechanics, particle fields, physics)  │
├────────────────────────────────────────────────────────────────────────┤
│ 4. Kinetic Micro-Interactions & State Choreography                    │
│    (Spring hover physics, 3D perspective tilt, magnetic buttons)      │
├────────────────────────────────────────────────────────────────────────┤
│ 5. Viewport-Aware Dynamic Sequences                                   │
│    (Staggered entrances, scroll-docking navbars, live counter tickers) │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Decision Tree: Designing the Right Animation for ANY Website

When a user asks to build a website for *any* concept (SaaS, AI, E-commerce, DevTools, Gaming, FinTech, Creative Portfolio, Climate Tech, Healthcare, etc.), follow this design process:

```
[User Request / Website Theme]
        │
        ▼
Step 1: Identify the Core Product Metaphor
  • Network / Infrastructure ──► Synaptic DAG / Circuit Wire Pulses
  • Monitoring / Security   ──► Scanning Laser / Pulse Field / Concentric Sonar
  • AI / Intelligence       ──► Neural Waveform / Token Stream / Particle Mesh
  • Creative / Design       ──► Fluid Morphing / 3D Gyro Tilt / Cursor Spotlight
  • Marketplace / Trading   ──► Live Stream Ticker / Gauge Needle / Range Sliders
  • Data / Analytics        ──► Flowing Stream Pipelines / Live Bar Equalizers
        │
        ▼
Step 2: Select 2-3 Kinetic Primitives (Do NOT overload)
  • One Background Ambient Primitive (Glow plume, floating particles, or grid drift)
  • One Interactive Hero Centerpiece (Hardware stage, 3D interactive tilt, or live simulation)
  • One Functional Flow / Metric (Pulse wires, morphing tabs, or gauge readouts)
        │
        ▼
Step 3: Implement with Lightweight Native Tech
  • Vanilla CSS Keyframes & CSS Custom Properties (`--delay`, `--x`, `--y`)
  • Inline SVG with `vector-effect="non-scaling-stroke"` and `pathLength`
  • Lightweight Vanilla JS for scroll state, 3D mouse tilt, and counters
  • Strict performance: zero bloated external animation libraries required
```

---

## 3. The 6 Modular Animation Primitives

Rather than hardcoding specific components, mix and match from these foundational primitives based on the website's needs:

### A. Vector Path Tracing & Flow (`pathLength` + `stroke-dashoffset`)
- **Use for**: Pipelines, integrations, neural connections, data flow, roadmap timelines, circuit boards.
- **Mechanism**: SVG cubic Bézier curves with a base guide track and a moving dashed colored stroke.
- *See [animation-recipes.md](./references/animation-recipes.md#1-vector-path-tracing)*

### B. Radial & Orbital Mechanics (Dials, Gauges, Satellite Systems)
- **Use for**: Status meters, speedometers, radar monitors, compasses, rotating ecosystem rings, countdown timers.
- **Mechanism**: Polar coordinate transforms `(r * cos θ, r * sin θ)`, continuous rotational keyframes, pulsing radius waves.
- *See [animation-recipes.md](./references/animation-recipes.md#2-radial--orbital-mechanics)*

### C. 3D Perspective Tilt & Sheen (Interactive Cards)
- **Use for**: Product cards, hardware showcase bezels, pricing cards, feature highlights.
- **Mechanism**: Mouse tracking with CSS `perspective: 1000px`, dynamic `rotateX`/`rotateY`, and moving radial reflection sheen.
- *See [animation-recipes.md](./references/animation-recipes.md#3-interactive-3d-tilt--sheen)*

### D. Volumetric Light & Particle Mesh (Atmospheric Backgrounds)
- **Use for**: Hero backdrops, section transitions, glowing core hubs.
- **Mechanism**: Layered radial gradient blooms with CSS `filter: blur()`, animated breathing keyframes, or lightweight HTML5 canvas particle fields.
- *See [animation-recipes.md](./references/animation-recipes.md#4-volumetric-light--ambient-mesh)*

### E. Live Data Tickers & Dynamic Roll-Ups
- **Use for**: Real-time counters, metrics, active user feeds, live status badges, order logs.
- **Mechanism**: Smooth counter animation, pulsing status LED (`::after` scale ring), and `font-variant-numeric: tabular-nums`.
- *See [animation-recipes.md](./references/animation-recipes.md#5-live-telemetry--counters)*

### F. Staggered Orchestration & Scroll Docking
- **Use for**: Feature grids, list items, navigation transitions.
- **Mechanism**: CSS variables `--i: 0; --d: 80ms;` driving staggered entrance delays, plus `position: fixed` header docking on scroll.
- *See [animation-recipes.md](./references/animation-recipes.md#6-staggered-orchestration)*

---

## 4. Universal Design Tokens & Surface Rules

1. **Brand Vector Formula**: Derive the entire color spectrum from a single HSL hue (`--brand-h`).
2. **Surface Hierarchy**:
   - Ultra-clean canvas (`#FFFFFF` with `#F8FAFC` wash)
   - Deep contrast cockpit or embedded terminal (`#0F172A` / `#1E293B`)
   - High-contrast ink typography (`#0F172A` headings, `#64748B` body)
3. **Typography**:
   - Distinctive brand display font (e.g. `'Rokkitt'`, `'Outfit'`, or `'Cinzel'`) for logo/accents.
   - Clean geometric sans (`'Inter'`, `'Plus Jakarta Sans'`, or `'Geist'`) for interface and headings.
   - `tabular-nums` for all dynamic data, prices, metrics, and timestamps.
4. **Easing Curves**:
   - Always use snappy deceleration: `--ease: cubic-bezier(0.16, 1, 0.3, 1)`. Avoid generic `ease` or linear motion for UI elements.

---

## 5. Detailed Reference Guides

- [animation-recipes.md](./references/animation-recipes.md): Copy-paste implementation code for all 6 animation primitives.
- [domain-metaphors.md](./references/domain-metaphors.md): Industry-by-industry inspiration and visual metaphor mapping.
- [design-system.md](./references/design-system.md): Tokens, glassmorphism, typography formulas, and layout guidelines.

## Reusable Resources

- [kinetic-primitives.css](./resources/kinetic-primitives.css): Standalone CSS keyframe engine containing all universal animation classes.
- [animation-math-helpers.js](./resources/animation-math-helpers.js): Modular vanilla JS helpers for 3D card tilt, counter animations, and scroll triggers.
