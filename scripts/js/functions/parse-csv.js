/**
 * @param {string} csv
 * @param {string} [delim=,] delim
 * @returns {string[][]}
 */
export default function (csv, delim = ',') {
    return csv.split('\n').map((row) => row.trim().split(delim));
}
