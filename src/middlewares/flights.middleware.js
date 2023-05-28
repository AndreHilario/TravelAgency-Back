import { getFlightDetails } from "../repositories/flights.repository.js";
import { getFlights } from "../repositories/flights.repository.js";

export async function validateExistingCity(req, res, next) {

    const { name } = req.params;

    try {

        const city = await getFlights(name);
        if (city.rowCount === 0) return res.status(404).send({ message: "Essa cidade não possui voos disponíveis no momento" });

        next();
    } catch (err) {
        res.status(500).send(err.message);
    }

}

export async function validateId(req, res, next) {

    const { id } = req.params;

    try {

        const tryId = await getFlightDetails(id);
        if (tryId.rowCount === 0) return res.status(404).send({ message: "Esse voo não existe" });

        next();
    } catch (err) {
        res.status(500).send(err.message);
    }

}

