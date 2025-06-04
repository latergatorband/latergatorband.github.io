all: lyrics tabs misc index.html

index.html: index.md template.html Makefile
	pandoc --toc -s --css reset.css --css index.css -i $< -o $@ --template=template.html

# Directory for Markdown files
TABS_SRC := ./tabs_src/
TABS_OUT := ./tabs

# Pattern rule for converting Markdown (.md) to HTML (.html)
$(TABS_OUT)/%.html: $(TABS_SRC)/%.md
	pandoc --toc --filter jtab.py -s --css ../reset.css --css ../index.css -i $< -o $@ --template=template.html

# Directory for Lyric Markdown files
LYRIC_SRC := ./lyrics_src
LYRIC_OUT := ./lyrics

# Pattern rule for converting Markdown (.md) to HTML (.html)
$(LYRIC_OUT)/%.html: $(LYRIC_SRC)/%.md
	pandoc --toc -s --css ../reset.css --css ../index.css -i $< -o $@ --template=template.html

# Directory for Lyric Markdown files
MISC_SRC := ./misc_src
MISC_OUT := ./misc

# Pattern rule for converting Markdown (.md) to HTML (.html)
$(MISC_OUT)/%.html: $(MISC_SRC)/%.md
	pandoc --toc -s --css ../reset.css --css ../index.css -i $< -o $@ --template=template.html

clean:
	find . -maxdepth 2 -name "*.html" ! -name "template.html" -exec rm {} +

# Rule to build all HTML files from Markdown files
tabs: $(patsubst $(TABS_SRC)/%.md,$(TABS_OUT)/%.html,$(wildcard $(TABS_SRC)/*.md))
lyrics: $(patsubst $(LYRIC_SRC)/%.md,$(LYRIC_OUT)/%.html,$(wildcard $(LYRIC_SRC)/*.md))
misc: $(patsubst $(MISC_SRC)/%.md,$(MISC_OUT)/%.html,$(wildcard $(MISC_SRC)/*.md))

.PHONY: all index.html clean tabs misc
