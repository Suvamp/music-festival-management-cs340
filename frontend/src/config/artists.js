export const artistColumns = [
	{ header: "ID", accessor: "artistID" },
	{ header: "Name", accessor: "name" },
	{ header: "Genre", accessor: "genre" },
	{ header: "Booking Fee", accessor: "bookingFee" },
	{ header: "Email", accessor: "email" },
	{ header: "Phone", accessor: "phone" },
	{ header: "Country", accessor: "country" },
	{ header: "Website", accessor: "website" },
];

export const artistFields = [
	{ name: "name", label: "Artist Name", placeholder: "Enter artist name" },
	{ name: "genre", label: "Genre", placeholder: "Enter genre" },
	{
		name: "bookingFee",
		label: "Booking Fee",
		type: "number",
		placeholder: "Enter booking fee",
	},
	{
		name: "email",
		label: "Email",
		type: "email",
		placeholder: "Enter email",
	},
	{
		name: "phone",
		label: "Phone",
		type: "number",
		placeholder: "Enter number",
	},
	{ name: "country", label: "Country", placeholder: "Enter country" },
	{ name: "website", label: "Website", placeholder: "Enter website" },
];
