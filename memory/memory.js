var memory = new function() {
    var body;
    var table;

    this.init = function() {
        body = new Body();
        table = body.table(["Type", "Memory"]);
        body.fill_json("/json/memory", table);
        body.add(table);
        body.print();
    }

    this.handle = function(arg) {
        body.print();
    }

    this.refresh = function() {
        
    }
}
