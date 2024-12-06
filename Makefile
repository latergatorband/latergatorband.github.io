all: lyrics html index.html

index.html: index.md template.html Makefile
	pandoc --toc -s --css reset.css --css index.css -i $< -o $@ --template=template.html

# Directory for Markdown files
MARKDOWN_DIR := ./markdown/
HTML_DIR := ./tabs

# Pattern rule for converting Markdown (.md) to HTML (.html)
$(HTML_DIR)/%.html: $(MARKDOWN_DIR)/%.md
	pandoc --toc --filter jtab.py -s --css reset.css --css index.css -i $< -o $@ --template=template.html

# Directory for Lyric Markdown files
LYRIC_SRC := ./lyrics_src
LYRIC_OUT := ./lyrics

# Pattern rule for converting Markdown (.md) to HTML (.html)
$(LYRIC_OUT)/%.html: $(LYRIC_SRC)/%.md
	pandoc --toc -s --css reset.css --css index.css -i $< -o $@ --template=template.html

clean:
	find . -maxdepth 2 -name "*.html" ! -name "template.html" -exec rm {} +

# Rule to build all HTML files from Markdown files
html: $(patsubst $(MARKDOWN_DIR)/%.md,$(HTML_DIR)/%.html,$(wildcard $(MARKDOWN_DIR)/*.md))
lyrics: $(patsubst $(LYRIC_SRC)/%.md,$(LYRIC_OUT)/%.html,$(wildcard $(LYRIC_SRC)/*.md))

.PHONY: all index.html clean
