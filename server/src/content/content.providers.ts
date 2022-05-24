import { Content } from "./content.model";
import { CONTENT_REPOSITORY } from "./constants";

export const contentProviders = [
    {
        provide: CONTENT_REPOSITORY,
        useValue: Content
    },
];