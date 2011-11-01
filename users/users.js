var users = new function() {

	var body;
	var table;
	var options = new Object();

	// Initializes the component, publish some elements etc
	this.init = function() {

		// Initialize a new body object for this component
		body = new Body();

		// Testing a toggle button for pause/resume
		body.add(body.toggle_button());

		// Create a table to hold the label and the data
		table = body.table(["ID", "Username"]);

		// Set options?
		// options.linksIndex = 0;

		// Fill this table with json from /json/users
		body.fill_json("/json/users", table, options);

		// Add the table to the body
		body.add(table);

		// Print the body
		body.print();
	}

	// This is called when a link is clicked on the component's page
	this.handle = function(arg) {
		console.log("handle( " + arg + ") called!");
	}

	// This is called when this component is set to actively refresh
	this.refresh = function() {
		console.log("Called users.refresh()");
		body.fill_json("/json/users", table, options);
	}
}