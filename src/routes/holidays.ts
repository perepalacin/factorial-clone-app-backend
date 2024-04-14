import express from 'express';
import sql from '../db';

const router = express.Router();

router.get('/', async (_req, res) => {
    const bank_holidays = await sql`
    SELECT *
    FROM bank_holidays
    WHERE date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '90 day'`
    res.json(bank_holidays)
})

export default router

