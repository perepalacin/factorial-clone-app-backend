import { Brand, Mechanism, NewWatchEntry } from "./types";

const parseDescription = (descriptionFromRequest: any): string => {
    if (!isString(descriptionFromRequest)) {
        throw new Error('Incorrect or missing description');
    }
    return descriptionFromRequest;
}

const parseDate = (dateFromRequest: any): string => {
    if (!isDate(dateFromRequest) || !isString(dateFromRequest)) {
        throw new Error('Incorrect or missing creation date'); 
    }
    return dateFromRequest;
}

const parseBrand = (brandFromRequest: any): Brand => {
    if(!isString(brandFromRequest || !isBrand(brandFromRequest))) {
        throw new Error('Incorrect or missing brand');
    }
    return brandFromRequest
}

const parseMechanism = (mechanismFromRequest: any): Mechanism => {
    if(!isString(mechanismFromRequest || !ismMechanism(mechanismFromRequest))) {
        throw new Error('Incorrect or missing mechanism');
    }
    return mechanismFromRequest
}

const parseName = (nameFromRequest: any): string => {
    if (!isString(nameFromRequest)) {
        throw new Error ('Incorrect or missing username');
    }
    return nameFromRequest;
}

const isBrand = (params: any): boolean => {
    return Object.values(Brand).includes(params);
}

const ismMechanism = (params: any): boolean => {
    return Object.values(Mechanism).includes(params);
}

const isDate = (date: string): boolean => {
    return Boolean(Date.parse(date))
}

const isString = (string: string): boolean => {
    return (typeof string === "string") 
}

const toNewWatchEntry = (object: any): NewWatchEntry => {
    const newWatchEntry: NewWatchEntry = {
        //First we parse the comment to make sure its a string;
        description: parseDescription(object.description),
        created_at: parseDate(object.created_at),
        brand: parseBrand(object.brand),
        mechanism: parseMechanism(object.mechanism),
        name: parseName(object.name),
    }
    return newWatchEntry;
}

export default toNewWatchEntry;