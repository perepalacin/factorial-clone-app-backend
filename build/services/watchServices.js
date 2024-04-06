"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.addWatchEntry = exports.getSummarizedWatchData = exports.findById = exports.getAllWatches = void 0;
const watches_json_1 = __importDefault(require("./watches.json"));
const uuidv4_1 = require("uuidv4");
const watches = watches_json_1.default;
const getAllWatches = () => watches;
exports.getAllWatches = getAllWatches;
//The find method can miss to find anything and therefore, may return an undefined!
const findById = (id) => {
    const entry = watches.find(diary => diary.id === id);
    if (entry != null) {
        return entry;
    }
    return undefined;
};
exports.findById = findById;
const getSummarizedWatchData = () => {
    return watches.map(({ id, created_at, name, mechanism, brand }) => {
        return {
            id,
            created_at,
            name,
            mechanism,
            brand
        };
    });
};
exports.getSummarizedWatchData = getSummarizedWatchData;
const addWatchEntry = (newWatchBody) => {
    const id = (0, uuidv4_1.uuid)();
    console.log("this is it");
    const newWatchEntry = Object.assign({ id: id }, newWatchBody);
    watches.push(newWatchEntry);
    return newWatchEntry;
};
exports.addWatchEntry = addWatchEntry;
