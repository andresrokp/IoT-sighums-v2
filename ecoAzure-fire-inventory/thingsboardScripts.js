
// DASHBOARD MAPA DE BODEGAS

//widget selected entity table

function conversorTagsIdEquipos() {
    let namesMap = {
        '1100EE00E2000020401302082500B3C83A48':'Bota Estructural',
        '1100EE00E2000020401302232560CACF6939':'Pisicina de descontaminacion'
        //etc...
    }
    //value es un string con forma de array de JSON
    // [{"TagID":"1100EE00E2000020401302082500B3C83A48","Rssi":-59,"Numero":0},{"TagID":"1100EE00E2000020401302072500BADBC4D7","Rssi":-59,"Numero":1}...
    return JSON.parse(value).map( e => `<pre>${namesMap[e.TagID]}</pre>`).join('')
}