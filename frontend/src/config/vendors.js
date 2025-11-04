export const vendorColumns = [
	{ header: "ID", accessor: "vendorID" },
	{ header: "Name", accessor: "vendorName" },
	{ header: "Email", accessor: "contactEmail" },
	{ header: "Phone", accessor: "contactPhone" },
	{ header: "Type", accessor: "vendorType" },
];

export const vendorFields = [
	{ name: "name", label: "Vendor Name", placeholder: "Enter vendor name" },
	{ name: "email", label: "Email", type: "email", placeholder: "Enter email" },
	{
		name: "phone",
		label: "Phone",
		type: "number",
		placeholder: "Enter phone number",
	},
	{ name: "type", label: "Type", placeholder: "Enter vendor type" },
];
