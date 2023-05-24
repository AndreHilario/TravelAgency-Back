import { db } from "../database/database.connection.js"

export function getCities() {

    const result = db.query(`SELECT * FROM cities;`);
    return result;
}