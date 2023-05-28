import { getHotelDetails, getHotelsByCityName, salveChoosedHotel } from "../repositories/hosting.repository.js";

export async function getHotels(req, res) {

    const { cityName } = req.params;

    try {
        const hotels = await getHotelsByCityName(cityName);

        res.status(200).send(hotels.rows);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function getHotelsById(req, res) {

    const { id } = req.params;

    try {
        const hotelById = await getHotelDetails(id);

        res.status(200).send(hotelById.rows[0]);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function getHotelsByPrice(req, res) {

    const { cityName, minPrice, maxPrice } = req.params;

    try {

        const hotelsByPrice = await getHotelsMinAndMaxPrice(cityName, minPrice, maxPrice);

        res.status(200).send(hotelsByPrice.rows);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function salveHotel(req, res) {

    try {

        await salveChoosedHotel(req.body);
        res.sendStatus(204);

    } catch (err) {
        res.status(500).send(err.message);
    }
}