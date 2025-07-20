/**
 * @param {*} str
 * @returns {boolean}
 */
export default function (str) {
    const httpRegex = /^https?:\/\/[^\s]+$/;
    return typeof str === 'string' && httpRegex.test(str);
}
