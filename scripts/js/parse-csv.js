/**
 * Parses a CSV asynchronously using function generators.
 *
 * response: Response - The fetch response where the reader will be got from.
 * reader: ReadableStreamDefaultReader<Uint8Array> - The stream where data is.
 * options:
 *   encoding: string - The character encoding. Defaults to utf-8.
 *   delim: string - The delimiter character. Defaults to ','.
 *   quote: string - The quotation character. Defaults to '"'.
 *
 * yields: string[] - The next parsed line.
 */

export async function* parseCsvFromResponse(response, options = {}) {
    const reader = response.body.getReader();
    yield* parseCsvFromReader(reader, options);
}

export async function* parseCsvFromReader(reader, options = {}) {
    const decoder = new TextDecoder(options.encoding || 'utf-8');
    let buffer = '';
    let done = false;

    while (!done) {
        const { value, done: streamDone } = await reader.read();
        done = streamDone;
        if (value) {
            buffer += decoder.decode(value, { stream: true });

            let lines = buffer.split(/\r?\n/);
            buffer = lines.pop();

            for (const line of lines) {
                yield parseCSVLine(line, options);
            }
        }
    }

    if (buffer) {
        yield parseCSVLine(buffer, options);
    }
}

function parseCsvLine(buffer, options = {}) {
    const delim = options.delim || ',';
    const quote = options.quote || '"';
    const line = [];
    let field = '';
    let inQuotes = false;
    let i = 0;

    while (i < buffer.length) {
        const c = buffer[i];

        if (inQuotes) {
            if (c === quote) {
                if (buffer[i + 1] === quote) {
                    field += quote;
                    i += 2;
                } else {
                    inQuotes = false;
                    i++;
                }
            } else {
                field += c;
                i++;
            }
        } else {
            if (c === quote) {
                inQuotes = true;
                i++;
            } else if (c === delim) {
                line.push(field);
                field = '';
                i++;
            } else {
                field += c;
                i++;
            }
        }
    }

    line.push(field);

    return line;
}
