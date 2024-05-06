import { ContentRequestParams } from "../types/redux";

export const convertMillisecondsToDate = (milliseconds: number): string => {
  const date = new Date(milliseconds);
  const hours = date.getHours().toString().padStart(2, "0");
  const minutes = date.getMinutes().toString().padStart(2, "0");
  const seconds = date.getSeconds().toString().padStart(2, "0");
  const day = date.getDate().toString().padStart(2, "0");
  const month = (date.getMonth() + 1).toString().padStart(2, "0"); // Months are zero-based
  const year = date.getFullYear();

  return `${hours}:${minutes}:${seconds} ${day}/${month}/${year}`;
};

export const getRequestParams = (
  queryParams: URLSearchParams,
  params: string[],
  currentSearchParams: any
) => {
  const queryParts: string[] = [];

  params.forEach((key) => {
    const value = queryParams.get(key);
    if (currentSearchParams[key] !== undefined || currentSearchParams[key] !== null) {
      queryParts.push(`${key}=${encodeURIComponent(currentSearchParams[key])}`);
    } else if (value) {
      queryParts.push(`${key}=${encodeURIComponent(value)}`);
      currentSearchParams = { ...currentSearchParams, [key]: value };
    }
  });

  const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

  return {
    queryString,
    currentSearchParams,
  };
};

export function convertTime24to12(time24: string): string {
  // Extract hours and minutes from the time string
  const [hours24, minutes] = time24.split(':');

  // Convert hours part to number
  const hours = parseInt(hours24, 10);

  // Determine AM or PM suffix based on the hour
  const suffix = hours >= 12 ? 'PM' : 'AM';

  // Convert 24-hour time to 12-hour format
  const hours12 = ((hours + 11) % 12 + 1);

  // Return the formatted time string in 12-hour format
  return `${hours12}:${minutes} ${suffix}`;
}
