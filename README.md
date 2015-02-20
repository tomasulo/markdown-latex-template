# markdown-latex-template

With this template you can write your thesis in [Markdown](http://daringfireball.net/projects/markdown/), while still using all the awesome [LaTeX](http://www.latex-project.org/) features, including

- Table of Contents
- Figures
- Listings
- Bibliography

etc.

Content written in Markdown is converted to LaTeX using [pandoc](http://johnmacfarlane.net/pandoc/) and then converted to pdf with pdflatex.

[Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Table of Contents

* [Prerequisites](#prerequisites)
* [Build](#build)
* [Commands](#commands)
    * [Referencing Chapters](#referencing-chapters)
    * [Images](#images)
    * [Sources](#sources)
    * [Math](#math)
* [Structure](#structure)
    - [Content](#content)
    - [Images](#images)
    - [Include](#include)
    - [Important Files](#important-files)

## Prerequisites

You need to install these packages to work with the template:

[TeX Live](https://www.tug.org/texlive/):
`sudo apt-get install texlive`

[biber](http://biblatex-biber.sourceforge.net/):
`sudo apt-get install biber`

[pandoc](http://johnmacfarlane.net/pandoc/):
`sudo apt-get install pandoc`

And the following:
`sudo apt-get install lmodern texlive-bibtex-extra texlive-latex-extra`

## Build

To create the pdf, run
```./build.sh nameofpdf```

## Commands

The syntax is plain Markdown. You can find a great cheatsheet [here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). 

The following commands are common in writing a thesis or specific for pandoc. Check out `01.md` for more.

### Referencing Chapters

To reference certain chapters you need to annotate the heading:

`# Chapter 1 {#chapter-one}`

You can then reference it in your text with 

`...as previously discussed in [Chapter 1](#chapter-one)...`

### Images

Add an image to `/images`. You can then add it to your document with

`![Caption of your image \label{your-label}](images/your-image.png)`

and reference it with `\ref{your-label}`.

### Sources

Simply reference your sources by writing `[@dune1990]`.

### Math

You can add Math to your document in LaTeX syntax. But you need to annotate it with `$` to signal math-mode.

For example math:

```
$\begin{aligned}
\dot{x} & = \sigma(y-x) \\
\dot{y} & = \rho x – y – xz \\
\dot{z} & = -\beta z + xy
\end{aligned}$
```

## Structure

This is the folder structure:

```
├── build.sh
├── content
│   ├── 01.md
│   └── 02.md
├── images
│   ├── cat.jpg
│   └── monster.jpg
├── include
│   ├── abstract.tex
│   ├── acknowledgements.tex
│   ├── APPENDIX.tex
│   ├── eigenstaendigkeitserklaerung.tex
│   └── titlepage.tex
├── library.bib
├── LICENSE
├── metadata.md
├── README.md
├── template.tex
```

### Content

This is where you put your content written in Markdown. You don't need to include these files anywhere because they are added automatically by pandoc.

### Images

Self-explanatory. Images go here.

### Include

Sometimes it is still necessary to create custom tex-files like the abstract or the titlepage. This is the place to put them.

You need to include those in `metadata.md` either as include-before or include-after.

For example:
```
include-before:
    - include/titlepage.tex
    - include/eigenstaendigkeitserklaerung.tex
    - include/abstract.tex
    - include/acknowledgements.tex
include-after:
    - include/APPENDIX.tex
```

### Important Files

- `build.sh`

This is the build-script you need to run if you want to build your pdf. It takes one argument which is the desired name of the pdf.

For example:
```
./build.sh mythesis
```

- `library.bib`

This is your bibliography and contains all your sources. It is referenced in `metadata.md`. You can also specify multiple bib-files.

```
biblio-files: 
    - library1.bib
    - library2.bib
    - ...
```

- `metadata.md`

You can specify settings and metadata in here. These can then be accessed in `template.tex`.

For example:

```
$for(header-includes)$
  $header-includes$
$endfor$
```

- `template.tex`

This is the most important file. pandoc uses the `template.tex` to convert markdown into LaTeX. It is referenced in `build.sh`.


