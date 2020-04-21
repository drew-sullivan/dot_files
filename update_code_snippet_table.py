import sys
import glob
import xml.etree.ElementTree as ET

code_snippets = glob.glob("xcode_code_snippets/*.codesnippet")

def get_code_snippet_title(file):
    found = False
    tree = ET.parse(file)
    for el in tree.iter():
        if el.text == 'IDECodeSnippetTitle':
            found = True
            continue
        if found == True:
            return el.text

def get_code_snippet_summary(file):
    found = False
    tree = ET.parse(file)
    for el in tree.iter():
        if el.text == 'IDECodeSnippetSummary':
            found = True
            continue
        if found == True:
            return el.text

def get_code_snippet_shortcut(file):
    found = False
    tree = ET.parse(file)
    for el in tree.iter():
        if el.text == 'IDECodeSnippetCompletionPrefix':
            found = True
            continue
        if found == True:
            return el.text

def get_table_elements():
    titles = []
    summaries = []
    shortcuts = []
    for file in code_snippets:
        title = get_code_snippet_title(file)
        summary = get_code_snippet_summary(file)
        shortcut = get_code_snippet_shortcut(file)
        titles.append(title)
        summaries.append(summary)
        shortcuts.append(shortcut)
    return (titles, summaries, shortcuts)

(titles, summaries, shortcuts) = get_table_elements()

section_title = '### Xcode code snippets\n'
headers = '| Title | Summary | Shortcut |\n'
underline = '| :--- | :--- | :--- |\n'
md_str = section_title + headers + underline
for i in range(len(titles)):
    title = titles[i]
    summary = summaries[i]
    shortcut = shortcuts[i]
    str = '| {} | {} | {} |\n'.format(title, summary, shortcut)
    md_str += str

with open("code_snippet_table.md", "w") as cs_file:
    cs_file.write(md_str)

print("\ncode_snippet_table.md updated\n")
