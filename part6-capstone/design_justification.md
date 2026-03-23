## Storage Systems

The architecture uses multiple storage systems because the hospital platform has different types of data and different workload needs.

For ICU devices, the data is high-frequency and continuously generated. This kind of streaming data is best captured through the streaming layer and first stored in the Data Lake as raw data. This allows the system to keep all incoming vitals for future analysis without forcing a strict schema too early.

The Hospital Database represents the structured operational data of the system. This includes patient admissions, billing, doctor assignments, prescriptions, and other day-to-day transactional records. This data belongs in a relational operational database because it requires consistency, fast updates, and reliable transactions.

Patient Records contain clinical history, reports, notes, discharge summaries, and other healthcare documents. These records are useful not only for storage but also for semantic search. For that reason, relevant text from patient records can be embedded and stored in the Vector Database so AI systems can retrieve meaning-based results instead of relying only on keyword matching.

The Data Lake stores raw data from multiple hospital sources. It is useful because it can keep structured, semi-structured, and unstructured data at scale. This is important for future machine learning, audits, and advanced analytics.

The Data Warehouse is used for cleaned and structured analytical data. It supports reporting use cases such as bed occupancy trends, department performance, cost analysis, and monthly summaries. It is optimized for aggregation and dashboard queries rather than daily transactions.

The Vector Database is used for AI search. It helps doctors and hospital staff search patient history, reports, and notes using natural language queries. Instead of matching exact words, it retrieves semantically similar content.

## OLTP vs OLAP Boundary

The OLTP side of the architecture is the Hospital Database. This is where live operational tasks happen, such as recording patient admissions, updating billing information, managing prescriptions, and storing core patient records. These workloads require fast inserts, updates, and deletes with strong consistency.

The OLAP side begins with the Data Warehouse and the AI-driven analytical layers. Once data moves through the streaming layer and into analytical storage, it is used for reporting, trend analysis, and model building rather than for direct day-to-day operations.

The Data Lake sits between raw ingestion and analytics. It acts as a flexible storage layer for large-scale raw data that can later feed warehouse pipelines and machine learning workflows.

The Vector Database is also part of the analytical and AI side because it supports retrieval and intelligent search rather than direct transaction processing.

## Role of the Streaming Layer

The Streaming Layer, shown with Kafka in the diagram, is responsible for collecting and moving real-time data from ICU devices, hospital systems, and patient-related sources. It decouples data producers from downstream systems and allows multiple storage layers to consume the same data for different purposes.

For example, one stream of ICU device data can be stored in the Data Lake for historical analysis, summarized into the Data Warehouse for reporting, and also used by AI Models for prediction. This makes the architecture scalable and responsive.

## AI Models and Outputs

The AI Models layer consumes data from the Data Lake, Data Warehouse, and Vector Database.

From the Data Lake, the models can access large volumes of raw historical data for training and experimentation.

From the Data Warehouse, the models can use cleaned and structured features for reliable analytics and predictive tasks.

From the Vector Database, the models can retrieve semantically relevant patient information for AI-powered search and support tools.

The outputs of this layer are shown as Predictive Analytics and Doctor Dashboard. Predictive Analytics can be used for tasks such as patient risk prediction, ICU deterioration alerts, and readmission forecasting. The Doctor Dashboard gives healthcare professionals an accessible interface to view insights, summaries, and AI-assisted information.

## Trade-offs

One major advantage of this design is that each system is used for the task it handles best. Operational systems remain reliable, analytical systems remain efficient, and AI search becomes more powerful.

The main trade-off is complexity. Maintaining a streaming layer, lake, warehouse, and vector database requires more engineering effort than using a single database. Data governance, synchronization, and security must be carefully managed, especially in healthcare environments.

This trade-off is justified because hospital systems deal with real-time monitoring, structured operational records, reporting needs, and unstructured medical text at the same time. A single storage system would not handle all of these equally well.

## Conclusion

This architecture is suitable for a modern healthcare platform because it separates operational processing, analytical reporting, raw data storage, and semantic AI search into appropriate layers. The design supports real-time ingestion, structured reporting, predictive analytics, and doctor-facing AI tools while keeping the system scalable and organized.