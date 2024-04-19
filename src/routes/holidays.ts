import express from 'express';
import sql from '../db';
import axios from 'axios';
import { isDateInRange } from '../utils';

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
    try {
        axios
        .get(`http://localhost:3000/api/holidays/${requestedHolidays.employee_id}`)
        .then((response) => {
            console.log("lets check");
            const previousHolidays = response.data;
            console.log(previousHolidays);
            if (previousHolidays.length >= 1) {
                console.log("We have data");
                for (let i = 0; i < previousHolidays.length; i++) {
                    //We check if the days we requestes interferes with any of the previous absences we had.
                    const startDate = new Date(previousHolidays[i].start);
                    const endDate = new Date(previousHolidays[i].finish);
                    console.log(startDate.getDate());
                    console.log(endDate.getMonth());
                    if (isDateInRange(requestedHolidays.start, startDate, endDate) || isDateInRange(requestedHolidays.finish, startDate, endDate)) {
                        console.log("condition met");
                        throw new Error("Invalid requested days");
                    }
                }
            }
        })
        .catch((error) => {
            throw new Error ("Failed to fetch previous absences" + error);
        });
            const petition = await sql`
            INSERT INTO absences (type, start, finish, employee_id)
            VALUES (${requestedHolidays.type}, ${requestedHolidays.start}, ${requestedHolidays.finish}, ${requestedHolidays.employee_id})`;
            console.log("Petition inserted succesfully " + petition);
            res.status(200).json({message: "Holiday request submitted succesfully"});
        } catch (error) {
            console.error("Error inserting absence data: ", error);
            res.status(500).json({error: "Internal server error"});
        }
        });


export default router

