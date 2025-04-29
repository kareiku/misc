(() => {
    const albums = [];

    document.querySelectorAll('ytmusic-two-row-item-renderer').forEach(item => {
        const titleEl = item.querySelector('.title a');
        const subtitleEl = item.querySelector('.subtitle');

        const title = titleEl?.textContent.trim() || 'Unknown title';
        const url = titleEl ? 'https://music.youtube.com/' + titleEl.getAttribute('href') : 'Unknown URL';

        const type = subtitleEl?.querySelector('span')?.textContent.trim() || 'Unknown type';

        const artistEl = subtitleEl?.querySelector('a');
        const artist = artistEl?.textContent.trim() || 'Unknown artist';

        albums.push({ title, url, type, artist });
    });

    const csv = albums.map(({ title, url, type, artist }) => `"${title.replace(/"/g, '""')}","${url}","${type}","${artist.replace(/"/g, '""')}"`).join('\n');

    console.log(csv);
})();
