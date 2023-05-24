import { getHotelsByCityName } from "../repositories/hosting.repository.js";

export async function getHotels(req, res) {

    const { cityName } = req.params;

    try {
        const hotels = await getHotelsByCityName(cityName);

        res.status(200).send(hotels.rows);
    } catch (err) {
        res.status(500).send(err.message);
    }
}