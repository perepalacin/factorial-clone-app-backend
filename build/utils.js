"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const types_1 = require("./types");
const parseDescription = (descriptionFromRequest) => {
    if (!isString(descriptionFromRequest)) {
        throw new Error('Incorrect or missing description');
    }
    return descriptionFromRequest;
};
const parseDate = (dateFromRequest) => {
    if (!isDate(dateFromRequest) || !isString(dateFromRequest)) {
        throw new Error('Incorrect or missing creation date');
    }
    return dateFromRequest;
};
const parseBrand = (brandFromRequest) => {
    if (!isString(brandFromRequest || !isBrand(brandFromRequest))) {
        throw new Error('Incorrect or missing brand');
    }
    return brandFromRequest;
};
const parseMechanism = (mechanismFromRequest) => {
    if (!isString(mechanismFromRequest || !ismMechanism(mechanismFromRequest))) {
        throw new Error('Incorrect or missing mechanism');
    }
    return mechanismFromRequest;
};
const parseName = (nameFromRequest) => {
    if (!isString(nameFromRequest)) {
        throw new Error('Incorrect or missing username');
    }
    return nameFromRequest;
};
const isBrand = (params) => {
    return Object.values(types_1.Brand).includes(params);
};
const ismMechanism = (params) => {
    return Object.values(types_1.Mechanism).includes(params);
};
const isDate = (date) => {
    return Boolean(Date.parse(date));
};
const isString = (string) => {
    return (typeof string === "string");
};
const toNewWatchEntry = (object) => {
    const newWatchEntry = {
        //First we parse the comment to make sure its a string;
        description: parseDescription(object.description),
        created_at: parseDate(object.created_at),
        brand: parseBrand(object.brand),
        mechanism: parseMechanism(object.mechanism),
        name: parseName(object.name),
    };
    return newWatchEntry;
};
exports.default = toNewWatchEntry;
