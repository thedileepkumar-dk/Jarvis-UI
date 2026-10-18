# Component Archetypes & Layout Patterns

This reference contains production-ready markup patterns for the signature structural components.

---

## 1. The Hardware Bezel & Container Query Showcase

Instead of a flat screenshot, wrap the product interface inside a realistic hardware frame:

```html
<div class="hardware-stage">
  <!-- Laptop Bezel Frame -->
  <div class="bezel-chassis">
    <!-- Screen Viewport -->
    <div class="screen-viewport">
      <!-- Embedded Interactive Cockpit -->
      <div class="cockpit-grid">
        <!-- Dense application content here -->
      </div>
    </div>
  </div>
  <!-- Laptop Base Notch -->
  <div class="bezel-stand"></div>
</div>
```

```css
.hardware-stage {
  max-width: 1200px;
  margin: 0 auto;
  position: relative;
}

.bezel-chassis {
  background: linear-gradient(180deg, #1C1E28 0%, #101117 100%);
  border-radius: 18px 18px 6px 6px;
  padding: 12px 12px 24px;
  border: 1px solid rgba(255, 255, 255, 0.12);
  box-shadow: 0 34px 80px rgba(20, 15, 50, 0.25);
  position: relative;
}

.bezel-chassis::after {
  content: "";
  position: absolute;
  bottom: 8px;
  left: 50%;
  transform: translateX(-50%);
  width: 44px;
  height: 3px;
  background: rgba(255, 255, 255, 0.25);
  border-radius: 2px;
}

.screen-viewport {
  background: #FFFFFF;
  border-radius: 10px;
  overflow: hidden;
  border: 1px solid #E2E6EF;
  container-type: inline-size;
}

.bezel-stand {
  width: min(380px, 45%);
  height: 12px;
  background: linear-gradient(180deg, #252835 0%, #0F1016 100%);
  border-radius: 0 0 14px 14px;
  margin: 0 auto;
  box-shadow: 0 16px 26px rgba(0, 0, 0, 0.35);
}
```

---

## 2. The 3-Column Dense Data Cockpit

A high-density workspace divided into complementary visual panes:

```html
<div class="cockpit-grid">
  <!-- Left Column: Search & Live Item Feed -->
  <div class="col-pane col-left">
    <div class="pane-search">
      <span>🔍</span>
      <input type="text" placeholder="Filter assets, models, or metrics..." />
    </div>
    <div class="dense-table-card">
      <div class="table-hdr">
        <span>Active Monitor</span>
        <span>Status</span>
      </div>
      <!-- Tabular Rows with live badges -->
      <div class="table-row">
        <span class="row-title">Model-v4 Turbo</span>
        <span class="badge-up tabular-nums">+99.4%</span>
      </div>
      <div class="table-row">
        <span class="row-title">Edge Cache US-East</span>
        <span class="badge-up tabular-nums">0.12ms</span>
      </div>
    </div>
  </div>

  <!-- Center Column: Key Metrics & Range Bars -->
  <div class="col-pane col-center">
    <div class="metrics-grid">
      <div class="metric-tile">
        <div class="metric-top">
          <span class="metric-label">Throughput</span>
          <b class="metric-val tabular-nums">24,055/s</b>
        </div>
        <div class="metric-range" style="--at: 72%;">
          <i class="range-thumb"></i>
        </div>
        <div class="range-bounds">
          <span>Min 18k</span>
          <span>Max 26k</span>
        </div>
      </div>
    </div>
  </div>

  <!-- Right Column: Status Gauge & Activity Feed -->
  <div class="col-pane col-right">
    <div class="gauge-card">
      <span class="gauge-label">System Health</span>
      <!-- SVG Gauge -->
      <svg class="semi-gauge" viewBox="0 0 140 82">
        <g fill="none" stroke-width="12" stroke-linecap="round">
          <path d="M 18 70 A 52 52 0 0 1 33.2 33.2" stroke="#EF4444" />
          <path d="M 33.2 33.2 A 52 52 0 0 1 70 18" stroke="#F97316" />
          <path d="M 70 18 A 52 52 0 0 1 106.8 33.2" stroke="#FACC15" />
          <path d="M 106.8 33.2 A 52 52 0 0 1 122 70" stroke="#22C55E" />
        </g>
        <line x1="70" y1="70" x2="94" y2="34" stroke="#1E2340" stroke-width="3.5" stroke-linecap="round" />
        <circle cx="70" cy="70" r="5" fill="#1E2340" />
      </svg>
      <div class="gauge-reading">98.4%</div>
      <span class="gauge-state">Optimal</span>
    </div>
  </div>
</div>
```

---

## 3. Staggered 5-Step Workflow Rail

Conveys a clear, logical journey with alternating vertical rhythm:

```html
<div class="steps-track">
  <div class="step-card">
    <div class="step-badge">01</div>
    <div class="step-icon">⚡</div>
    <h3 class="step-title">Ingest</h3>
    <p class="step-desc">Connect any streaming API or warehouse.</p>
  </div>
  <div class="step-card is-low">
    <div class="step-badge">02</div>
    <div class="step-icon">🔍</div>
    <h3 class="step-title">Index</h3>
    <p class="step-desc">Real-time vectorization & anomaly scan.</p>
  </div>
  <div class="step-card">
    <div class="step-badge">03</div>
    <div class="step-icon">🧪</div>
    <h3 class="step-title">Simulate</h3>
    <p class="step-desc">Run historical rule checks in a sandbox.</p>
  </div>
  <div class="step-card is-low">
    <div class="step-badge">04</div>
    <div class="step-icon">📐</div>
    <h3 class="step-title">Automate</h3>
    <p class="step-desc">Deploy automated triggers and alerts.</p>
  </div>
  <div class="step-card">
    <div class="step-badge">05</div>
    <div class="step-icon">📊</div>
    <h3 class="step-title">Monitor</h3>
    <p class="step-desc">Continuous telemetry and report generation.</p>
  </div>
</div>
```

```css
.steps-track {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 18px;
}

.step-card {
  background: #FFF;
  border: 1px solid var(--line);
  border-radius: 14px;
  padding: 24px 20px;
  box-shadow: var(--shadow-sm);
  transition: transform 0.2s var(--ease), box-shadow 0.2s var(--ease);
}

.step-card.is-low {
  margin-top: 36px;
}

.step-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-md);
  border-color: var(--brand-border);
}
```

---

## 4. Cadence Pricing Matrix with Dynamic Discount Toggle

```html
<div class="pricing-toggle-wrap">
  <span>Pay monthly</span>
  <div class="cadence-switch" id="cadenceSwitch">
    <div class="switch-ball"></div>
  </div>
  <span>Pay yearly</span>
  <span class="discount-badge">Save 17%</span>
</div>
```

```javascript
// Universal Billing Toggle Script
const switchEl = document.getElementById('cadenceSwitch');
let isAnnual = true;

switchEl.addEventListener('click', () => {
  isAnnual = !isAnnual;
  switchEl.classList.toggle('is-monthly', !isAnnual);

  document.querySelectorAll('.price-card').forEach(card => {
    const rateEl = card.querySelector('.price-rate');
    const noteEl = card.querySelector('.price-note');

    if (rateEl) {
      rateEl.textContent = isAnnual ? card.dataset.annualPrice : card.dataset.monthlyPrice;
    }
    if (noteEl) {
      noteEl.textContent = isAnnual ? card.dataset.annualBilled : 'Billed monthly · cancel anytime';
    }
  });
});
```
