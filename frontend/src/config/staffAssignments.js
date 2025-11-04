export const staffAssignmentColumns = [
	{ header: "ID", accessor: "staffAssignmentID" },
	{ header: "Staff ID", accessor: "staffID" },
	{ header: "Festival ID", accessor: "festivalID" },
	{ header: "Assigned Date", accessor: "assignedDate" },
	{ header: "Hours Worked", accessor: "hoursWorked" },
	{ header: "Shift Notes", accessor: "shiftNotes" },
];

export const staffAssignmentFields = [
	{
		name: "staffID",
		label: "Staff ID",
		type: "number",
		placeholder: "Enter staff ID",
	},
	{
		name: "festivalID",
		label: "Festival ID",
		type: "number",
		placeholder: "Enter festival ID",
	},
	{ name: "assignedDate", label: "Assigned Date", type: "date" },
	{
		name: "hoursWorked",
		label: "Hours Worked",
		type: "number",
		step: "0.01",
		placeholder: "Enter hours worked",
	},
	{
		name: "shiftNotes",
		label: "Shift Notes",
		type: "textarea",
		placeholder: "Enter shift notes",
	},
];
