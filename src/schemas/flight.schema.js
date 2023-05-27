import Joi from "joi";

export const flightSchema = Joi.object({
    number: Joi.number().greater(999).required(),
    flight_date: Joi.string().required(),
    flight_time: Joi.string().required(),
    departure_city: Joi.string().required(),
    destination: Joi.string().required(),
    airline_name: Joi.string().required(),
    departure_time: Joi.string().required(),
    arrival_time: Joi.string().required(),
    price: Joi.string().required(),
    flight_id: Joi.number().greater(0).required()
});