var test = new function() {

	this.init = function() {
		body = new Body();
		// Empty span to hold JSON from this component's Erl module
		var span = body.span();
		body.fill_json("/json/test", span);
		body.add(span);
		body.print();
	}
}