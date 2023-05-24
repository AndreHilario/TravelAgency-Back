import { Router } from "express";
import { getFlightById, getFlightsByCityName } from "../controllers/flights.controllers.js";

const flightRouter = Router();

flightRouter.get("/flights/city/:name", getFlightsByCityName);
flightRouter.get("/flights/:id", getFlightById);


export default flightRouter;