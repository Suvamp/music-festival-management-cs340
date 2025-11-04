import { useState } from "react";
import CrudPage from "../components/CrudPage";
import { artistColumns, artistFields } from "../config/artists";
const fakeData = [
	{
		artistID: 1,
		artistName: "Kenny Sieu",
		genre: "Electronic",
		bookingFee: 2500,
		email: "kenny.sieu@example.com",
		phone: 1234567,
		country: "USA",
		website: "https://kennybeats.com",
	},
	{
		artistID: 2,
		artistName: "Alice Johnson",
		genre: "Pop",
		bookingFee: 3000,
		email: "alice.johnson@example.com",
		phone: 5559876543,
		country: "Canada",
		website: "https://alicepop.com",
	},
	{
		artistID: 3,
		artistName: "Bob Smith",
		genre: "Rock",
		bookingFee: "$4,200",
		email: "bob.smith@example.com",
		phone: "+44 20 7946 0958",
		country: "UK",
		website: "https://bobrock.com",
	},
	{
		artistID: 4,
		artistName: "Jane Doe",
		genre: "Jazz",
		bookingFee: "$3,800",
		email: "jane.doe@example.com",
		phone: "+61 2 9876 5432",
		country: "Australia",
		website: "https://janedoejazz.com",
	},
	{
		artistID: 5,
		artistName: "Michael Brown",
		genre: "Hip-Hop",
		bookingFee: "$5,000",
		email: "michael.brown@example.com",
		phone: "+1 (555) 246-8102",
		country: "USA",
		website: "https://mikehiphop.com",
	},
	{
		artistID: 6,
		artistName: "Sarah Lee",
		genre: "Country",
		bookingFee: "$2,800",
		email: "sarah.lee@example.com",
		phone: "+1 (555) 135-7913",
		country: "USA",
		website: "https://sarahcountry.com",
	},
	{
		artistID: 7,
		artistName: "David Kim",
		genre: "R&B",
		bookingFee: "$3,600",
		email: "david.kim@example.com",
		phone: "+82 10 1234 5678",
		country: "South Korea",
		website: "https://davidrb.com",
	},
	{
		artistID: 8,
		artistName: "Emma White",
		genre: "Electronic",
		bookingFee: "$2,900",
		email: "emma.white@example.com",
		phone: "+44 20 7946 1122",
		country: "UK",
		website: "https://emmaelectronica.com",
	},
	{
		artistID: 9,
		artistName: "Liam Garcia",
		genre: "Reggae",
		bookingFee: "$3,400",
		email: "liam.garcia@example.com",
		phone: "+1 (555) 777-8888",
		country: "Jamaica",
		website: "https://liamreggae.com",
	},
	{
		artistID: 10,
		artistName: "Olivia Martinez",
		genre: "Pop",
		bookingFee: "$4,000",
		email: "olivia.martinez@example.com",
		phone: "+34 91 123 4567",
		country: "Spain",
		website: "https://oliviapop.com",
	},
];

function ArtistsPage() {
	const [data, setData] = useState(fakeData);
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
				title="Artist"
				columns={artistColumns}
				fields={artistFields}
				initialData={data}
				onDelete={handleDelete}
				onSubmit={handleSubmit}
				idAccessor="artistID"
				displayNameAccessor="artistName"
				setData={setData}
			/>
		</>
	);
}

export default ArtistsPage;
