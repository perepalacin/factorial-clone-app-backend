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

router.get('/teammates/:id', async (req, res) => {
    const employeeId = req.params.id;
    const employees = await sql
    `
    SELECT e.name, e.picture, t.team_name 
    FROM teams t 
    JOIN employee_teams tm
        ON t.id = tm.team_id 
    JOIN employees e 
        ON tm.employee_id = e.id
    AND tm.team_id IN (0, ${employeeId})
    ORDER BY t.team_name, e.name;
    `;
    res.json(employees);
})

export default router
