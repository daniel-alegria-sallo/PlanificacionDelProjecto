DATA_DIR = ./src/data
GEN_DIR = ./src/generated

output: ${GEN_DIR}/historias.tex
	tectonic -X build

${GEN_DIR}/historias.tex: ${DATA_DIR}/historias.csv
	mkdir -p ${GEN_DIR}
	cp $< ${GEN_DIR}/historias.tex
	sed -i '/^$$/d' ${GEN_DIR}/historias.tex # delete empty lines
	sed -i 's/;/ \&/g' ${GEN_DIR}/historias.tex
	sed -i 's/$$/ \\\\/' ${GEN_DIR}/historias.tex
	# TODO: remove empty newlines in dependency
	# sed -i "s/--- //g" historias.tex
	# sed -i '1 i\\\begin{enumerate}' historias.tex
	# printf '\\end{enumerate}\n' >> historias.tex

clean:
	rm -f main.aux main.log main.pyg main.xdv main.out

.PHONY: clean

