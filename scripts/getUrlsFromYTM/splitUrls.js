import fs from 'fs';

const src = process.argv[2];
const dest = process.argv[3];
const file = fs.readFileSync(src)
const [filename, ext] = [src.substring(0, src.lastIndexOf('.')), src.substring(src.lastIndexOf('.') + 1)];

let urls = file.toString().split('\n');
let i = 0;
while (urls.length > 0) {
    let head;
    [head, urls] = [urls.slice(0, 10), urls.slice(10)];
    fs.writeFileSync(`./${dest}/${filename}-${i}.${ext}`, head.join(' '));
    i++;
}
