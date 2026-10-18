# Design Philosophy & Visual Tokens

Websites designed in this aesthetic break away from flat, boring landing pages by blending **tactile depth, rich micro-animations, and high-density information architecture**.

---

## 1. The Color Palette Engine

Rather than hardcoding arbitrary colors, select a primary **Brand Vector** and derive your palette using this formula:

### A. The Core Brand Axis
```css
:root {
  /* Pick a hue: 270 (Violet), 220 (Cobalt), 165 (Teal), or 15 (Amber) */
  --brand-h: 270;
  --brand-s: 58%;

  --brand: hsl(var(--brand-h), var(--brand-s), 61%);          /* Primary CTA, badges, highlights */
  --brand-deep: hsl(var(--brand-h), 56%, 43%);               /* Button hover, gradient endpoints */
  --brand-deepest: hsl(var(--brand-h), 67%, 35%);            /* High-contrast brand headers */
  --brand-soft: hsl(var(--brand-h), 80%, 96%);               /* Subtle active pill backgrounds */
  --brand-border: hsl(var(--brand-h), 60%, 91%);             /* Borders around active elements */
  --brand-rgb: 155, 99, 211;                                 /* For translucent overlays */
}
```

### B. Functional Indicators (State Colors)
Financial and analytical dashboards require distinct functional signals:
- **Positive / Growth / Active**: Green `#22C55E` with soft background `#E8F8F0`.
- **Negative / Drag / Inactive**: Red `#EF4444` with soft background `#FDECEC`.
- **Warning / Pending / Filter**: Amber `#F59E0B` with soft background `#FEF3C7`.
- **Informative / Secondary**: Sky Blue `#2FA3F0` or Indigo `#5A5CF0`.

### C. Surface & Canvas Tones
- **Light Theme Canvas**: `--white: #FFFFFF` with section washes `--wash: #F5F6FB`.
- **Borders**: `--line: #E9ECF4` for structural dividers, `--line-soft: #F0F2F8` for nested rows.
- **Ink Text Hierarchy**:
  - Primary text: `--ink: #1E2340` (high contrast, slightly warm navy).
  - Secondary text: `--slate: #6E7694`.
  - Captions / Metadata: `--slate-light: #8C93AD`.
- **Embedded Dark Cockpit**:
  - Use `--dark-bg: #0E1220` and `--dark-card: #171C2E` for dashboard previews, terminals, or code blocks embedded inside the light canvas. This contrast draws immediate visual attention.

---

## 2. Typography Rules

### A. The Three-Font Architecture
1. **Brand Signature Font** (`'Rokkitt'`, `'Outfit'`, or `'Cinzel'`):
   - Used sparingly: Logo wordmark, signature highlights, and large numbers.
   - Gives the product an established, dignified feel rather than looking like an off-the-shelf template.
2. **Interface & Headings Font** (`'Inter'` or `'Plus Jakarta Sans'`):
   - Geometric sans-serif with tight tracking: `letter-spacing: -0.02em` for headlines.
   - Heavy weights (700-800) for headlines; medium (500-600) for UI elements.
3. **Tabular Numerics** (`font-variant-numeric: tabular-nums`):
   - **Mandatory** for any dynamic numbers, financial figures, percentages, timestamps, or counters.
   - Prevents horizontal jitter when figures tick up or down.

---

## 3. Atmospheric Lighting & Depth

### A. The Plume & Glow Technique
Behind the main hero headline, place a large blurred pseudo-element or container:
```css
.hero-glow {
  position: absolute;
  top: -100px;
  left: 50%;
  transform: translateX(-50%);
  width: min(850px, 90vw);
  height: 440px;
  background: radial-gradient(
    circle at 50% 30%,
    rgba(var(--brand-rgb), 0.22) 0%,
    rgba(var(--brand-rgb), 0.08) 45%,
    transparent 75%
  );
  filter: blur(70px);
  pointer-events: none;
  z-index: -1;
}
```

### B. Glassmorphism Elevation
```css
.glass-pill {
  background: rgba(255, 255, 255, 0.88);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
  border: 1px solid rgba(233, 236, 244, 0.85);
  box-shadow: 0 10px 30px rgba(30, 35, 64, 0.08), 0 1px 3px rgba(30, 35, 64, 0.04);
}
```

---

## 4. Micro-Interaction Physics

All interactive elements use a custom cubic-bezier timing curve:
```css
:root {
  --ease: cubic-bezier(0.16, 1, 0.3, 1);
}
```
- **Button Hover**: `transform: translateY(-2px); box-shadow: 0 12px 28px rgba(var(--brand-rgb), 0.4);`
- **Button Active**: `transform: translateY(0);`
- **Card Hover**: Subtle upward translation (`translateY(-4px)`), increased shadow spread, and border highlight.
