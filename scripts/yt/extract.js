const query = 'a[href*="browse"]';
const data = [];
document.querySelectorAll(query).forEach((a) => {
    if (a?.href) data.push(a.href);
});
data.join("\n");
