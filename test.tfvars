aws_region = "eu-west-1"
aws_profile = "dev"

// Metric
namespace   = "AWS/RDS"

nested_map_name = {
    instance1    = {
      name = "DBInstanceIdentifier"
      value = "c4r-p-ew1-projectdata-1-1"
      color = "#d62728"
    }
    instance2    = {
      name = "DBInstanceIdentifier"
      value = "c4r-p-ew1-projectdata-1-2"
      color = "#d62729"
    }
    instance3 = {
      name = "DBInstanceIdentifier"
      value = "c4r-p-ew1-projectdata-1-3"
      color = "#d62730"
    }
}

// Properties
region = "eu-west-1"
period = 1
stat = "p99"
title = "test"

// Widget
width = 6
height = 6

service_metric_names= ["EngineUptime", "CPUUtilization","FreeableMemory","DatabaseConnections","BlockedTransactions","Deadlocks","LoginFailures","Queries",
"AuroraReplicaLag","DMLLatency","DMLThroughput","DDLLatency","DDLThroughput","SelectLatency","SelectThroughput","InsertLatency",
"InsertThroughput","UpdateLatency","UpdateThroughput","VolumeWriteIOPs","VolumeReadIOPs","FreeLocalStorage","NetworkThroughput",
"NetworkReceiveThroughput","NetworkTransmitThroughput","BufferCacheHitRatio","ResultSetCacheHitRatio"]
metric_dimensions = {
  DBInstanceIdentifier           = "DBInstanceIdentifier"
  DBClusterIdentifier            = "DBClusterIdentifier"
  DatabaseClass                  = "DatabaseClass"
  EngineName                     = "EngineName"
  SourceRegion                   = "SourceRegion"
}
