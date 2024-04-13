import express from 'express'
import employeeRouter from './routes/employees';
import holidaysRouter from './routes/holidays';
import cors from 'cors';

const app = express();

app.use(express.json()); //Middleware to transform req.body into a json
app.use(cors());

app.use('/', express.static('dist'));
const PORT = 3000;

app.get('/ping', (_req, res) => {
    console.log('Someone pinged here');
    res.send('pong');
});

app.use('/api/employees', employeeRouter);
app.use('/api/holidays', holidaysRouter);

// app.get('/api/employees', async (_req, res) => {
//     const employees = await sql`SELECT * FROM employees`
//     res.json(employees)
//   })


app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`)
});
