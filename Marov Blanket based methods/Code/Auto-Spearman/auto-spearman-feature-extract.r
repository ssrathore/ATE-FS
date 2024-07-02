library("Rnalytica")


dataset_names <- c(
# "prop-3", "prop-4", "prop-2", "prop-1", "prop-5"
# "camel-2.11.0", "derby-10.5.1.1", "activemq-5.3.0", 
# "derby-10.3.1.4", "activemq-5.2.0", "hive-0.12.0", 
# "camel-2.10.0", "derby-10.2.1.6", "hbase-0.95.0", 
# "hive-0.10.0", "camel-2.9.0", "camel-1.4.0", 
# "activemq-5.1.0", "jruby-1.7.0.preview1", 
# "wicket-1.3.0-incubating-beta-1", "hbase-0.95.2", 
# "activemq-5.0.0", "activemq-5.8.0", "wicket-1.3.0-beta2", 
# "lucene-3.1", "wicket-1.5.3"
  "mylyn"
)

for (name in dataset_names) {
    Data = loadDefectDataset(name,'ambros')
    results <- AutoSpearman(dataset = Data$data, metrics = Data$indep, spearman.threshold = 0.7, vif.threshold = 5)
    indices <- as.numeric(match(results, Data$indep)) - 1
    cat(name, ": ", paste(indices, collapse = ", "), "\n")
}