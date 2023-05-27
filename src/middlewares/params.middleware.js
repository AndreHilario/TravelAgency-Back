
export function validateParams(req, res, next) {

    const { cityName, id, minPrice, maxPrice } = req.params;

    if (cityName) {
        if (!cityName || typeof cityName !== "string") {

            return res.status(400).send("Parâmetro 'cityName' passado não existe");
        }
    }

    if (minPrice || maxPrice) {
        if (!cityName || typeof cityName !== "string" || !minPrice || isNaN(Number(minPrice)) || !maxPrice || isNaN(Number(maxPrice))) {

            return res.status(400).send("Parâmetros inválidos ou inexistentes");
        }
    }
    if (id) {
        if (!id || !Number.isInteger(Number(id))) {

            return res.status(400).send("Parâmetro inválido ou inexistente");
        }
    }

    next();
}