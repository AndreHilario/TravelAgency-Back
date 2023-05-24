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

export function getHotelDetails(id) {

    const result = db.query(
        `
        SELECT h.*, 
        (SELECT array_agg(i.image_url) FROM images AS i 
            WHERE i.hotel_id = h.id) AS hotel_images,
        (SELECT array_agg(a.amenity_name) FROM hotel_amenities AS ha 
            LEFT JOIN amenities AS a 
                ON ha.amenity_id = a.id WHERE ha.hotel_id = h.id) AS amenities_hotel
        FROM hotels AS h
        WHERE h.id = $1;
        `,
        [id]
    );
    return result;
}

export function getHotelsMinAndMaxPrice(cityName, minPrice, maxPrice) {

    const result = db.query(
        `
        SELECT h.*, 
        (SELECT array_agg(i.image_url) FROM images AS i 
            WHERE i.hotel_id = h.id) AS hotel_images,
        (SELECT array_agg(a.amenity_name) FROM hotel_amenities AS ha 
            LEFT JOIN amenities AS a 
                ON ha.amenity_id = a.id WHERE ha.hotel_id = h.id) AS amenities_hotel
        FROM hotels AS h
        WHERE located_city = $1 AND daily_price >= $2 AND daily_price <= $3
        ORDER BY daily_price; 
        `,
        [cityName, minPrice, maxPrice]
    );
    return result;
}