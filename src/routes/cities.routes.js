import { Router } from "express";
import { getAllCities } from "../controllers/cities.controllers.js";

const cityRouter = Router();

cityRouter.get("/cities", getAllCities);

export default cityRouter;