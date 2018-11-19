echo "Maken losse pdf bestanden";

rm kookboek.*

for f in *.md;
do
   if [ $f == "kookboek.md" ]
   then
   continue
   fi

	filename=$(basename "$f")
	extension="${filename##*.}"
	filename="${filename%.*}"

	cat $f >> kookboek.md;

	pandoc $f -c recept.css -o "$filename.pdf"

	echo "Maken $f file..";
done

echo "Verwijderen oude versies";

rm out/*.pdf

echo "Verplaatsen output";

mv *.pdf out/

echo "Samenvoegen pdf bestanden tot boek.";

# gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out/kookboekcasabruna.pdf out/*.pdf

pandoc kookboek.md -c recept.css metadata.yaml -o "kookboek.pdf"

# pandoc kookboek.md -c recept.css metadata.yaml --template eisvogel -o "kookboek.pdf"

# pandoc -t html5 -c recept.css metadata.yaml kookboek.md -o "kookboek2.pdf"
