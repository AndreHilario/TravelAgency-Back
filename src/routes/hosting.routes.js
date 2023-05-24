import { Router } from "express";
import { getHotels, getHotelsById } from "../controllers/hosting.controllers.js";

const hostingRouter = Router();

hostingRouter.get("/hosting/city/:cityName", getHotels);
hostingRouter.get("/hosting/:id", getHotelsById);

export default hostingRouter;