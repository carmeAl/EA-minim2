/** Esta ruta nos va a devolver un array de objetos, que va a venir de una base de datos (carpeta config)*/

import {Router} from "express";
import { create_Asignacion, delete_Asignacion } from "../controllers/asignacion";
import { create_InBox, get_inBoxOfUser } from "../controllers/inBox";
// import { updateAsignacion } from "../services/asignacion";

const router = Router(); //es el manejador de las rutas, las interpreta, con esto podremos crear los GET, POST ....

/**
 * http://localhost:3002/items [GET]
 */
router.post("/", create_InBox);
router.get("/:idUsuarioDestino", get_inBoxOfUser);

export {router};