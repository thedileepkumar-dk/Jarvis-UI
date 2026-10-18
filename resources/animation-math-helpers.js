/**
 * Kinetic Math & Interactive Physics Helpers
 * Zero-dependency, lightweight utilities for modern interactive web UIs.
 */

export const Kinetic = {
  /**
   * 1. 3D Perspective Tilt on Mousemove with Dynamic Sheen
   * @param {HTMLElement} element 
   * @param {number} maxTiltDegrees 
   */
  initTilt(element, maxTiltDegrees = 10) {
    if (!element) return;
    element.style.transformStyle = 'preserve-3d';
    element.style.transition = 'transform 0.15s ease-out';

    element.addEventListener('mousemove', (e) => {
      const rect = element.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      
      const centerX = rect.width / 2;
      const centerY = rect.height / 2;
      
      const rotateX = ((y - centerY) / centerY) * -maxTiltDegrees;
      const rotateY = ((x - centerX) / centerX) * maxTiltDegrees;
      
      element.style.transform = `perspective(1000px) rotateX(${rotateX.toFixed(2)}deg) rotateY(${rotateY.toFixed(2)}deg) scale3d(1.02, 1.02, 1.02)`;
      element.style.setProperty('--mouse-x', `${((x / rect.width) * 100).toFixed(1)}%`);
      element.style.setProperty('--mouse-y', `${((y / rect.height) * 100).toFixed(1)}%`);
    });

    element.addEventListener('mouseleave', () => {
      element.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)';
    });
  },

  /**
   * 2. Smooth Number Roll-Up Counter
   * @param {HTMLElement} element 
   * @param {number} targetValue 
   * @param {number} durationMs 
   * @param {string} prefix 
   * @param {string} suffix 
   */
  animateCounter(element, targetValue, durationMs = 1500, prefix = '', suffix = '') {
    if (!element) return;
    let startTime = null;

    function step(timestamp) {
      if (!startTime) startTime = timestamp;
      const progress = Math.min((timestamp - startTime) / durationMs, 1);
      // Cubic ease-out
      const ease = 1 - Math.pow(1 - progress, 3);
      const current = Math.floor(targetValue * ease);
      element.textContent = `${prefix}${current.toLocaleString()}${suffix}`;

      if (progress < 1) {
        requestAnimationFrame(step);
      }
    }

    requestAnimationFrame(step);
  },

  /**
   * 3. Semi-Circle Gauge Needle Coordinates
   * Converts a 0-100 score into SVG needle endpoints on a 180° semi-circle arc.
   */
  calculateNeedle(score, cx = 70, cy = 70, radius = 38) {
    const clampedScore = Math.max(0, Math.min(100, score));
    const angleDeg = -90 + (clampedScore / 100) * 180;
    const rad = (angleDeg * Math.PI) / 180;
    return {
      x2: Number((cx + radius * Math.cos(rad)).toFixed(2)),
      y2: Number((cy + radius * Math.sin(rad)).toFixed(2))
    };
  },

  /**
   * 4. Sticky Header Docking on Scroll
   */
  initStickyHeader(headerElement, threshold = 40) {
    if (!headerElement) return;
    window.addEventListener('scroll', () => {
      headerElement.classList.toggle('is-stuck', window.scrollY > threshold);
    }, { passive: true });
  },

  /**
   * 5. Interactive Pricing Switch
   */
  initPricingSwitch(switchElement, cardElements, onToggle) {
    if (!switchElement || !cardElements) return;
    let isAnnual = true;

    switchElement.addEventListener('click', () => {
      isAnnual = !isAnnual;
      switchElement.classList.toggle('is-monthly', !isAnnual);
      switchElement.setAttribute('aria-checked', isAnnual ? 'true' : 'false');

      cardElements.forEach(card => {
        const rateEl = card.querySelector('.rate-value');
        const billedEl = card.querySelector('.billed-note');
        if (rateEl) {
          rateEl.textContent = isAnnual ? card.dataset.annualPrice : card.dataset.monthlyPrice;
        }
        if (billedEl) {
          billedEl.textContent = isAnnual ? card.dataset.annualBilled : 'Billed monthly · cancel anytime';
        }
      });

      if (typeof onToggle === 'function') onToggle(isAnnual);
    });
  }
};
