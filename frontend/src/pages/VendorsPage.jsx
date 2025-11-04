import { useState } from "react";
import CrudPage from "../components/CrudPage";
import { vendorColumns, vendorFields } from "../config/vendors";

const fakeVendors = [
	{
		vendorID: 1,
		vendorName: "Fresh Foods Co.",
		vendorType: "Food",
		contactEmail: "contact@freshfoods.com",
		contactPhone: "+1 555 123 4567",
		businessLicense: "FF12345",
	},
	{
		vendorID: 2,
		vendorName: "Sound Systems Ltd.",
		vendorType: "Equipment",
		contactEmail: "info@soundsystems.com",
		contactPhone: "+1 555 987 6543",
		businessLicense: "SS67890",
	},
	{
		vendorID: 3,
		vendorName: "Green Decor",
		vendorType: "Decoration",
		contactEmail: "hello@greendecor.com",
		contactPhone: "+44 20 7946 0958",
		businessLicense: "GD45678",
	},
	{
		vendorID: 4,
		vendorName: "Stage Lighting Inc.",
		vendorType: "Lighting",
		contactEmail: "support@stagelighting.com",
		contactPhone: "+61 2 9876 5432",
		businessLicense: "SL78901",
	},
];

function VendorsPage() {
	const [data, setData] = useState(fakeVendors);

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
				title="Vendors"
				columns={vendorColumns}
				fields={vendorFields}
				initialData={data}
				setData={setData}
				onDelete={handleDelete}
				onSubmit={handleSubmit}
				idAccessor="vendorID"
				displayNameAccessor="vendorName"
			/>
		</>
	);
}

export default VendorsPage;
