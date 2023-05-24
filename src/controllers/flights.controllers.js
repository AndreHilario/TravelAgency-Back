import { getFlightDetails, getFlights } from "../repositories/flights.repository.js";

export async function getFlightsByCityName(req, res) {

    const { name } = req.params;

    try {
        const flights = await getFlights(name);
        
        res.status(200).send(flights.rows);
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