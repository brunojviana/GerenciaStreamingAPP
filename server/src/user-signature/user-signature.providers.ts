import { USER_SIGNATURE_REPOSITORY } from "./constants";
import { User_Signature } from "./user-signature.model";

export const user_signatureProviders = [
    {
        provide: USER_SIGNATURE_REPOSITORY,
        useValue: User_Signature
    }
];