# Universal Design System & Token Formulas

This reference defines how to create a coherent, premium visual design system for any web project.

---

## 1. Single-Hue Adaptive Color Formula

Instead of picking arbitrary HEX colors, anchor the design to one primary **Brand Hue** and derive harmonious secondary colors:

```css
:root {
  /* Step 1: Define Brand Hue (0-360) */
  --h: 260; /* Indigo/Violet: 260, Emerald: 160, Cyan: 200, Amber: 25 */

  /* Step 2: Generate Harmonious Brand Scale */
  --brand-50:  hsl(var(--h), 90%, 97%);
  --brand-100: hsl(var(--h), 85%, 92%);
  --brand-200: hsl(var(--h), 80%, 84%);
  --brand-500: hsl(var(--h), 85%, 60%); /* Primary Brand */
  --brand-600: hsl(var(--h), 80%, 50%); /* Hover state */
  --brand-900: hsl(var(--h), 75%, 25%); /* Deep contrast */
  --brand-rgb: 99, 102, 241;

  /* Step 3: Functional Indicator Scale */
  --success: #10B981;
  --success-bg: #ECFDF5;
  --danger: #EF4444;
  --danger-bg: #FEF2F2;
  --warning: #F59E0B;
  --warning-bg: #FFFBEB;
  --info: #0EA5E9;
  --info-bg: #F0F9FF;

  /* Step 4: Neutral Ink & Surface System */
  --canvas: #FFFFFF;
  --surface: #F8FAFC;
  --surface-hover: #F1F5F9;
  --border: #E2E8F0;
  --border-subtle: #F1F5F9;

  --text-primary: #0F172A;
  --text-secondary: #475569;
  --text-muted: #94A3B8;

  /* Embedded Dark Contrast (Cockpits, code blocks, terminal frames) */
  --dark-chassis: #1E293B;
  --dark-screen: #0F172A;
  --dark-border: rgba(255, 255, 255, 0.12);

  /* Elevation & Curves */
  --ease: cubic-bezier(0.16, 1, 0.3, 1);
  --shadow-sm: 0 2px 8px rgba(15, 23, 42, 0.04);
  --shadow-md: 0 10px 30px rgba(15, 23, 42, 0.08);
  --shadow-xl: 0 34px 80px rgba(15, 23, 42, 0.16);
}
```

---

## 2. Typography Rules

1. **Brand Wordmark & Display Accent**:
   - Use a distinctive serif or stylized font (`'Rokkitt'`, `'Outfit'`, or `'Cinzel'`) for the product name and key highlight words.
2. **Interface & Headings**:
   - Use a modern geometric sans-serif (`'Inter'`, `'Plus Jakarta Sans'`, or `'Geist'`).
   - High contrast headings: `color: var(--text-primary); font-weight: 800; letter-spacing: -0.025em;`
3. **Tabular Numerics**:
   - `font-variant-numeric: tabular-nums` must be applied to all live stats, pricing cards, counters, and table columns.

---

## 3. High-Contrast Glassmorphism

```css
.glass-surface {
  background: rgba(255, 255, 255, 0.88);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
  border: 1px solid rgba(226, 232, 240, 0.85);
  box-shadow: var(--shadow-md);
}

.dark-glass-surface {
  background: rgba(15, 23, 42, 0.85);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.35);
}
```
