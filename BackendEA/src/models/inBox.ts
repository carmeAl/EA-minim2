import {  Schema, Types, model, Model } from "mongoose";
import { InBox } from "../interfaces/inBox.interface";

const InBoxSchema = new Schema<InBox>(
    {
        idUsuarioOrigen:{
            type: Schema.Types.ObjectId,
            required:true,
        },
        idUsuarioDestino:{
            type: Schema.Types.ObjectId,
            required:true,
        },
        asunto:{
            type: String,
            required:true,
        },
        msn:{
            type: String,
            required:true,
        },
    },
    {
        timestamps: true,
        versionKey: false,
    }
);

//Once the Schema is created, it must be implemented
//1st argument ('users') is the name of the collection
//2nd argument (UserSchema) is what it feds it
const InBoxModel = model('inBoxs', InBoxSchema);

export default InBoxModel;