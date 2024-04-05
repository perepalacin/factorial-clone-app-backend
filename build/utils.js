"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const types_1 = require("./types");
const parseComment = (commentFromRequest) => {
    if (!isString(commentFromRequest)) {
        throw new Error('Incorrect or missing comment');
    }
    return commentFromRequest;
};
const parseDate = (dateFromRequest) => {
    if (!isDate(dateFromRequest) || !isString(dateFromRequest)) {
        throw new Error('Incorrect or missing date');
    }
    return dateFromRequest;
};
const parseGender = (genderFromRequest) => {
    if (!isString(genderFromRequest || !isGender(genderFromRequest))) {
        throw new Error('Incorrect or missing gender');
    }
    return genderFromRequest;
};
const parseUserName = (userNameFromRequest) => {
    if (!isString(userNameFromRequest)) {
        throw new Error('Incorrect or missing username');
    }
    return userNameFromRequest;
};
const isGender = (params) => {
    return Object.values(types_1.Gender).includes(params);
};
const isDate = (date) => {
    return Boolean(Date.parse(date));
};
const isString = (string) => {
    return (typeof string === "string");
};
const toNewDiaryEntry = (object) => {
    const newDiaryEntry = {
        //First we parse the comment to make sure its a string;
        comment: parseComment(object.comment),
        date: parseDate(object.date),
        gender: parseGender(object.gender),
        userName: parseUserName(object.userName),
    };
    return newDiaryEntry;
};
exports.default = toNewDiaryEntry;
