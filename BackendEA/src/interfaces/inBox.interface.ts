import { ObjectExpression, ObjectId } from "mongoose";

export interface InBox {
    idUsuarioOrigen: ObjectId;
    idUsuarioDestino: ObjectId;
    asunto: string; 
    msn: string; 
}