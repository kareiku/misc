let albums = [];
document.querySelectorAll('a[href*="browse"]').forEach(album => albums.push(album?.href));
albums = new Set(albums);
albums = Array.from(albums).join(' ');
