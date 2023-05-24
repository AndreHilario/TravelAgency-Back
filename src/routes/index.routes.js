import { Router } from "express";
import cityRouter from "./cities.routes.js";
import flightRouter from "./flights.routes.js";


const router = Router();

router.use(cityRouter);
router.use(flightRouter);

export default router;