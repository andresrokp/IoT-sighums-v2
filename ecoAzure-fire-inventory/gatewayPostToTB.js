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
    log(`Message sent to device ${msg.values.gateId}`); // response
  } catch (error) {
    console.error(`Error sending message to device ${msg.values.gateId}:`, error);
  }
}

let start = performance.now()

function gateMsgGenerator(gateId, latitude, longitude, tagsQty){
  let tagsArray = Array(tagsQty).fill().map((e,i)=>{return{tag:`${gateId} - ${i+1}${i+1}${i+1}`,rssi:Math.floor(40*Math.random())}});
  switch (gateId) {
    case 'casabe':
      latitude = 7.003306
      longitude = -73.911278
      break;
    case 'cirainfantas':
      latitude = 6.937194
      longitude = -73.762806
    case 'camion7303':
      latitude = 7.111111
      longitude = -73.888888
    default:
      latitude = 1.1
      longitude = 1.1
  }
  return{
      ts: new Date().getTime(),
      values:{
        ts: new Date().getTime(),
        gateId,
        latitude,
        longitude, 
        tagsArray
      }
  }
}

let msgGate = gateMsgGenerator('casabe',7)
log(msgGate)
postTbGatewayDevice(msgGate)



log(new Date())
log(performance.now() - start)



// recurso_id,nombre,especificaciones,estado,fabricante,unidad,cod_inventario,sap_id,ogis_id,idRec1, Otro, Extintor de 20 lbs PQS, OPERATIVO, ANSUL, und, N.A.
// idRec2, Manguera doble chaqueta, Manguera 2.5" x 100 ft, OPERATIVO, DURALINE, und, N.A.
// idRec3, Desfibriliador automatico, Desfibrilador monitor, NO OPERATIVO, ZOLL, und, TLOI122132