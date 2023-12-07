const express = require("express");
const bcryptjs = require("bcrypt");

const User = require("../models/user")

// creating the router 
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");


authRouter.get(
    '/user',
    (request, response) => response.json({ "name": "Pranay" })
); // get method of authRouter 


authRouter.post(
    "/api/signup",
    async (request, response) => {
        // Getting data from the client 

        try {

            let { name, email, password } = request.body;

            // Checking whether user exists wih the same email or not 
            const existingUser = await User.findOne({ email });
            if (existingUser) {
                console.log('user exists with same email');
                return response.status(400).json({ message: "User with same email already exists!" });
            }

            const hahsedPassword = await bcryptjs.hash(password, 8);
            password = hahsedPassword;

            let user = new User({
                email,
                // password,
                password: hahsedPassword,
                name,
            });



            // post the data into data base
            user = await user.save();
            response.json(user);

        } catch (e) {
            response.status(500).json({ error: e.message });
        }

    }
);

authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email: email });
        if (!user) {
            return res
                .status(400)
                .json({ message: "User with this email does not exist!" });
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: "Incorrect password." });
        }

        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });



    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});



authRouter.post(
    "/tokenIsValid",
    async (request, response) => {
        try {
            const token = request.header('x-auth-token');
            if (!token) {
                return response.json(false);
            }

            const verified = jwt.verify(token, 'passwordKey');
            if (!verified) { return response.json(false); }

            const user = await User.findById(verified.id);
            if (!user) { return response.json(false); }

            return response.json(true);

        } catch (e) {

        }
    }
);

// Get The User Data 
authRouter.get('/', auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;