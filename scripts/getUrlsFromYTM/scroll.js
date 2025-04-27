let currentScroll = 0;
const scrollInterval = setInterval(() => {
    window.scrollTo(0, document.body.scrollHeight);
    if (++currentScroll >= 15) clearInterval(scrollInterval);
}, 2000);
