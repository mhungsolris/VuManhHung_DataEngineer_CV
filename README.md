# Vu Manh Hung — Data Engineer CV

LaTeX source and compiled PDF for my Data Engineer CV. The project uses a modular, single-column A4 layout with XCharter typography and green and gold accents.

## View the CV

[Download the CV (PDF)](main.pdf)

## Open in Overleaf

1. On GitHub, select **Code → Download ZIP**.
2. In Overleaf, select **New project → Upload project** and upload the ZIP.
3. Set **main.tex** as the main document and **XeLaTeX** as the compiler in project settings.
4. Select **Recompile**, then download the PDF.

The source uses `fontspec`; use XeLaTeX rather than pdfLaTeX. Uploading a ZIP is a manual import; later GitHub commits do not automatically update the Overleaf project.

## Build locally

With TeX Live or MiKTeX and XeLaTeX installed, run from the repository root:

```sh
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

Alternatively, with Tectonic installed:

```sh
tectonic --keep-logs main.tex
```

Both produce `main.pdf`. The Windows helper `build.ps1` uses Tectonic on PATH or an existing Codex-bundled installation.

Dependencies: `geometry`, `fontspec`, XCharter fonts, `xcolor`, `enumitem`, `needspace`, and `hyperref`.

## Project structure

```text
main.tex                 # Document entry point and section order
profile.tex              # Name, title, contact details, employer
components/style.tex     # Fonts, colors, spacing, reusable commands
sections/
  summary.tex
  experience.tex
  projects.tex
  education.tex
  skills.tex
main.pdf                 # Compiled CV
build.ps1                # Windows build helper
```

## Update the CV

- Edit contact details in `profile.tex`.
- Edit experience, projects, education, and skills in the corresponding section files.
- Adjust the layout in `components/style.tex`.
- Replace `[CURRENT COMPANY]` in `profile.tex` before submitting an application.
- Escape LaTeX special characters such as `\&`, `\%`, `\_`, and `\#`.

After editing, rebuild `main.pdf`, inspect every page, and check that text and links are readable. Commit the source and the updated PDF together.

```sh
git add profile.tex sections components main.tex main.pdf
git commit -m "Update CV"
git push origin main
```
