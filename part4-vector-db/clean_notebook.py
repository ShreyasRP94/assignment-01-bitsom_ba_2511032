import nbformat

file_path = "embeddings_demo.ipynb"

nb = nbformat.read(file_path, as_version=4)

# Remove notebook-level widget metadata
if "widgets" in nb.metadata:
    del nb.metadata["widgets"]

# Remove cell-level widget metadata (if any)
for cell in nb.cells:
    if "widgets" in cell.get("metadata", {}):
        del cell["metadata"]["widgets"]

nbformat.write(nb, file_path)

print("Notebook cleaned successfully (outputs preserved).")