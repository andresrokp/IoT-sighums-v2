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

let msgGate = gateMsgGenerator('casabe',10.1111,-74.1111,7)
log(msgGate)
postTbGatewayDevice(msgGate)



log(new Date())
log(performance.now() - start)