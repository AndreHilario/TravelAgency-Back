import { Router } from "express";
import { getHotels } from "../controllers/hosting.controllers.js";

const hostingRouter = Router();

hostingRouter.get("/hosting/:cityName", getHotels);

export default hostingRouter;