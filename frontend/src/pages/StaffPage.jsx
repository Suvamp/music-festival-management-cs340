import { useState } from "react";
import CrudPage from "../components/CrudPage";
import { staffFields, staffColumns } from "../config/staff";

const fakeStaff = [
	{
		staffID: 1,
		firstName: "Kenny",
		lastName: "Sieu",
		email: "kenny.sieu@example.com",
		phone: "+1 555 123 4567",
		role: "Event Manager",
		hourlyRate: 35.5,
	},
	{
		staffID: 2,
		firstName: "Alice",
		lastName: "Johnson",
		email: "alice.johnson@example.com",
		phone: "+1 555 987 6543",
		role: "Technician",
		hourlyRate: 28.0,
	},
	{
		staffID: 3,
		firstName: "Bob",
		lastName: "Smith",
		email: "bob.smith@example.com",
		phone: "+44 20 7946 0958",
		role: "Security",
		hourlyRate: 22.5,
	},
	{
		staffID: 4,
		firstName: "Jane",
		lastName: "Doe",
		email: "jane.doe@example.com",
		phone: "+61 2 9876 5432",
		role: "Coordinator",
		hourlyRate: 30.0,
	},
];

function StaffPage() {
	const [data, setData] = useState(fakeStaff);
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
				columns={staffColumns}
				fields={staffFields}
				initialData={data}
				setData={setData}
				onDelete={handleDelete}
				onSubmit={handleSubmit}
				idAccessor="staffID"
				displayNameAccessor="firstName"
			/>
		</>
	);
}

export default StaffPage;
