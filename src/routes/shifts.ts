import express from 'express';
import sql from '../db';

const router = express.Router();

router.get('/:id/:month/:year', async (req, res) => {
    console.log("Called");
    const employeeId = Number(req.params.id);
    const month = Number(req.params.month) + 1;
    const year = Number(req.params.year);
    const shifts = await sql
    `SELECT *
    FROM shifts
    WHERE employee_id = ${employeeId}
    AND EXTRACT(YEAR FROM day) = ${year}
    AND EXTRACT(MONTH FROM day) = ${month}
    ORDER BY start ASC;`
    res.json(shifts);
    console.log(shifts);
});


export default router
