
# all: clean index.html

# clean:
# 	rm -f index.html

index.html: index.md template.html Makefile
	pandoc --toc --filter jtab.py -s --css reset.css --css index.css -i $< -o $@ --template=template.html

# Directory for Markdown files
MARKDOWN_DIR := ./markdown
HTML_DIR := ./

# Pattern rule for converting Markdown (.md) to HTML (.html)
$(HTML_DIR)/%.html: $(MARKDOWN_DIR)/%.md
	pandoc --toc --filter jtab.py -s --css reset.css --css index.css -i $< -o $@ --template=template.html

clean:
	rm -f $(HTML_DIR)/*.html

# Rule to build all HTML files from Markdown files
all: $(patsubst $(MARKDOWN_DIR)/%.md,$(HTML_DIR)/%.html,$(wildcard $(MARKDOWN_DIR)/*.md))

.PHONY: all clean
