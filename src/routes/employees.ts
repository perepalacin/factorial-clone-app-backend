import express from 'express';
import sql from '../db';
import { TeamMemberProps } from '../types';

const router = express.Router();

router.get('/', async (_req, res) => {
    const employees = await sql`SELECT * FROM employees ORDER BY name ASC;`
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
    SELECT t.team_name, e.name, e2.*
    FROM teams t
    JOIN employee_teams tm ON t.id = tm.team_id
    JOIN employees e ON tm.employee_id = e.id
    JOIN employee_teams tm2 ON t.id = tm2.team_id
    JOIN employees e2 ON tm2.employee_id = e2.id
    WHERE e.id= ${employeeId};
    `;
    let transferData: TeamMemberProps[] = [
        {
            teamName: "REERGREGHH$$T%TRGVY%$ %$%Y/%$W %UWGSHRHRZ GHYJE%Y%$U$QYDGN",
            members: [{
                name: "AA",
                picture: "AA",
            }]
        }
    ];
    employees.forEach(item => {
        const team = item.team_name;
        const employeeDetails = {
            name: item.name,
            picture: item.picture,
        };
        let foundMatch = false;
        for ( let i = 0; i < transferData.length; i++) {
            if (transferData[i].teamName == team) {
                transferData[i].members.push(employeeDetails);
                foundMatch = true;
                break;
            }
        }
        if (foundMatch === false) {
            transferData.push({
                teamName: team,
                members: [employeeDetails]
            });
        };
    });
    transferData.shift();
    res.send(transferData);    
})

export default router
