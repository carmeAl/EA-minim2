import { Request,Response } from "express";
import { handleHttp } from "../utils/error.handle";

import { createInBox, getInBoxOfUser } from "../services/inBox";

const create_InBox=async({body}:Request,res:Response)=>{
    try{
        //const {user, producto, ticket }=body;
        const responseInBox = await createInBox(body);
        res.send(responseInBox);
        
    } catch(e){
        handleHttp(res,"ERROR_INSERT_InBox");
    }
};

const get_inBoxOfUser=async({params}:Request,res:Response)=>{
    try{
        const {idUsuarioDestino}=params;
        const responseInBox = await getInBoxOfUser(idUsuarioDestino);
        res.send(responseInBox);
        
    } catch(e){
        handleHttp(res,"ERROR_GET_InBoxsOfUser");
    }
};



export{create_InBox,get_inBoxOfUser};