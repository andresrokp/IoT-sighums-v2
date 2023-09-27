
// DASHBOARD MAPA DE BODEGAS

//widget selected entity table

function conversorTagsIdEquipos() {
    let namesMap = {
        '1100EE00E2000020401302082500B3C83A48':'Bota Estructural',
        '1100EE00E2000020401302232560CACF6939':'Pisicina de descontaminacion'
        //etc...
    }
    //value es un string con forma de array de JSON, que se parsea para tener un Arreglo de Objetos
    // [{"TagID":"1100EE00E2000020401302082500B3C83A48","Rssi":-59,"Numero":0},{"TagID":"1100EE00E2000020401302072500BADBC4D7","Rssi":-59,"Numero":1}...

    // return JSON.parse(value).map( e => `<pre>${namesMap[e.TagID]}</pre>`).join('')
    
    let rowsArray = JSON.parse(value).map( (tag, idx) => {
        
        let { TagID } = tag;
        let tagMark = TagID //.slice(0, 12);
        let equipName = namesMap[TagID];
        return `<tr><td><pre>${idx+1}</pre></td><td><pre>${equipName}</pre></td><td><pre>${tagMark}</pre><td></tr>`;

    })

    let tableContent = rowsArray.join('')

    let table = `
    <table>
        <thead>
            <tr>
                <th>Item</th>
                <th>Equipo</th>
                <th>TagID</th>
            </tr>
        </thead>
        <tbody>
            ${tableContent}
        </tbody>
    </table>
    `

    return table;
}

function mapa_mapa_settingLabelFunction (){
    // // approach 1: randomice translation value
    // const max = 8;
    // const min = -8;
    // const gap = Math.floor(Math.random() * (max - min + 1)) + min;

    // return `<div style='text-shadow: -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff, 1px 1px 0 #fff; transform: translate(0px, ${gap}px);'>${dsIndex}</div>`;

    //approach 2: preset a list for translation
    const pushLeft = [5,6,12];
    const pushRight = [4,20,14];
    let gap = 0;

    if (pushLeft.includes(dsIndex)) gap = -30;
    else if (pushRight.includes(dsIndex)) gap = 30;

    return `<div style='transform: translate(${gap}px, 0px); text-shadow: -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff, 1px 1px 0 #fff'>\${entityName}</div>`;
}