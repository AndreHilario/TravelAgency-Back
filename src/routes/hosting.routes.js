import { Router } from "express";
import { getHotels, getHotelsById, salveHotel } from "../controllers/hosting.controllers.js";
import { validateExistingCityName, validateIdHotel } from "../middlewares/hosting.middleware.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { validateParams } from "../middlewares/params.middleware.js";
import { getHotelsMinAndMaxPrice } from "../repositories/hosting.repository.js";
import { hostingSchema } from "../schemas/hosting.schema.js";

const hostingRouter = Router();

hostingRouter.get("/hosting/city/:cityName", validateParams, validateExistingCityName, getHotels);
hostingRouter.get("/hosting/:id", validateParams, validateIdHotel, getHotelsById);
hostingRouter.get("/hosting/price/:cityName/:minPrice/:maxPrice", validateParams, getHotelsMinAndMaxPrice);
hostingRouter.post("/hosting", validateSchema(hostingSchema), salveHotel);

export default hostingRouter;