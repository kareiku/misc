/**
 * @param {number} a
 * @param {number} b
 * @returns {{
 *   r: number[],
 *   q: number[],
 *   x: number[],
 *   y: number[]
 * }}
 */
export default function (a, b) {
    const x = (x2, x1, q1) => x2 - x1 * q1;
    const q = (r2, r1) => (r1 === 0 ? null : Math.floor(r2 / r1));

    const table = {
        r: [a, b],
        q: [null, q(a, b)],
        x: [1, 0],
        y: [0, 1]
    };

    while (table.r.at(-1) !== 0) {
        const r2 = table.r.at(-2);
        const r1 = table.r.at(-1);
        const q1 = q(r2, r1);

        table.r.push(r2 % r1);
        table.q.push(q(table.r.at(-2), table.r.at(-1)));
        table.x.push(x(table.x.at(-2), table.x.at(-1), q1));
        table.y.push(x(table.y.at(-2), table.y.at(-1), q1));
    }

    return table;
}
