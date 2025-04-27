function scrollAndExtractUrls(scrolls = 10, delay = 2000) {
    let urls = new Set();
    let currentScroll = 0;

    const interval = setInterval(() => {
        window.scrollTo(0, document.body.scrollHeight);
        currentScroll++;

        urls = urls.union(new Set(Array.from(document.querySelectorAll('a[href*="watch"]')).filter(a => a.href).map(a => a.href.substring(a.href.indexOf('?v=') + 3, a.href.indexOf('&')))));

        if (currentScroll < scrolls) {
            console.log('Current scroll: ', (currentScroll + 1));
        } else {
            console.log(urls.join('\n'));
            clearInterval(interval);
        }
    }, delay);
}
