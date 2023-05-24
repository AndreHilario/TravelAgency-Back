import { db } from "../database/database.connection.js";

export function getHotelsByCityName(cityName) {

    const result = db.query(
        `
        SELECT hotels.*, array_agg(images.image_url) AS hotel_images
        FROM hotels
        LEFT JOIN images ON hotels.id = images.hotel_id
        WHERE hotels.located_city = $1
        GROUP BY hotels.id;
        `,
        [cityName]
    );
    return result;
}