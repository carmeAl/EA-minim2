//In charge to connect with the dB
import { InBox } from "../interfaces/inBox.interface";
import InBoxModel from "../models/inBox";


const createInBox = async (item: InBox) => {
    const responseInsert = await InBoxModel.create(item);
    return responseInsert;
};
const getInBoxOfUser = async (idUser: string) => {
    const inBoxUser = await InBoxModel.find({ idUsuarioDestino: idUser }).populate('idUsuarioOrigen');
    return inBoxUser;
}

export { createInBox, getInBoxOfUser };
