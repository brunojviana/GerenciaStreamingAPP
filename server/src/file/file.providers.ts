import { FILE_REPOSITORY } from "./constants";
import { File } from "./file.model";

export const fileProviders = [
    {
        provide: FILE_REPOSITORY,
        useValue: File
    },
];