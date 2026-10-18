# Universal Animation Recipes & Math Primitives

This reference provides modular, production-ready code patterns for the 6 foundational animation primitives. These can be combined, customized, and adapted to **any** frontend project.

---

## 1. Vector Path Tracing (Pipelines, Synapses & Circuits)

Used whenever you need to demonstrate data flow, network communication, workflows, or connections between components.

### Implementation Pattern
```html
<svg class="pipeline-svg" viewBox="0 0 1000 400" preserveAspectRatio="none">
  <!-- Connection 1 -->
  <g class="trace-group">
    <path class="trace-track" d="M 100 100 C 300 100, 400 200, 500 200" pathLength="100" />
    <path class="trace-pulse" d="M 100 100 C 300 100, 400 200, 500 200" pathLength="100" style="--speed: 3s; --delay: 0s" />
  </g>
  <!-- Connection 2 -->
  <g class="trace-group">
    <path class="trace-track" d="M 100 300 C 300 300, 400 200, 500 200" pathLength="100" />
    <path class="trace-pulse" d="M 100 300 C 300 300, 400 200, 500 200" pathLength="100" style="--speed: 3s; --delay: 1.5s" />
  </g>
</svg>
```

```css
.trace-track {
  fill: none;
  stroke: var(--line, #E2E8F0);
  stroke-width: 2px;
}

.trace-pulse {
  fill: none;
  stroke: var(--brand, #6366F1);
  stroke-width: 3.5px;
  stroke-linecap: round;
  /* 15 units visible dash, 85 units transparent gap */
  stroke-dasharray: 15 85;
  stroke-dashoffset: 100;
  animation: tracePulse var(--speed, 3s) linear infinite;
  animation-delay: var(--delay, 0s);
}

@keyframes tracePulse {
  0% { stroke-dashoffset: 100; }
  100% { stroke-dashoffset: 0; }
}
```

---

## 2. Radial & Orbital Mechanics (Dials, Gauges & Orbits)

### A. Semi-Circle Status Gauge
Calculates needle coordinate mathematically based on a 0-100 score:
```javascript
// Needle endpoints for semi-circle arc from -90° to +90°
function getNeedleCoords(score, cx = 70, cy = 70, radius = 38) {
  const angleDeg = -90 + (score / 100) * 180;
  const rad = (angleDeg * Math.PI) / 180;
  return {
    x2: cx + radius * Math.cos(rad),
    y2: cy + radius * Math.sin(rad)
  };
}
```

### B. Orbiting Planetary Satellites
Place elements around a center hub using polar coordinates or CSS transforms:
```html
<div class="orbit-system">
  <div class="orbit-hub">Core Engine</div>
  <div class="orbit-ring">
    <div class="satellite sat-1">⚡ Module A</div>
    <div class="satellite sat-2">🔍 Module B</div>
    <div class="satellite sat-3">📊 Module C</div>
  </div>
</div>
```

```css
.orbit-system {
  position: relative;
  width: 400px;
  height: 400px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: center;
}

.orbit-ring {
  position: absolute;
  inset: 0;
  border: 1px dashed var(--line, #CBD5E1);
  border-radius: 50%;
  animation: orbitSpin 24s linear infinite;
}

.satellite {
  position: absolute;
  padding: 6px 14px;
  background: #FFF;
  border: 1px solid var(--line);
  border-radius: 999px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.06);
  font-weight: 600;
  font-size: 0.82rem;
  /* Counter-rotate so text remains upright */
  animation: counterSpin 24s linear infinite;
}

.sat-1 { top: -14px; left: 50%; transform: translateX(-50%); }
.sat-2 { bottom: -14px; left: 50%; transform: translateX(-50%); }
.sat-3 { top: 50%; right: -20px; transform: translateY(-50%); }

@keyframes orbitSpin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
@keyframes counterSpin { from { transform: rotate(0deg); } to { transform: rotate(-360deg); } }
```

---

## 3. Interactive 3D Perspective Tilt & Sheen

Adds tactile physical depth to cards or hardware mockups when the user hovers over them.

