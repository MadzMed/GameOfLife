
if (document.getElementById('glow')) {
  const element = document.getElementById('glow');
  let i = 1
  while (i < 10) {
    setTimeout(() => {
      setTimeout(() => element.style.opacity = parseFloat(element.style.opacity) + 0.05, 1000);
      }, 1000);
    i += 1
  }
}

