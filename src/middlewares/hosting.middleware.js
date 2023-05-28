import { getHotelDetails, getHotelsByCityName } from "../repositories/hosting.repository.js";

export async function validateExistingCityName(req, res, next) {

    const { cityName } = req.params;

    try {

        const newCity = await getHotelsByCityName(cityName);
        if (newCity.rowCount === 0) return res.status(404).send({ message: "Essa cidade não possui hospegadens disponíveis no momento" });

        next();
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function validateIdHotel(req, res, next) {

    const { id } = req.params;

    try {

        const tryId = await getHotelDetails(id);
        if (tryId.rowCount === 0) return res.status(404).send({ message: "Esse hotel não existe" });

        next();
    } catch (err) {
        res.status(500).send(err.message);
    }

}