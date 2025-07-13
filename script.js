window.addEventListener('load', async () => {
    const ul = document.getElementById('guides-ul');
    const rootDir = '/guides';
    const files = await getFiles(rootDir);
    renderList(ul, rootDir, files);
});

async function getFiles(dir) {
    const response = await fetch(dir);
    if (!response.ok) return [];
    const text = await response.text();
    const files = text.split('\n').filter((line) => line.startsWith('<li>'));
    for (let i = 0; i < files.length; i++) {
        const indexStart = files[i].search('">') + 2;
        const indexEnd = files[i].search('</a>');
        files[i] = files[i].substring(indexStart, indexEnd);
    }
    return files;
}

function renderList(ul, rootDir, files) {
    for (let i = 0; i < files.length; i++) {
        const li = document.createElement('li');
        const a = document.createElement('a');
        li.appendChild(a);
        a.innerText = files[i].normalize();
        a.href = `${rootDir}/${files[i]}`;
        ul.appendChild(li);
    }
}
