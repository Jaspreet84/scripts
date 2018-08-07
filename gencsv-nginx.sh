echo "Working on it.."
rm -v /tmp/data/*
grep $1 $2 | grep 'registerWith' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/registerWith.csv
echo 10
grep $1 $2 | grep 'device_register' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/device_register.csv
echo 9
grep $1 $2 | grep 'unregister' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/unregister.csv
echo 8
grep $1 $2 | grep 'registerDevice' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/registerDevice.csv
echo 7
grep $1 $2 | grep 'keepalive_api.php' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/keepalivephp.csv
echo 6
grep $1 $2 | grep 'mobile/company' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/mobile-company.csv
echo 5
grep $1 $2 | grep 'autoUpdate/updateZscalerApplication' | grep -v updateZscalerApplicationv2 | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/autoUpdateZApp.csv
echo 4
grep $1 $2 | grep 'autoUpdate/updateZscalerApplicationv2' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/autoUpdateZAppv2.csv
echo 3
grep $1 $2 | grep ' / ' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/root.csv
echo 2
grep $1 $2 | grep 'policy/keepAlive' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/keepalives.csv
echo 1
grep $1 $2 | grep 'HTTP/1.1" 502' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/502.csv
echo 0
grep $1 $2 | grep 'HTTP/1.1" 50' | cut -w -f4 | cut -d: -f2-3 | uniq -c > /tmp/data/50X.csv
echo "Done!"
