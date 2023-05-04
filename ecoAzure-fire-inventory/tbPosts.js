const log = console.log;


const { now } = require('tarn/dist/utils');
let {credentials, ecopetrolGateToken} = require('../myvars')

// Pause message Telemetry to the specified device ID
async function sendMessageToDevice(deviceId, msg) {
  // set variables
  const url = `https://${credentials.dns}/api/v1/${ecopetrolGateToken}/telemetry`;
  const headers = {
    'Content-Type': 'application/json'
  };
  const body = JSON.stringify(msg);
  // try the post
  try {
    const response = await fetch(url, { method: 'POST', headers, body });
    log(`Message sent to device ${msg.gateId}`); // response
  } catch (error) {
    console.error(`Error sending message to device ${msg.gateId}:`, error);
  }
}

let start = performance.now()

function gateMsgGenerator(gateId, latitude, longitude,  tagsArray){
    return{
        ts: new Date().getMilliseconds,
        gateId,
        latitude,
        longitude, 
        tagsArray
    }
}

gateMsgGenerator(1,11,1111,[['1tag1','1rssi1']])

sendMessageToDevice(msg)

log(performance.now() - start)