echo "Maken losse pdf bestanden";

for f in *.md;
do
	filename=$(basename "$f")
	extension="${filename##*.}"
	filename="${filename%.*}"

	pandoc $f -c recept.css -o "$filename.pdf"

	echo "Maken $f file..";
done

echo "Verwijderen oude versies";

rm ../*.pdf

echo "Verplaatsen output";

mv *.pdf ..

echo "Samenvoegen pdf bestanden tot boek.";

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=../kookboekcasabruna.pdf ../*.pdf
