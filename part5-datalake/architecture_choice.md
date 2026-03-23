## Architecture Recommendation

I would recommend a Data Lakehouse architecture for the food delivery startup. The company collects highly diverse data types including GPS logs, customer text reviews, payment transactions, and restaurant menu images. A traditional data warehouse would work well for structured reporting data, but it is not ideal for storing raw images, text, and semi-structured logs at scale. A pure data lake would provide flexibility, but it may not offer the governance and performance needed for reliable analytics. A lakehouse combines the strengths of both.

The first reason is data variety. GPS streams are semi-structured, customer reviews are unstructured text, payment data is structured, and menu images are binary objects. A lakehouse can store all of these in one scalable environment without forcing early rigid schema design.

The second reason is analytical flexibility. The startup will likely need both business intelligence and machine learning. For example, payment transactions can support finance dashboards, while reviews and images can be used for recommendation systems, sentiment analysis, or computer vision. A lakehouse supports both SQL analytics and AI workloads on the same platform.

The third reason is cost and scalability. A lakehouse can store large raw datasets more cheaply than a traditional warehouse while still supporting ACID-style tables and efficient querying for curated data layers.

Overall, a Data Lakehouse is the best fit because it supports mixed data types, enables both reporting and AI use cases, and scales efficiently as the startup grows.