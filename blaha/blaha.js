var blaha = new function() {
	// this.init = function() {
	// 		console.log("blaha.init();");
	// 		// User defined id and headers
	// 		print_table("/json/blaha", "processesTable", ["PID", "Registered", "Current Function"]);
	// 	}
	// 	// Called when a link with class='argument' is clicked
	// 	this.handle = function(arg) {
	// 		print_h1("Process information. Pid: <" + arg + ">");
	// 		print_table("/json/blaha/" + arg, "processTable", ["Key", "Value"]);
	// 	}
	//
	// 	this.refresh = function() {
	// 		var content = root();
	// 		content.empty();
	// 		print_table("/json/blaha", "processesTable", ["PID", "Registered", "Current Function"]);
	// 	}

	var body;
	var tbl;

	this.init = function() {
		body = new Body();
		body.add(body.toggle_button());

		tbl = body.table(["PID", "Registered", "Current Function"]);
		body.fill_json("/json/blaha", tbl);
		body.add(tbl);

		body.print();
	}

	this.handle = function(arg) {
		body.add(body.toggle_button());
		body.print();
	}

	this.refresh = function() {
		body.fill_json("/json/blaha", tbl);
		console.log("refreshing blaha");
	}
}