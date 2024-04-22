import express from 'express';
import sql from '../db';

const router = express.Router();

router.get('/:id/:month/:year', async (req, res) => {
    const employeeId = req.params.id;
    const month = req.params.month;
    const year = req.params.year;
    const shifts = await sql`SELECT * FROM shifts WHERE employee_id = ${employeeId} AND `
    const employees = await sql`SELECT * FROM employees WHERE id = ${employeeId}`
    res.json(employees)
});


export default router
