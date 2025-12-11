#let article(
  margin: (x: 2.54cm, y: 2.54cm),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: "Ebrima",
  fontsize: 11pt,
  heading-color: rgb("#00a4e4"),
  sectionnumbering: (..numbers) =>
    if numbers.pos().len() <= 2 {
      return numbering("1.1.", ..numbers)
    },
  pagenumbering: "1",
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    header: none,
    footer: align(
      grid(
        columns: (50%, 50%),
        align(left,
          text(size: 9pt, font: font, weight: "regular", fill: black, "CMAR WATER QUALITY REPORT")
          ),
        align(right,
          text(size: 9pt, font: font, weight: "regular", fill: black, context counter(page).display("1"))
          ),
      ))
  )
  set par(
    leading: 0.75em,
    justify: true,
  )
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize
  )
  set heading(numbering: sectionnumbering)
  show heading: set text(heading-color)
  show heading: set block(below: 1.5em, above: 1.5em)



  set table(
    inset: 6pt,
    stroke: rgb("#E8E8E8")
  )
  show table: set text(size: 9pt)
  show table: set par(justify: false)
  show table.cell.where(y: 0): set text(weight: "bold")
  show figure: set block(breakable: true)

  doc
}