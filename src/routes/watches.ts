import express from 'express';
import * as watchServices from '../services/watchServices'; 
import toNewWatchEntry from '../utils';

const router = express.Router();

router.get('/', (_req, res) => {
    const watches = watchServices.getSummarizedWatchData();
    res.send(watches);
})

router.get('/:id', (req, res) => {
    const watch = watchServices.findById(req.params.id);
    return (watch !== null)
    ? res.send(watch)
    : res.sendStatus(404)
});

router.post('/', (req, res) => {
    try {
        //We create a suplementary function to typecheck all the data received.
        const newWatchEntry = toNewWatchEntry(req.body);
        const addedWatchEntry = watchServices.addWatchEntry(newWatchEntry);
        res.json(addedWatchEntry);
    } catch (error) {
        res.status(400).send(error)
    }
});

export default router