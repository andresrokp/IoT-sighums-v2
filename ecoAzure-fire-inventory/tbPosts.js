const log = console.log;


let {credentials, ecopetrolGateToken} = require('../myvars')

// Pause message Telemetry to the specified device ID
async function sendMessageToDevice(deviceId, message) {
  // set variables
  const url = `https://${credentials.dns}/api/v1/${ecopetrolGateToken}/telemetry`;
  const headers = {
    'Content-Type': 'application/json'
  };
  const body = JSON.stringify(message);
  // try the post
  try {
    const response = await fetch(url, { method: 'POST', headers, body });
    log(`Message sent to device ${message.device.uniqueId} - ${message.device.name}`); // response
  } catch (error) {
    console.error(`Error sending message to device ${deviceId}:`, error);
  }
}

let start = performance.now()


log(performance.now() - start)