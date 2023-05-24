import { Router } from "express";
import cityRouter from "./cities.routes.js";


const router = Router();

router.use(cityRouter);

export default router;