var comp_table = new function() {

	var body;

	this.init = function() {
		// console.log("table.init();");
		// 		// User defined id and headers
		// 		print_table("/json/comp_table", "myTable", ["Name", "Number"]);
		body = new Body();

		body.add(body.toggle_button());

		var tbl = body.table(["Name", "Numbers"]);
		body.fill_json("/json/comp_table", tbl);
		body.add(tbl);
		body.print();
		// var table = body.table(["Name", "Number"]);
		// table.attr("id", "myTable");
		// body.add(table);
		// body.print();

	}

	this.refresh = function() {
		console.log("refreshing comp_table");
	}
}