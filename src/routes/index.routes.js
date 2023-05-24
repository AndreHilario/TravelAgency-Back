import { Router } from "express";
import cityRouter from "./cities.routes.js";
import flightRouter from "./flights.routes.js";
import hostingRouter from "./hosting.routes.js";


const router = Router();

router.use(cityRouter);
router.use(flightRouter);
router.use(hostingRouter);

export default router;