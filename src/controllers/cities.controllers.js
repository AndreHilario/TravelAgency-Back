import { getCities } from "../repositories/cities.repository.js";


export async function getAllCities(req, res) {

    try {
        const { rows: cities } = await getCities();
        res.status(200).send(cities)
    } catch (err) {
        res.status(500).send(err.message);
    }
}