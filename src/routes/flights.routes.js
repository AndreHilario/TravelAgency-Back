import { Router } from "express";
import { getFlightById, getFlightByPrices, getFlightsByCityName, salveFlight } from "../controllers/flights.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { flightSchema } from "../schemas/flight.schema.js";
import { validateParams } from "../middlewares/params.middleware.js";
import { validateExistingCity, validateId } from "../middlewares/flights.middleware.js";

const flightRouter = Router();

flightRouter.get("/flights/city/:name", validateParams, validateExistingCity, getFlightsByCityName);
flightRouter.get("/flights/:id", validateParams, validateId, getFlightById);
flightRouter.get("/flights/price/:cityName/:minPrice/:maxPrice", validateParams, getFlightByPrices);
flightRouter.post("/flights", validateSchema(flightSchema), salveFlight);

export default flightRouter;