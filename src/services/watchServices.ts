import { WatchEntry, NewWatchEntry, SummarizedWatchEntry } from '../types'
import watchesData from './watches.json'
import {uuid} from 'uuidv4';

const watches: WatchEntry[] = watchesData as WatchEntry[];

export const getAllWatches = () => watches;

//The find method can miss to find anything and therefore, may return an undefined!
export const findById = (id: string): WatchEntry | undefined => {
    const entry = watches.find(diary => diary.id === id);
    if (entry != null) {
        return entry;
    }
    return undefined;
}

export const getSummarizedWatchData = (): SummarizedWatchEntry[] => {
    return watches.map(({id, created_at, name, mechanism, brand}) => {
        return {
            id,
            created_at,
            name,
            mechanism,
            brand
        }
    })
};


export const addWatchEntry = (newWatchBody: NewWatchEntry): WatchEntry => {
    
    const id = uuid();
    console.log("this is it");
    const newWatchEntry = {
        id: id,
        ...newWatchBody
    };

    watches.push(newWatchEntry);
    return newWatchEntry;
};
