import { db } from "../database/database.connection.js"

export function getFlights(name) {
    const result = db.query(
        `
        SELECT * FROM flights
        WHERE destination = $1;
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
        WHERE destination = $1 AND price >= $2 AND price <= $3
        ORDER BY price; 
        `,
        [cityName, minPrice, maxPrice]
    );
    return result;
}

export function salveChoosedFlight(body) {

    const { number, flight_date, flight_time, departure_city, destination, airline_name, departure_time, arrival_time, price, flight_id } = body;

    const result = db.query(
        `
        INSERT INTO salve_flights (number, flight_date, flight_time, departure_city, destination, airline_name, departure_time, arrival_time, price, flight_id)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
        `, [number, flight_date, flight_time, departure_city, destination, airline_name, departure_time, arrival_time, price, flight_id]
    );

    return result;
}
