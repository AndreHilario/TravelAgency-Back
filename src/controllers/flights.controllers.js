import {  getMinAndMaxPrice, getFlightDetails, getFlights } from "../repositories/flights.repository.js";

export async function getFlightsByCityName(req, res) {

    const { name } = req.params;

    try {
        const flights = await getFlights(name);

        const corretctFlight = flights.rows.map((row) => ({
            id: row.id,
            flight_date: row.flight_date,
            flight_time: row.flight_time,
            departure_city: row.departure_city,
            price: row.price
        }));
        res.status(200).send(corretctFlight);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function getFlightById(req, res) {

    const { id } = req.params;

    try {
        const flightDetails = await getFlightDetails(id);

        res.status(200).send(flightDetails.rows[0]);
    } catch (err) {
        res.status(500).send(err.message);
    }

}

export async function getFlightByPrices(req, res) {

    const { cityName, minPrice, maxPrice } = req.params;

    try {
        const flightPrices = await getMinAndMaxPrice(cityName, minPrice, maxPrice);

        const corretctFlightPrice = flightPrices.rows.map((row) => ({
            id: row.id,
            flight_date: row.flight_date,
            flight_time: row.flight_time,
            departure_city: row.departure_city,
            price: row.price
        }));
        
        res.status(200).send(corretctFlightPrice);
    } catch (err) {
        res.status(500).send(err.message);
    }

}