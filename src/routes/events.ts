import express from 'express';
import sql from '../db';

const router = express.Router();

router.get('/', async (_req, res) => {
    const bank_holidays = await sql
    `
    SELECT e.*, emp.name, emp.picture AS image
    FROM events e
    JOIN employees emp ON e.author = emp.id
    ORDER BY e.created_at DESC;
    `
    res.json(bank_holidays)
})

export default router

