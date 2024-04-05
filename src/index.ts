import express from 'express'
import watchRouter from './routes/watches';

const app = express()
app.use(express.json()) //Middleware to transform req.body into a json

const PORT = 3000;

app.get('/ping', (_req, res) => {
    console.log('Someone pinged here');
    res.send('pong');
});

app.use('/api/watches', watchRouter);

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`)
});