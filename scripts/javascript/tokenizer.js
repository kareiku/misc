export const EL_QUIJOTE_EXAMPLE_URL = 'https://gist.githubusercontent.com/jsdario/6d6c69398cb0c73111e49f1218960f79/raw/8d4fc4548d437e2a7203a5aeeace5477f598827d/el_quijote.txt';

export async function tokenizeText(url) {
    const tokenize = (text) => text.split(/[^\w]/);

    try {
        const response = await fetch(url);
        if (response.ok) {
            let data = await response.text();
            data = tokenize(data);
            data = data.filter(word => word.length > 1);
            return [...new Set(data)];
        }
    } catch (error) {
        console.error(error);
    }
}
