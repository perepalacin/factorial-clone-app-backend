import express from 'express';
import sql from '../db';

const router = express.Router();

router.get('/', async (_req, res) => {
    const bank_holidays = await sql`SELECT * FROM bank_holidays`
    res.json(bank_holidays)
})

export default router
