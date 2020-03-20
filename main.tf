data "template_file" "metric" {
  count= "${length( keys(var.nested_map_name))}"
  template = "$${dims}"

  vars {
      # This really sucks, but a limitation of Terraform until v 0.12
      dims = "${jsonencode( concat(list(var.namespace), list("$${hehe}"),  list(lookup(var.nested_map_name[element(keys(var.nested_map_name), count.index)],"name")),list(lookup(var.nested_map_name[element(keys(var.nested_map_name), count.index)],"value")), list("{\"stat\": \"p99\",\"period\": \"1\",\"color\": \"${lookup(var.nested_map_name[element(keys(var.nested_map_name), count.index)],"color")}\"}"))) }"
  }
}

data "template_file" "metrics" {
  template = "[$${list_of_metrics}]"

  vars {
    list_of_metrics = "${join(", ", data.template_file.metric.*.rendered)}"
  }
}

data "template_file" "properties" {
  template = "${file("${path.module}/files/properties.json")}"
  vars {
    metrics = "${data.template_file.metrics.rendered}"
    period = "${var.period}"
    region = "${var.region}"
    stacked = "${var.stacked ? "true" : "false"}"
    stat = "${var.stat}",
    title = "$${hehe}",
    view = "${var.view}"
  }
}

data "template_file" "widget" {
  template = "${file("${path.module}/files/widget.json")}"
  vars {
    width = "${var.width}"
    height = "${var.height}"
    properties = "${data.template_file.properties.rendered}"
  }
}

resource "local_file" "foo" {
    content     = "${data.template_file.widget.rendered}"
    filename = "${path.module}/files/asif.json"
}

data "template_file" "metricsjson" {
  count    = "${length(var.service_metric_names)}"
  template = "${file("${path.module}/files/asif.json")}"
  vars {
    hehe =  "${element(var.service_metric_names, count.index)}"
  }
}

data "template_file" "finaljson" {
  template = "${file("${path.module}/files/dashboard-template.json")}"
  vars {
    widgets_json = "[${join(",", data.template_file.metricsjson.*.rendered)}]"
  }
}

# this is a local file created in working directory to check the json
resource "local_file" "foo1" {
    content  = "${data.template_file.finaljson.rendered}"
    filename = "${path.module}/files/foo.bar"
}
