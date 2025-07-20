/**
 * @param {string} text
 * @return {string[]}
 */
export default function (text) {
    return text.split(/[^\w]/);
}
