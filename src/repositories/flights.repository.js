import { db } from "../database/database.connection.js"

export function getFlights(name) {
    const result = db.query(
        `
        SELECT * FROM flights
        WHERE departure_city = $1;
        `,
        [name]
    );
    return result;
}

export async function getFlightDetails(id) {

    const result = db.query(
        `
        SELECT * FROM flights
        WHERE id = $1;
        `,
        [id]
    );
    return result;
}