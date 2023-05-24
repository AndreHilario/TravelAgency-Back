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

export function getFlightDetails(id) {

    const result = db.query(
        `
        SELECT * FROM flights
        WHERE id = $1;
        `,
        [id]
    );
    return result;
}

export function getMinAndMaxPrice(cityName, minPrice, maxPrice) {

    const result = db.query(
        `
        SELECT * FROM flights
        WHERE departure_city = $1 AND price >= $2 AND price <= $3
        ORDER BY price; 
        `,
        [cityName, minPrice, maxPrice]
    );
    return result;
}
