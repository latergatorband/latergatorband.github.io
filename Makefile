all: html index.html

index.html: index.md template.html Makefile
	pandoc --toc --filter jtab.py -s --css reset.css --css index.css -i $< -o $@ --template=template.html

# Directory for Markdown files
MARKDOWN_DIR := ./markdown/
HTML_DIR := ./tabs

# Pattern rule for converting Markdown (.md) to HTML (.html)
$(HTML_DIR)/%.html: $(MARKDOWN_DIR)/%.md
	pandoc --toc --filter jtab.py -s --css reset.css --css index.css -i $< -o $@ --template=template.html

clean:
	find . -maxdepth 2 -name "*.html" ! -name "template.html" -exec rm {} +

# Rule to build all HTML files from Markdown files
html: $(patsubst $(MARKDOWN_DIR)/%.md,$(HTML_DIR)/%.html,$(wildcard $(MARKDOWN_DIR)/*.md))

.PHONY: all index.html clean
