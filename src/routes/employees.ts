import express from 'express';
import sql from '../db';

const router = express.Router();

router.get('/', async (_req, res) => {
    const employees = await sql`SELECT * FROM employees`
    res.json(employees)
})

router.get('/:id', async (req, res) => {
    const employeeId = req.params.id;
    const employees = await sql`SELECT * FROM employees WHERE id = ${employeeId}`
    res.json(employees)
});

export default router
