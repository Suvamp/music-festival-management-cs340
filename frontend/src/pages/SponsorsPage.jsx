import { useState } from "react";
import CrudPage from "../components/CrudPage";
import { sponsorsColumns, sponsorsFields } from "../config/sponsors";

const fakeSponsors = [
	{
		sponsorID: 1,
		sponsorName: "Red Bull",
		industry: "Beverages",
		contactEmail: "contact@redbull.com",
		contactPhone: "+1 800 555 1234",
		websiteURL: "https://www.redbull.com",
	},
	{
		sponsorID: 2,
		sponsorName: "Nike",
		industry: "Sportswear",
		contactEmail: "info@nike.com",
		contactPhone: "+1 800 555 5678",
		websiteURL: "https://www.nike.com",
	},
	{
		sponsorID: 3,
		sponsorName: "Spotify",
		industry: "Music Streaming",
		contactEmail: "support@spotify.com",
		contactPhone: "+1 800 555 9012",
		websiteURL: "https://www.spotify.com",
	},
	{
		sponsorID: 4,
		sponsorName: "Coca-Cola",
		industry: "Beverages",
		contactEmail: "contact@coca-cola.com",
		contactPhone: "+1 800 555 3456",
		websiteURL: "https://www.coca-cola.com",
	},
];

function SponsorsPage() {
	const [data, setData] = useState(fakeSponsors);

	const handleSubmit = (item) => {
		console.log(`Submitted, ${item}`);
	};
	const handleDelete = (item) => {
		console.log(`Deleted ${item}`);
		setData((prev) => prev.filter((a) => a.artistID !== item.artistID));
	};

	return (
		<>
			<CrudPage
				title="Sponsors"
				columns={sponsorsColumns}
				fields={sponsorsFields}
				initialData={data}
				setData={setData}
				onSubmit={handleSubmit}
				onDelete={handleDelete}
				idAccessor="sponsorID"
				displayNameAccessor="sponsorName"
			/>
		</>
	);
}

export default SponsorsPage;
