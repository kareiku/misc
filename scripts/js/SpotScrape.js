const result = new Set();

function scrapeTracks() {
    const tracks = document.querySelectorAll('div[data-testid="tracklist-row"]');
    let newTracksAdded = false;

    tracks.forEach((track) => {
        const title = track.querySelector('a[draggable="false"]') ? track.querySelector('a[draggable="false"]').textContent.trim() : "";
        const album = track.querySelector("div._TH6YAXEzJtzSxhkGSqu span a") ? track.querySelector("div._TH6YAXEzJtzSxhkGSqu span a").textContent.trim() : "";
        const artist = track.querySelector("span.e-9812-text a") ? track.querySelector("span.e-9812-text a").textContent.trim() : "";

        const trackInfo = `${title} ${album} ${artist}`.trim();

        if (trackInfo && !result.has(trackInfo)) {
            result.add(trackInfo);
            newTracksAdded = true;
        }
    });

    console.log(Array.from(result).join("\n"));

    if (!newTracksAdded) {
        console.log("No new tracks found. You can stop the interval if you're done.");
    }
}

const scrapingInterval = setInterval(scrapeTracks, 3000);

// To manually stop the interval, run:
// clearInterval(scrapingInterval);
