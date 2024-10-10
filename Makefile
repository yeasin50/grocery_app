.PHONY: build_apk  clean_pub_get 



build_apk: clean_pub_get
	@flutter build apk 
 

# Clean project and run pub get
clean_pub_get:
	@flutter clean
	@flutter pub get

 