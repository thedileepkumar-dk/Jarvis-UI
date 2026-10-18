# Animation Choreography & Keyframes

This guide contains the exact CSS and SVG math required to build the kinetic animations that give this frontend style its signature "alive" feel.

---

## 1. Traveling Electrical Pulse Wires (Data Pipeline)

Used to visualize pipelines, data streams, integrations, or broker connections.

### SVG Markup Pattern
Each connection between point A `(200, y)` and hub `(600, 310)` consists of two overlapping paths with identical geometry:
1. `.fw-line`: Static faint guide wire.
2. `.fw-pulse`: Shorter dashed colored segment that animates along the path.

```html
<svg class="flow-wires" viewBox="0 0 1200 620" preserveAspectRatio="none">
  <!-- Line 1: Top Input -->
  <g>
    <path class="fw-line" d="M 200 62 C 300 62 500 310 600 310" pathLength="100"></path>
    <path class="fw-pulse" d="M 200 62 C 300 62 500 310 600 310" pathLength="100" style="--fd: 0s"></path>
  </g>
  <!-- Line 2: Mid Input -->
  <g>
    <path class="fw-line" d="M 200 227 C 300 227 500 310 600 310" pathLength="100"></path>
    <path class="fw-pulse" d="M 200 227 C 300 227 500 310 600 310" pathLength="100" style="--fd: 1.7s"></path>
  </g>
  <!-- Line 3: Output Branch -->
  <g>
    <path class="fw-line" d="M 600 310 C 700 310 900 62 1000 62" pathLength="100"></path>
    <path class="fw-pulse" d="M 600 310 C 700 310 900 62 1000 62" pathLength="100" style="--fd: 2.4s"></path>
  </g>
</svg>
```

### CSS Animation
```css
.fw-line {
  fill: none;
  stroke: var(--line);
  stroke-width: 2px;
}

.fw-pulse {
  fill: none;
  stroke: var(--brand);
  stroke-width: 3.5px;
  stroke-linecap: round;
  /* 15 unit visible dash, 85 unit gap */
  stroke-dasharray: 15 85;
  stroke-dashoffset: 100;
  animation: wireFlow 3.2s linear infinite;
  animation-delay: var(--fd, 0s);
}

@keyframes wireFlow {
  0% { stroke-dashoffset: 100; }
  100% { stroke-dashoffset: 0; }
}
```

---

## 2. Market Radar / Sonar Scanner

Used to showcase continuous background monitoring, scraping, discovery, or security scanning.

### Core Elements
- **Concentric Circles**: Scaled radii (e.g. 125, 180, 235, 290) centered at `(500, 320)`.
- **Rotational Sweep**: A gradient sector rotating around the center.
- **Rippling Ping**: Stroke circle scaling up while fading.
- **Flashing Blips**: Small circles flashing with staggered delays.

```html
<svg class="radar-svg" viewBox="0 0 1000 640" aria-hidden="true">
  <!-- Sweeping Sector -->
  <path class="radar-sweep" d="M 500 320 L 382 55 A 290 290 0 0 1 618 55 Z" fill="url(#sweepGrad)"></path>
  <!-- Pulsing Ripple Wave -->
  <circle class="radar-ripple" cx="500" cy="320" r="290" fill="none" stroke="var(--brand)" stroke-width="2"></circle>
  <!-- Targets / Blips -->
  <circle class="radar-blip" cx="430" cy="150" r="5" style="animation-delay: 0s"></circle>
  <circle class="radar-blip" cx="622" cy="212" r="4.5" style="animation-delay: 0.8s"></circle>
  <circle class="radar-blip" cx="395" cy="236" r="5" style="animation-delay: 1.6s"></circle>
</svg>
```

```css
.radar-sweep {
  transform-origin: 500px 320px;
  animation: radarRotate 6s linear infinite;
}

@keyframes radarRotate {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

.radar-ripple {
  transform-origin: 500px 320px;
  animation: radarRipple 3s cubic-bezier(0.16, 1, 0.3, 1) infinite;
}

@keyframes radarRipple {
  0% { transform: scale(0.2); opacity: 0.9; }
  100% { transform: scale(1); opacity: 0; }
}

.radar-blip {
  fill: var(--brand);
  transform-origin: center;
  animation: blipGlow 2.4s ease-in-out infinite;
}

@keyframes blipGlow {
  0%, 100% { opacity: 0.2; transform: scale(0.8); }
  50% { opacity: 1; transform: scale(1.4); }
}
```

---

## 3. Orbiting Hero Feature Chips

Floating pills around the headline providing ambient kinetic movement without distracting from the text.

```css
.orbit-chip {
  position: absolute;
  left: var(--x);
  top: var(--y);
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.92);
  backdrop-filter: blur(8px);
  border: 1px solid var(--line);
  box-shadow: 0 4px 14px rgba(30, 35, 64, 0.06);
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--ink);
  animation: chipFloat 4.5s ease-in-out infinite alternate;
  animation-delay: var(--d, 0s);
  transition: transform 0.2s var(--ease), box-shadow 0.2s var(--ease);
}

.orbit-chip:hover {
  transform: translateY(-4px) scale(1.05);
  box-shadow: 0 12px 24px rgba(30, 35, 64, 0.12);
}

@keyframes chipFloat {
  0% { transform: translateY(0px); }
  100% { transform: translateY(-8px); }
}
```

---

## 4. Sticky Header Drop-In

On scroll, when the navbar becomes sticky, it uses a snappy spring drop-in transition:

```css
.hdr.is-stuck {
  position: fixed;
  top: 14px;
  left: 0;
  right: 0;
  padding: 0;
  z-index: 100;
  animation: dropIn 0.35s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes dropIn {
  from {
    transform: translateY(-30px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}
```

---

## 5. Live Pulsing Indicator Dot (Heartbeat)

Communicates real-time streaming, active connection, or live market ticks:

```css
.live-dot {
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: var(--green);
  position: relative;
}

.live-dot::after {
  content: "";
  position: absolute;
  inset: -3px;
  border-radius: 50%;
  background: var(--green);
  opacity: 0.4;
  animation: livePulse 2s ease-in-out infinite;
}

@keyframes livePulse {
  0%, 100% { transform: scale(1); opacity: 0.4; }
  50% { transform: scale(1.8); opacity: 0; }
}
```
