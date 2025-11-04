function Button({ children, onClick, className = "" }) {
	return (
		<button
			onClick={onClick}
			className={`px-3 py-2 rounded bg-blue-500 text-white hover:bg-blue-600 ${className}`}>
			{children}
		</button>
	);
}

export default Button;
