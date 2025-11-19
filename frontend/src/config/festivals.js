export const festivalColumns = [
	{ header: "Festival ID", accessor: "festivalID" },
	{ header: "Festival Name", accessor: "festivalName" },
	{ header: "Start Date", accessor: "startDate", type: "date" },
	{ header: "End Date", accessor: "endDate", type: "date" },
	{ header: "Location", accessor: "location" },
	{
		header: "Expected Attendance",
		accessor: "expectedAttendance",
		type: "number",
	},
	{ header: "Budget", accessor: "budget", type: "number" },
	{ header: "Ticket Price", accessor: "ticketPrice", type: "currency" },
];

export const festivalFields = [
	{
		name: "festivalName",
		label: "Festival Name",
		placeholder: "Enter festival name",
		required: true,
	},
	{
		name: "startDate",
		label: "Start Date",
		type: "date",
		placeholder: "Select start date",
		required: true,
	},
	{
		name: "endDate",
		label: "End Date",
		type: "date",
		placeholder: "Select end date",
		required: true,
	},
	{
		name: "location",
		label: "Location",
		placeholder: "Enter location",
		required: true,
	},
	{
		name: "expectedAttendance",
		label: "Expected Attendance",
		type: "number",
		placeholder: "Enter expected attendance",
		required: true,
	},
	{
		name: "budget",
		label: "Budget",
		type: "number",
		placeholder: "Enter budget",
		required: true,
	},
	{
		name: "ticketPrice",
		label: "Ticket Price",
		type: "number",
		placeholder: "Enter ticket price",
		required: true,
	},
];
