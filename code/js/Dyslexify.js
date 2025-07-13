export default function (word, distance, ...words) {
    if (!words.length) return word;
    words = words.filter(
        (w) => Math.abs(levenshteinDistance(word, w) - distance) <= distance,
    );
    words.push(word);
    words = [...new Set(words)];
    return words[Math.floor(Math.random() * words.length)];
}

function levenshteinDistance(a, b) {
    if (!a.length) return b.length;
    if (!b.length) return a.length;

    const dp = Array(b.length + 1)
        .fill(null)
        .map(() => Array(a.length + 1).fill(0));

    for (let i = 0; i <= a.length; i++) dp[0][i] = i;
    for (let j = 0; j <= b.length; j++) dp[j][0] = j;

    for (let j = 1; j <= b.length; j++) {
        for (let i = 1; i <= a.length; i++) {
            const cost = a[i - 1] === b[j - 1] ? 0 : 1;
            dp[j][i] = Math.min(
                dp[j - 1][i] + 1,
                dp[j][i - 1] + 1,
                dp[j - 1][i - 1] + cost,
            );
        }
    }

    return dp[b.length][a.length];
}
