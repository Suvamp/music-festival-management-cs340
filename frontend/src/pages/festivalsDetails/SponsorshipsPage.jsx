import { useState } from "react";
import CrudPage from "../../components/CrudPage";
import {
	sponsorshipColumns,
	sponsorshipFields,
} from "../../config/sponsorships";

const fakeSponsorships = [
	{
		sponsorshipID: 1,
		sponsorID: 3,
		festivalID: 1,
		sponsorshipAmount: 50000.0,
		sponsorshipTier: "Gold",
		contractDate: "2025-02-15",
		benefits: "Main stage branding, VIP access, website logo",
	},
	{
		sponsorshipID: 2,
		sponsorID: 1,
		festivalID: 1,
		sponsorshipAmount: 25000.0,
		sponsorshipTier: "Silver",
		contractDate: "2025-03-01",
		benefits: "Banner placement, social media promotion",
	},
	{
		sponsorshipID: 3,
		sponsorID: 4,
		festivalID: 2,
		sponsorshipAmount: 80000.0,
		sponsorshipTier: "Platinum",
		contractDate: "2025-01-20",
		benefits: "Stage naming rights, hospitality suite",
	},
	{
		sponsorshipID: 4,
		sponsorID: 2,
		festivalID: 3,
		sponsorshipAmount: 15000.0,
		sponsorshipTier: "Bronze",
		contractDate: "2025-04-10",
		benefits: "Website logo, promo material inclusion",
	},
	{
		sponsorshipID: 5,
		sponsorID: 5,
		festivalID: 1,
		sponsorshipAmount: 60000.0,
		sponsorshipTier: "Gold",
		contractDate: "2025-03-22",
		benefits: "Exclusive vendor location, VIP tickets",
	},
];

function SponsorshipsPage() {
	const [data, setData] = useState(fakeSponsorships);
	const handleSubmit = (item) => {
		console.log(`Submitted, ${item}`);
	};
	const handleDelete = (item) => {
		console.log(`Deleted ${item}`);
		setData((prev) =>
			prev.filter((s) => s.sponsorshipID !== item.sponsorshipID)
		);
	};
	return (
		<>
			<h3 className="text-3xl font-bold px-2 py-1">
				Electric Daisy Carnival:{" "}
			</h3>
			<CrudPage
				title="Sponsorship"
				columns={sponsorshipColumns}
				fields={sponsorshipFields}
				initialData={data}
				onSubmit={handleSubmit}
				onDelete={handleDelete}
				idAccessor="sponsorshipID"
				displayNameAccessor="sponsorshipID"
				setData={setData}
			/>
		</>
	);
}

export default SponsorshipsPage;
