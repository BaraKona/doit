const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
	content: [
		"./public/*.html",
		"./app/helpers/**/*.rb",
		"./app/javascript/**/*.js",
		"./app/views/**/*.{erb,haml,html,slim, html.haml}",
	],
	theme: {
		extend: {
			fontFamily: {
				sans: ["Inter var", ...defaultTheme.fontFamily.sans],
			},
			colors: {
				background: "#121212",
				primaryText: "#ffffff87",
				secondaryText: "#ffffff60",
				tertiaryText: "#ffffff38",
				active: "#00000030",
				border: "#ffffff10",
				// nice aler color for darkmode
				alert: "#ff6b6b",
			},
		},
	},
	plugins: [
		require("@tailwindcss/forms"),
		require("@tailwindcss/aspect-ratio"),
		require("@tailwindcss/typography"),
		require("@tailwindcss/container-queries"),
	],
};
