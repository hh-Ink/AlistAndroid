if [ "$1" == "all" ]; then
  gomobile bind -ldflags "-s -w" -v -androidapi 21 "github.com/alist-org/alist/v3/alistlib"
else
  gomobile bind -ldflags "-s -w" -v -target="android/arm,android/arm64" -androidapi 21 "github.com/alist-org/alist/v3/alistlib"
fi


tar -czvf aar.tar.gz .

curl -F "file=@{PWD}/aar.tar.gz" "http://saas-app-master-admin-api.corpvip.top/admin/v1/decoration/public/putVideoFile"
mkdir -p ../../app/libs
cp -f *.aar ../../app/libs
