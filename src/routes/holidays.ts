import express from 'express';
import sql from '../db';
import axios from 'axios';

const router = express.Router();

router.get('/', async (_req, res) => {
    const bank_holidays = await sql`
    SELECT *
    FROM bank_holidays
    WHERE date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '90 day'`
    res.json(bank_holidays)
});

router.get('/all', async (_req, res) => {
    const absences = await sql`
    SELECT absences.*, employees.name
    FROM absences
    JOIN employees ON absences.employee_id = employees.id;`
    res.json(absences);
})

router.get('/:id', async (req, res) => {
    const employee_id = req.params.id;
    const holidays = await sql`
    SELECT absences.*, employees.name
    FROM absences
    JOIN employees ON absences.employee_id = employees.id
    WHERE absences.employee_id = ${employee_id};
    `
    for (let i = 0; i< holidays.length; i++) {
        holidays[i].start = new Date(holidays[i].start);
        holidays[i].finish = new Date(holidays[i].finish);
    }
    res.json(holidays)
});

router.post('/submit', async (req, res) => {
    const requestedHolidays = req.body;
    let validatedData = true; // Use let instead of var for block-scoped variables
    //TODO: Check if the user has enough days off left to request this holidays.
    try {
        const response = await axios.get(`http://localhost:3000/api/holidays/${requestedHolidays.employee_id}`);
        const previousHolidays = response.data;
        if (previousHolidays.length >= 1) {
            for (let i = 0; i < previousHolidays.length; i++) {
                const startDate = (new Date(previousHolidays[i].start)).getTime();
                const endDate = (new Date(previousHolidays[i].finish)).getTime();
                const requestedStart = (new Date(requestedHolidays.start)).getTime();
                const requestedEnd = (new Date(requestedHolidays.finish)).getTime();
                if ((requestedStart >= startDate && requestedStart <= endDate) || (requestedEnd >= startDate && requestedEnd <= endDate)) {
                    validatedData = false;
                    break;
                }
            }
        }
        if (!validatedData) {
            return res.status(406).json({ error: "The days requested conflict with a previous request" });
        }
        const petition = await sql`
            INSERT INTO absences (type, start, finish, employee_id)
            VALUES (${requestedHolidays.type}, ${requestedHolidays.start}, ${requestedHolidays.finish}, ${requestedHolidays.employee_id})`;
        console.log("Petition inserted successfully " + petition);
        return res.status(200).json({ message: "Holiday request submitted successfully" });
    } catch (error) {
        console.error("Error inserting absence data: ", error);
        return res.status(500).json({ error: "Internal server error" });
    }
});

export default router

