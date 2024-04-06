"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const watches_1 = __importDefault(require("./routes/watches"));
const app = (0, express_1.default)();
app.use(express_1.default.json()); //Middleware to transform req.body into a json
app.use("/", express_1.default.static("dist"));
const PORT = 3000;
app.get('/ping', (_req, res) => {
    console.log('Someone pinged here');
    res.send('pong');
});
app.use('/api/watches', watches_1.default);
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
