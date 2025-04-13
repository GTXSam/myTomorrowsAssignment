# myTomorrowsAssignment


Drawbacks. Helm-release does NOT detected change in state after update in Helm templates? Workaround... Generate hash from templates.


helm secrets encrypt values-test.yaml > values-test.yaml.enc


### Observability
## Flask Metrics with Prometheus
Usually ServiceMonitorSelector in the Prometheus CR is modified to add the ServiceMonitor label to discover in Prometheus.

For provability's sake for this assessment, the MyTomorrow's Flask metrics ServiceMonitor has been appended with the Prometheus Operator Stack predefined label.