import { NavLink, useParams } from "react-router-dom";

function SideNavbar() {
	const { id } = useParams();

	const links = [
		{ name: "Stages", to: `/festivals/${id}/stages` },
		{ name: "Performances", to: `/festivals/${id}/performances` },
		{ name: "Vendor Assignments", to: `/festivals/${id}/vendor-assignments` },
		{ name: "Sponsorships", to: `/festivals/${id}/sponsorships` },
		{ name: "Staff Assignments", to: `/festivals/${id}/staff-assignments` },
	];

	return (
		<nav className="flex bg-gray-900 text-white p-4 rounded-xl shadow-lg">
			<div className="flex gap-2">
				{links.map((link) => (
					<NavLink
						key={link.to}
						to={link.to}
						className={({ isActive }) =>
							`px-3 py-2 rounded-lg text-sm font-medium transition 
							${isActive ? "bg-blue-600" : "hover:bg-gray-700"}`
						}>
						{link.name}
					</NavLink>
				))}
			</div>
		</nav>
	);
}

export default SideNavbar;
