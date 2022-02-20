# Script to take receipt pdf files, OCR them, and then save them to a permanent location
# Note that the OCR'd text is overlayed onto the image *and* saved as a text file

# Dependencies
# tesseract-ocr
# ocrmypdf

inputDir="$HOME/Dropbox/Automations/Receipts"
finalDir="$HOME/Dropbox/General/Archive/Receipts"

for f in $inputDir/*
do
	# Grab text from image and attempt to add text to image
	tesseract "$f" "$f" --psm 12
	ocrmypdf "$f" "$f".pdf && rm "$f"

	# Move files (move original file if failed)
	mv "$f".pdf "$finalDir" || mv "$f" "$finalDir"
	mv "$f.txt" "$finalDir"
done



