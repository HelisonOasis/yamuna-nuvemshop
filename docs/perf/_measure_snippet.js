(() => {
  const entries = performance.getEntriesByType('resource');
  const nav = performance.getEntriesByType('navigation')[0];
  const paint = performance.getEntriesByType('paint');
  const lcpEntries = performance.getEntriesByType('largest-contentful-paint');
  const groups = {};
  const big = [];
  let transferTotal = 0;
  let decodedTotal = 0;
  for (const e of entries) {
    const transfer = e.transferSize || 0;
    const decoded = e.decodedBodySize || 0;
    transferTotal += transfer;
    decodedTotal += decoded;
    let kind = 'other';
    const n = e.name;
    if (/fonts\.googleapis|fonts\.gstatic|\.woff2?/i.test(n)) kind = 'font';
    else if (/style-async|\.css|scss\.tpl/i.test(n)) kind = 'css';
    else if (/\.js(\?|$)|javascript|fbevents|gtm|googletag/i.test(n)) kind = 'js';
    else if (/\.(jpe?g|png|webp|gif|svg|avif)(\?|$)/i.test(n) || /cdn-imagens|\/static\/images\//i.test(n)) kind = 'img';
    else if (/\/blog\//i.test(n) && e.initiatorType === 'fetch') kind = 'xhr-blog';
    groups[kind] = groups[kind] || { count: 0, transfer: 0, decoded: 0 };
    groups[kind].count++;
    groups[kind].transfer += transfer;
    groups[kind].decoded += decoded;
    if (decoded > 100000 || transfer > 50000) {
      big.push({
        url: n.length > 120 ? n.slice(0, 60) + '…' + n.slice(-50) : n,
        transfer,
        decoded,
        ms: Math.round(e.duration),
        type: e.initiatorType
      });
    }
  }
  big.sort((a, b) => b.decoded - a.decoded);
  const styles = [...document.querySelectorAll('style')].reduce((s, el) => s + (el.textContent || '').length, 0);
  const scripts = [...document.scripts].filter(s => !s.src).reduce((s, el) => s + (el.textContent || '').length, 0);
  const html = document.documentElement.outerHTML.length;
  const imgs = document.images.length;
  const completeImgs = [...document.images].filter(i => i.complete && i.naturalWidth > 0).length;
  const largeImgs = [...document.images]
    .filter(i => i.naturalWidth * i.naturalHeight > 500000)
    .slice(0, 8)
    .map(i => ({
      w: i.naturalWidth,
      h: i.naturalHeight,
      src: (i.currentSrc || i.src || '').replace(/^https?:\/\/[^/]+/, '').slice(0, 90)
    }));
  const fontLinks = [...document.querySelectorAll('link[href*="fonts.google"]')].map(l => l.href);
  const lcp = lcpEntries.length
    ? {
        size: lcpEntries[lcpEntries.length - 1].size,
        ms: Math.round(lcpEntries[lcpEntries.length - 1].startTime),
        tag: lcpEntries[lcpEntries.length - 1].element
          ? lcpEntries[lcpEntries.length - 1].element.tagName
          : null
      }
    : null;
  return {
    url: location.href,
    title: document.title,
    htmlChars: html,
    htmlMB: +(html / 1e6).toFixed(2),
    inlineStyleKB: Math.round(styles / 1024),
    inlineScriptKB: Math.round(scripts / 1024),
    imageCount: imgs,
    imagesComplete: completeImgs,
    largeImages: largeImgs,
    fontLinks: fontLinks.length,
    fontLinkSample: fontLinks.slice(0, 3),
    resourceCount: entries.length,
    transferTotalKB: Math.round(transferTotal / 1024),
    decodedTotalKB: Math.round(decodedTotal / 1024),
    groups,
    topResources: big.slice(0, 12),
    nav: nav
      ? {
          ttfb: Math.round(nav.responseStart),
          dcl: Math.round(nav.domContentLoadedEventEnd),
          load: Math.round(nav.loadEventEnd),
          docTransferKB: Math.round((nav.transferSize || 0) / 1024),
          docDecodedKB: Math.round((nav.decodedBodySize || 0) / 1024)
        }
      : null,
    paint: Object.fromEntries(paint.map(p => [p.name, Math.round(p.startTime)])),
    lcp
  };
})()
