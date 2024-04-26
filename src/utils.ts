
export function isDateInRange(dateToCheck: Date, startDate: Date, endDate: Date): boolean {
    console.log("Date to check is called");
    return dateToCheck >= startDate && dateToCheck <= endDate;
}
