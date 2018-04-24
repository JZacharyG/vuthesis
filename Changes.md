## Proposed LaTeX Template for Dissertations

### Summary of Changes

I'll mark with an asterisk those that I think may not conform to the format guidelines.  I have included these changes because I am either not sure or I think they are worth considering anyway.  All are easily changeable.

- Title page
  - Centered signature lines
  - Single spaced title
  - (*) Title is in a slightly larger font than the rest of the text
  - Made spacing between lines more consistent
  - Allowed the height of signature lines to shrink a little if needed to fit on one page.  Can now fit up to eight names on the title page even at 12pt font, in case someone has a very large committee, where the existing template will wrap to the next page on the sixth name (without some manual tweaking).
  - (*) Committee member names (underneath signature lines) are typeset in a slightly smaller font than the rest of the text
  - List of committee names (when there are no signature lines) are now 1.5 spaced (which it appears to be in the format guidelines)
  - (*) Committee names are vertically centered in the remaining space.  Would you like them to be a fixed distance under the rest of the text, or aligned to the bottom, or something else?
- Table of Contents, List of Figures/Tables
  - Added "Chapter" heading in TOC after the preliminary sections (and "Appendix" precedes the appendix chapters, if present)
  - There is now a little space between chapters in these lists, as is the default LaTeX style, and what appears in the format guidelines
  - Included "List of Abbreviations" in template
  - (*) These are all now single spaced, regardless of the spacing of the rest of the document
- Section Headings
  - (*) Chapters are typeset in a slightly larger font than surrounding text
  - (*) Chapter titles are prevented from using the full width of the page, to help long titles stand out from surrounding text
  - Chapter/section/subsection headings are single spaced  
- Other
  - Copyright page is now included in the template
  - Dedication page is typeset centered, as it is in the format guidlines
  - Copyright and dedication are typeset a little bit above the center of the page
  - No options are given for the text of the copyright page (apart from the year).  The copyright name is assumed to be the same as the author of the dissertation.  do users need to be able to customize this page further?
  - Do you want to have symmetrical margins (as in the format guidelines) or a larger margin on the left than the right (as is the case with the existing LaTeX template)?
  - Appendix is now included in the template


### Other Questions

- The format guidelines say the following with regard to styling of headings, subheadings:
  > The number of levels and the placement of the headings and subheadings will vary, dependent on departmental requirements or preference. Headings may be centered, left justified,in bold face, italicized, indented or numbered. Use the same style throughout the document.

  At the moment, chapter titles are centered with the chapter number on a separate line, sections are centered, subsections are left aligned, and subsubsections and below are left aligned and not numbered (as was the case in the existing LaTeX template), all in the normal font face (with chapter headings optionally a little larger).

  Is this what you would like the default to be?  I personally think that the left aligned subsection headings do not sufficiently stand out from surrounding text, and that either centering them or adding a little extra space above or below would be helpful.

  Also, do we know how this differs by department?  This sort of styling isn't something that the author should have to worry about, and if you can provide me with the style expectations of different departments, I can turn them into easily accessible options in the template.

- Do you want any indication, when listing committee members on the title page, of which member is the chair/advisor?

- The format guideline lists "Preface" as an optional section in the preliminary pages.  How should this be typeset?  Should this be formatted like an (unnumbered) chapter, like the Acknowledgements section currently is?  I've included a Preface in the template under this assumption.

- In the format guideline, the first paragraph after a section heading is indented, while LaTeX, by default, will only indent subsequent paragraphs.  Do you care which style is used?