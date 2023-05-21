// export const path = 'http://localhost:8080'
// const path = 'http://digital-booking-6.s3-website.us-east-2.amazonaws.com'
// export const path = "http://3.131.138.206:8080";
export const path = 'http://localhost:8000'

// Endpoints de las Apis necesarias.
export const apiCountry = `${path}/country`;
export const apiProductByCategory = `${path}/product/byCategory/`;
export const apiProductRandom = `${path}/product/random`;
export const apiProductById = `${path}/product/`;
export const apiProduct = `${path}/product`;
export const apiCategory = `${path}/category`;
export const apiReserve = `${path}/reserve`;
export const apiMyReserves = `${path}/reserve/byUserId`;
export const apiProductByCityAndDates = `${path}/product/byCityAndDates/`;

export const apiUserLogin = `${path}/auth/login`;
export const apiUser = `${path}/auth/register`;

