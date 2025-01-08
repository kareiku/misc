let originalData = null;
fetch("./data.json").then(response => response.json()).then(data => filterTable(originalData = data)).catch(error => console.error(error));

function populateTable(data) {
    const table = document.getElementById("results");
    const header = table.rows[0];
    table.innerHTML = "";
    table.appendChild(header);
    data.forEach(record => {
        const row = table.insertRow();
        record = [record.type, record.for, record.name, record.url];
        record.forEach(field => {
            const cell = row.insertCell();
            cell.innerHTML = field === false ? false : field || "";
            const URLMatch = cell.innerHTML.match(/https?:\/\/[^\s]+/);
            if (URLMatch) {
                cell.innerHTML = `<a href=${cell.innerHTML}>${cell.innerHTML}</a>`;
            }
        });
    });
}

function filterTable() {
    const column = document.getElementById("selector").value;
    const query = document.getElementById("filter").value;
    populateTable(query ? originalData.filter(record => selectColumn(column, record).toLowerCase().includes(query.toLowerCase())) : originalData);
}

function selectColumn(column, record) {
    return {
        "type": record.type,
        "for": record.for,
        "name": record.name,
    }[column] || "";
}
