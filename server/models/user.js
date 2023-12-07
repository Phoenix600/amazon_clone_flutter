// Creating the data model 

const { default: mongoose, Mongoose } = require("mongoose");

// creating the user schema 
const userSchema = mongoose.Schema(
    {
        name: {
            required: true,
            type: String,
            trim: true,
        }, // name attribute 
        email: {
            required: true,
            type: String,
            trim: true,
            validate: {
                validator: (value) => {
                    const re =
                        /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                    return value.match(re);
                },
                message: "Please enter a valid email",
            }
        }, // email attribiute
        password: {
            required: true,
            type: String,
            validate: {
                validator: (value) => { return value.length > 6; },
                message: "Weak password"
            }
        },
        address: {
            type: String,
            default: "", // address is not required field 
        },// address attribute 
        type: {
            type: String,
            default: 'user',
        } // Type attribute 
    }
);


const User = mongoose.model("User", userSchema);
module.exports = User;