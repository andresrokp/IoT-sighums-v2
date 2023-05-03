const sql = require('mssql');
const { dbinfo } = require('../myvars.js')

const config = {
    server : dbinfo.server,
    database : dbinfo.database,
    user : dbinfo.user,
    password : dbinfo.password,
    options : {
        encrypt : true,
    }
}

async function getData(){
    try {
        await sql.connect(config)
        let resp = await sql.query('SELECT * FROM dbo.ogisDataCut')
        console.log(resp)
    } catch (error) {
        console.log(error)
    } finally {
        sql.close()
    }
}

getData()