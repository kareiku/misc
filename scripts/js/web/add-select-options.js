/**
 * @param {HTMLSelectElement} selector
 * @param {{ text: string, value: string }[]} options
 */
export default function (selector, options) {
    const first = options.shift();
    selector.appendChild(new Option(first.text, first.value, true, true));
    options.forEach((option) =>
        selector.appendChild(new Option(option.text, option.value))
    );
}
