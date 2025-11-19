import { format } from "date-fns";
export function formatDateForInput(isoDate) {
	if (!isoDate) return "";
	return isoDate.split("T")[0];
}

/**
 * Convert YYYY-MM-DD from input to ISO string for backend
 */
export function formatDateForBackend(dateString) {
	if (!dateString) return null;
	return new Date(dateString).toISOString();
}

// FORMAT VALUE: DOLLAR OR ADD COMMA OR DATE
export function formatValue(value, type) {
	if (value === null || value === undefined) return "";

	//Format the date into EX: July 15,2025
	switch (type) {
		case "date":
			return new Intl.DateTimeFormat("en-US", {
				month: "long",
				day: "numeric",
				year: "numeric",
			}).format(new Date(value));

		case "number":
			return Number(value).toLocaleString(); // adds commas: 75000 -> 75,000

		case "currency":
			return Number(value).toLocaleString("en-US", {
				style: "currency",
				currency: "USD",
			}); // 2500000 -> $2,500,000.00

		case "time":
			return format(new Date(`1970-01-01T${value}`), "h:mm a"); // "15:30:00" -> "3:30 PM"
		default:
			return value;
	}
}
