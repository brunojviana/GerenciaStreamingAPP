import { PROVIDER_REPOSITORY } from "./constants";
import { Provider } from "./provider.model";

export const providerProviders = [
    {
        provide: PROVIDER_REPOSITORY,
        useValue: Provider
    },
];