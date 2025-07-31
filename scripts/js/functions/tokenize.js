/**
 * @param {string} text
 * @return {string[]}
 */
export default function tokenize(text) {
    return text.split(/[^\w]/);
}
