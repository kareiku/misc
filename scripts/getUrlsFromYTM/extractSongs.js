let songs = [];
document.querySelectorAll('a[href*="watch"]').forEach(song => songs.push(song?.href));
songs = new Set(songs);
songs = Array.from(songs).join(' ');
