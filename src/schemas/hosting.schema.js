import Joi from "joi";

export const hostingSchema = Joi.object({
    hotel_name: Joi.string().required(),
    daily_price: Joi.string().required(),
    description: Joi.string().required(),
    located_city: Joi.string().required(),
    hotel_images: Joi.array().items(Joi.string()),
    amenities_hotel: Joi.array().items(Joi.string())
});