```html
<div class="tilt-card" id="tiltTarget">
  <div class="tilt-sheen"></div>
  <div class="card-content">
    <h3>Next-Gen Infrastructure</h3>
    <p>Hover to experience reactive physics.</p>
  </div>
</div>
```

```css
.tilt-card {
  perspective: 1000px;
  transform-style: preserve-3d;
  transition: transform 0.15s ease-out;
  position: relative;
  overflow: hidden;
  border-radius: 16px;
  background: #FFF;
  border: 1px solid var(--line);
  box-shadow: 0 10px 30px rgba(0,0,0,0.06);
}

.tilt-sheen {
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at var(--mouse-x, 50%) var(--mouse-y, 50%), rgba(255,255,255,0.4) 0%, transparent 60%);
  pointer-events: none;
  opacity: 0;
  transition: opacity 0.3s;
}

.tilt-card:hover .tilt-sheen {
  opacity: 1;
}
```

```javascript
// Vanilla JS 3D Tilt Helper
function initTilt(cardEl, maxTilt = 12) {
  cardEl.addEventListener('mousemove', (e) => {
    const rect = cardEl.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    
    const centerX = rect.width / 2;
    const centerY = rect.height / 2;
    
    const rotateX = ((y - centerY) / centerY) * -maxTilt;
    const rotateY = ((x - centerX) / centerX) * maxTilt;
    
    cardEl.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.02, 1.02, 1.02)`;
    cardEl.style.setProperty('--mouse-x', `${(x / rect.width) * 100}%`);
    cardEl.style.setProperty('--mouse-y', `${(y / rect.height) * 100}%`);
  });

  cardEl.addEventListener('mouseleave', () => {
    cardEl.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)';
  });
}
```

---

## 4. Volumetric Light & Ambient Mesh (Background Depth)

Creates rich background depth without loading heavy video assets or 3D libraries:

```css
.ambient-plume {
  position: absolute;
  top: -120px;
  left: 50%;
  transform: translateX(-50%);
  width: min(850px, 90vw);
  height: 440px;
  background: radial-gradient(
    circle at 50% 35%,
    rgba(var(--brand-rgb), 0.22) 0%,
    rgba(var(--brand-rgb), 0.08) 50%,
    transparent 75%
  );
  filter: blur(70px);
  pointer-events: none;
  z-index: -1;
  animation: plumeBreathe 8s ease-in-out infinite alternate;
}

@keyframes plumeBreathe {
  0% { transform: translateX(-50%) scale(0.95); opacity: 0.8; }
  100% { transform: translateX(-50%) scale(1.05); opacity: 1; }
}
```

---

## 5. Live Telemetry & Counter Roll-Ups

```javascript
// Animate any number from start to end smoothly
function animateCounter(element, target, duration = 1500, prefix = '', suffix = '') {
  let startTime = null;
  const start = 0;

  function update(currentTime) {
    if (!startTime) startTime = currentTime;
    const progress = Math.min((currentTime - startTime) / duration, 1);
    // Ease-out cubic
    const easeProgress = 1 - Math.pow(1 - progress, 3);
    const currentVal = Math.floor(start + (target - start) * easeProgress);
    element.textContent = `${prefix}${currentVal.toLocaleString()}${suffix}`;

    if (progress < 1) {
      requestAnimationFrame(update);
    }
  }

  requestAnimationFrame(update);
}
```

---

## 6. Staggered Orchestration & Scroll Docking

Use CSS custom properties to stagger children without writing repetitive nth-child rules:

```html
<div class="stagger-container">
  <div class="stagger-item" style="--i: 0;">Card 1</div>
  <div class="stagger-item" style="--i: 1;">Card 2</div>
  <div class="stagger-item" style="--i: 2;">Card 3</div>
  <div class="stagger-item" style="--i: 3;">Card 4</div>
</div>
```

```css
.stagger-item {
  opacity: 0;
  transform: translateY(20px);
  animation: staggerIn 0.5s cubic-bezier(0.16, 1, 0.3, 1) forwards;
  animation-delay: calc(var(--i) * 80ms + 100ms);
}

@keyframes staggerIn {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```
