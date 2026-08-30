(() => {
  const match = window.location.pathname.match(/^(.*\/)(en|es)(\/.*)?$/);
  if (!match) return;

  const targetLanguage = match[2] === "en" ? "es" : "en";
  const targetPath = `${match[1]}${targetLanguage}${match[3] || "/"}`;
  const link = [...document.querySelectorAll(".navbar a")].find(
    (candidate) => candidate.textContent.trim() === targetLanguage.toUpperCase(),
  );

  if (link) {
    link.classList.add("language-switch");
    link.href = `${targetPath}${window.location.search}${window.location.hash}`;
    link.hreflang = targetLanguage;
  }
})();
