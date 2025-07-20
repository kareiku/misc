/**
 * @param {HTMLSelectElement} selector
 * @param {{ text: string, value: string }[]} options
 */
export default function (selector, options) {
    let first = true;
    options.forEach((option) => {
        const opt = new Option(option.text, option.value, first, first);
        selector.appendChild(opt);
        if (first) first = false;
    });
}
