## Architecture Recommendation

I recommend adopting a **Data Lakehouse** architecture for this use case. The startup is dealing with highly heterogeneous data types — structured (payment transactions), semi-structured (GPS logs), and unstructured (text reviews and menu images). A traditional Data Warehouse would struggle with scalability and flexibility for such diverse data, while a pure Data Lake lacks governance and query performance for analytical workloads. A Lakehouse combines the strengths of both.

First, a Lakehouse enables **schema flexibility with ACID transaction support**, allowing raw data (like images and logs) to be stored in open formats while still supporting reliable, consistent analytics on curated datasets. This is critical for evolving schemas typical in fast-growing startups.

Second, it provides **unified analytics and machine learning capabilities**. Text reviews and images can be directly used for NLP and computer vision models without data duplication, while transactional data remains queryable via SQL for business intelligence.

Third, a Lakehouse ensures **cost efficiency and scalability** by leveraging object storage (e.g., S3, GCS) while supporting high-performance query engines. This is essential given the high volume of GPS streams and media files.

Overall, a Data Lakehouse offers the right balance of flexibility, performance, and governance needed to support both real-time analytics and advanced AI-driven use cases in a rapidly scaling environment.
