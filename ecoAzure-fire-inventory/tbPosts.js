const log = console.log;

let {credentials, ecopetrolGateToken} = require('../myvars')

// Pause message Telemetry to the specified device ID
async function sendMessageToDevice(msg) {
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

function gateMsgGenerator(gateId, latitude, longitude,  tagsArray){
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

let msgGate1 = gateMsgGenerator(1,11,1111,[['1tag1','1rssi1']])
let msgGate2 = gateMsgGenerator(2,2,2222,[['2tag1','2rssi1'],['2tag2','2rssi2']])
let msgGate3 = gateMsgGenerator(3,33,3333,[['3tag1','3rssi1'],['3tag2','3rssi2'],['3tag3','3rssi3']])

sendMessageToDevice(msgGate1)

log(performance.now() - start)