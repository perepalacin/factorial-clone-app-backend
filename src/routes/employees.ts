import express from 'express';
import sql from '../db';
import { TeamMemberProps } from '../types';

const router = express.Router();

interface nodesProps {
    id: string;
    data: {
        name: string;
        role: string;
        picture: string;
        incorporation: string;
        location: string;
    };
    position: {
        x: number,
        y: number
    };
    type: string;
};

interface edgesProps {
    type: string;
    source: string;
    target: string;
    id: string;
    sourceHandle: string;
}

router.get('/', async (_req, res) => {
    const employees = await sql`SELECT * FROM employees ORDER BY name ASC;`
    res.json(employees)
})

router.get('/employee/:id', async (req, res) => {
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

router.get('/org/:id', async (req, res) => {
    console.log("called");
    const supervisor_id = Number(req.params.id);
    const employees = await sql`
    SELECT * FROM employees WHERE supervisor = ${supervisor_id};
    `;
    const resultingNodes: nodesProps[] = [];
    const resultingEdges: edgesProps[] = [];
    for (let i = 0; i < employees.length; i++) {
        if (supervisor_id !== Number(employees[i].id)) {
            const newNode: nodesProps = {
                id: String(employees[i].id),
                data: {
                    name: employees[i].name,
                    picture: employees[i].picture,
                    role: employees[i].role,
                    incorporation: employees[i].incorporation,
                    location: employees[i].location,
                },
                position: {
                    x: i*250,
                    y: 0
                },
                type: "employeeNode"
            };
            resultingNodes.push(newNode);
            const newEdge: edgesProps = {
                type: "smoothstep",
                source: String(supervisor_id),
                target: String(employees[i].id),
                id: String(i),
                sourceHandle: "out",
            };
            resultingEdges.push(newEdge);
        }
    }
    console.log(resultingNodes);
    res.json([resultingNodes, resultingEdges])
 });

 router.get('/org', async (_req, res) => {
    const employees = await sql`
    SELECT * FROM employees WHERE id = supervisor;
    `;
    const resultingNodes: nodesProps[] = [];
    const resultingEdges: edgesProps[] = [];
    for (let i = 0; i < employees.length; i++) {
        if (employees[i].supervisor_id === employees[i].employee_id ) {
            const newNode: nodesProps = {
                id: String(employees[i].supervisor),
                data: {
                    name: employees[i].name,
                    picture: employees[i].picture,
                    role: employees[i].role,
                    incorporation: employees[i].incorporation,
                    location: employees[i].location,
                  },
                position: {
                    x: i*250,
                    y: 0
                },
                type: "employeeNode"
            };
            resultingNodes.push(newNode);
        }
    }
    // console.log(employees);
    for (let i = 0; i < employees.length; i++) {
        const newNode: nodesProps = {
            id: String(employees[i].supervisor),
            data: {
                name: employees[i].name,
                picture: employees[i].picture,
                role: employees[i].role,
                incorporation: employees[i].incorporation,
                location: employees[i].location,
            },
            position: {
                x: i*250,
                y: 0
            },
            type: "employeeNode"
        };
        resultingNodes.push(newNode);
        if (employees[i].subordinate_id !== employees[i].supervisor_id) {
            const newEdge: edgesProps = {
                type: "smoothstep",
                source: String(employees[i].subordinate_id),
                target: String(employees[i].supervisor_id),
                id: String(i),
                sourceHandle: "out",
            };
            resultingEdges.push(newEdge);
        }
    }
    res.json([resultingNodes, resultingEdges])
 });


export default router
