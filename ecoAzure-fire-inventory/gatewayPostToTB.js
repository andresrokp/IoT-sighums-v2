const log = (str)=>console.log(JSON.stringify(str, null, 4));

let {credentials, ecopetrolGateToken} = require('../myvars')

// Pause message Telemetry to the specified device ID
async function postTbGatewayDevice(msg) {
  // set variables
  const url = `https://${credentials.dns}/api/v1/${ecopetrolGateToken}/telemetry`;
  const headers = {
    'Content-Type': 'application/json'
  };
  const body = JSON.stringify(msg);
  // try the post
  try {
    const response = await fetch(url, { method: 'POST', headers, body });
    log(`Message sent to device ${msg.values.BodegaID}`); // response
  } catch (error) {
    console.error(`Error sending message to device ${msg.values.BodegaID}:`, error);
  }
}

let start = performance.now()

function gateMsgGenerator(BodegaID, tagsArray){
  // let tagsArray = Array(tagsQty).fill().map((e,i)=>{return{tag:`${gateId} - ${i+1}${i+1}${i+1}`,rssi:Math.floor(40*Math.random())}});
  tagsArray = tagsArray.map(e=>{return{TagID:e,Rssi:Math.floor(40*Math.random())}});
  let Latitude = 1.11111
  let Longitude = -1.11111
  switch (BodegaID) {
    case 'bodega_id_2':
      Latitude = 7.222222
      Longitude = -73.22222
      break;
    case 'bodega_id_3':
      Latitude = 6.33333
      Longitude = -73.33333
    case 'bodega_id_4':
      Latitude = 7.44444
      Longitude = -73.44444
    case 'bodega_id_5':
      Latitude = 7.55555
      Longitude = -73.55555
  }
  return{
      ts: new Date().getTime(),
      values:{
        Ts: new Date().getTime(),
        BodegaID,
        Latitude,
        Longitude, 
        tagsArray
      }
  }
}

let msgGate = gateMsgGenerator('bodega_id_2',['tag1','tag6','tag7'])
log(msgGate)
postTbGatewayDevice(msgGate)
msgGate = gateMsgGenerator('bodega_id_3',['tag2','tag3'])
postTbGatewayDevice(msgGate)
msgGate = gateMsgGenerator('bodega_id_5',['tag4','tag5'])
postTbGatewayDevice(msgGate)



log(new Date())
log(performance.now() - start)



// recurso_id,nombre,especificaciones,estado,fabricante,unidad,cod_inventario,sap_id,ogis_id,idRec1, Otro, Extintor de 20 lbs PQS, OPERATIVO, ANSUL, und, N.A.
// idRec2, Manguera doble chaqueta, Manguera 2.5" x 100 ft, OPERATIVO, DURALINE, und, N.A.
// idRec3, Desfibriliador automatico, Desfibrilador monitor, NO OPERATIVO, ZOLL, und, TLOI122132