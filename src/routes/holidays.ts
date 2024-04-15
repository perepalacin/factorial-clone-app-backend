import express from 'express';
import sql from '../db';

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
    //To save resources on the client side, we could preprocess
    //the sql dates into JS dates instead of doing it in the client as we do now.
    // for (let i = 0; i< absences.length; i++) {
    //     const startDate = new Date(absences[i].start);
    //     const endDate = new Date(absences[i].finish);
    //     absences[i].start = startDate;
    //     absences[i].finish = endDate;
    // }
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


export default router

