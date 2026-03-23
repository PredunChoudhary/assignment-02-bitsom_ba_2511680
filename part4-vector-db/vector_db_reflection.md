Question-- "A law firm wants to build a system where lawyers can search 500-page contracts by asking questions in plain English (e.g., 'What are the termination clauses?'). Would a traditional keyword-based database search suffice? Justify why or why not, and explain what role a vector database would play in this system."

Answer-- A traditional keyword-based database search would not be sufficient for this use case. Keyword search works by matching exact words in the query with words in the document. However, legal contracts are complex and often use formal language where the same concept can be described in different ways. For example, a “termination clause” might be written using phrases like “agreement may be ended” or “contract may be dissolved.” A keyword search may miss these variations if the exact words are not present.

A vector database solves this problem by understanding the **meaning** of the text rather than just matching keywords. In this system, the 500-page contracts would first be converted into embeddings (numerical representations of text). These embeddings capture the semantic meaning of each section of the document.

When a lawyer asks a question in plain English, the query is also converted into an embedding. The vector database then finds the most similar sections of the contract based on meaning, not exact wording. This allows the system to return accurate and relevant results even if the wording is different.

Therefore, a vector database plays a critical role in enabling semantic search, making it much more effective for large and complex legal documents compared to traditional keyword-based approaches.
