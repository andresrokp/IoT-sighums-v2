let lat, lon;

switch (metadata.deviceName) {
    case 'fija_estaCenBod':
        lat = "6°56'10.6"
        lon = "73°45'39.2"
        break;
    case 'fija_bodCiElCen':
        lat = "7°00'11.9"
        lon = "73°54'40.6"
        break;
    default:
        // code
}

msg.lat = lat
msg.lon = lon

return msg;