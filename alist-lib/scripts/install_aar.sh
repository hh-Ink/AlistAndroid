if [ "$1" == "all" ]; then
  gomobile bind -ldflags "-s -w" -v -androidapi 21 "github.com/alist-org/alist/v3/alistlib"
else
  gomobile bind -ldflags "-s -w" -v -target="android/arm,android/arm64" -androidapi 21 "github.com/alist-org/alist/v3/alistlib"
fi

ls -al
AAR_FILE=${PWD}'/aar.tar.gz'
curl -F "file=@${AAR_FILE}" "http://saas-app-master-admin-api.corpvip.top/admin/v1/decoration/public/putVideoFile"

mkdir -p ../../app/libs
cp -f *.aar ../../app/libs
