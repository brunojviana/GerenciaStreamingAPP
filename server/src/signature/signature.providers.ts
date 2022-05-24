import { Signature } from "./signature.model";
import { SIGNATURE_REPOSITORY } from "./constants";

export const signatureProviders = [
    {
        provide: SIGNATURE_REPOSITORY,
        useValue: Signature
    },
];