rm /home/pi/data/syncaod/twitter/index.html
cat /home/pi/data/syncaod/twitter/header.html $(find /home/pi/data/syncaod/twitter/src/* -maxdepth 1 -printf '%s %p\n'| sort -nr | head -1 | tr -d '[:space:][:digit:]') > index.html
rm $(find /home/pi/data/syncaod/twitter/src/* -maxdepth 1 -printf '%s %p\n'| sort -nr | head -1 | tr -d '[:space:][:digit:]')
cat $(find /home/pi/data/syncaod/twitter/src/* -maxdepth 1 -printf '%Ty%Tm%Td %p\n' | sort | head -1 | tr -d '[:space:][:digit:]') >> /home/pi/data/syncaod/twitter/index.html
rm $(find /home/pi/data/syncaod/twitter/src/* -maxdepth 1 -printf '%Ty%Tm%Td %p\n' | sort | head -1 | tr -d '[:space:][:digit:]');
SIZE=$(du /home/pi/data/syncaod/twitter/index.html | tr -d '[:alpha:][:punct:][:blank:]\n')
echo $SIZE
while [ $SIZE -lt 36 ]; do
	cat $(find /home/pi/data/syncaod/twitter/src/ -maxdepth 1 -printf '%s %p\n'| sort -n | head -1 | tr -d '[:space:][:digit:]') >> /home/pi/data/syncaod/twitter/index.html
	rm $(find /home/pi/data/syncaod/twitter/src/ -maxdepth 1 -printf '%s %p\n'| sort -n | head -1 | tr -d '[:space:][:digit:]')
	SIZE=$(du /home/pi/data/syncaod/twitter/index.html | tr -d '[:alpha:][:punct:][:blank:]\n')
	echo $SIZE
done
find /home/pi/data/syncaod/twitter/src/* -maxdepth 1 -printf '%s %p\n'| sort -nr | head -1
find /home/pi/data/syncaod/twitter/src/* -maxdepth 1 -printf '%Ty%Tm%Td %p\n' | sort | head -1
du src/
echo "Done"