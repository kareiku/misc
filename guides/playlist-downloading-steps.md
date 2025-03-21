# Steps for downloading the songs from a certain website

1. Access the website HTML page with the playlist.

2. Get the playlist into a JavaScript Set by using DevTools.
    * Note: This method might load the recommended songs at the bottom of the page, unless previously removed with the
      Inspector.

    1. Define the following variables:
        ```js
        const mySongsSet = new Set();
        const myClassName = ''; // This contains the class name to get the elements. It can be found by using the DevTools' Inspector.
        const myIntervalDuration = 1500; // This can be changed, but 1500ms is safe and does the job correctly.
        ```
    2. Define the following function:
        ```js
        const getElements = (songsSet, className) => new Array(...document.getElementByClassName(className)).forEach(song => songsSet.add(song.innerText));
        ```
    3. Define the following interval:
        ```js
        const songsInterval = setInterval(() => {
            getElements(mySongsSet, myClassName);
            console.log(mySongsSet); // This is unnecessary, but will help to see how many songs have been already loaded into the Set.
        }, myIntervalDuration);
        ```
    4. Resize the page to the lowest so that it loads the most number of songs per iteration. Then, start scrolling up
       and down, on a relaxed manner, until you the number of songs loaded is the correct one (compare with playlist
       size in the GUI).

    5. When finished, clear the interval:
        ```js
        clearInterval(songsInterval);
        ```

    6. Export the Set into a file to work locally. This can be done by copy and pasting or by using DevTools like this:
        ```js
        const mySongsArray = Array.from(mySongsSet);
        const mySongsJson = JSON.stringify(mySongsArray, null, 4);
        const blob = new Blob([mySongsJson], { type: 'application/json' });
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = 'playlist.json';
        link.click();
        ```

3. Once exported into your machine, navigate to where the file is located.

4. Open Node and run the following statements:
    ```js
    const fs = await import('fs');
    const myFile = fs.readFileSync('./playlist.json');
    const myJson = JSON.parse(myFile);
    for (let i = 0; i < myJson.length; i++) myJson[i] = myJson[i].replace(/\n/g, ' ');
    fs.writeFileSync('./songs.txt', myJson.join('\n'));
    ```
    * What this does: Loads the `fs` module. Reads the JSON file and parses it. Replaces any line breaks for consistency
      between songs. Writes all songs, one per line, into a file of name `songs.json`.

5. Exit Node and run the following statement:
    ```bash
    while IFS= read -r line; do yt-dlp "ytsearch:$line" -x; done < ./songs.txt
    ```
    * What this does: Reads each line and executes a search on YouTube by using the yt-dlp utility, which will later take the first result and download its audio (-x option) into the current directory.
    * Note: This assumes a global installation of yt-dlp. You might need to change some parts to adapt to your environment.

