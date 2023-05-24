import { Router } from "express";
import { getFlightById, getFlightByPrices, getFlightsByCityName } from "../controllers/flights.controllers.js";

const flightRouter = Router();

flightRouter.get("/flights/city/:name", getFlightsByCityName);
flightRouter.get("/flights/:id", getFlightById);
flightRouter.get("/flights/price/:cityName/:minPrice/:maxPrice", getFlightByPrices);

export default flightRouter;