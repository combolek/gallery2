cvs -q update -d;

. ant nightly;

version=`grep version= defaults.properties | awk -F= '{print $2}'`;
echo $version;

cp gallery_remote.zip /home/httpd/htdocs/gr-staging/gallery_remote_${version}.zip;
cp gallery_remote_applets.zip /home/httpd/htdocs/gr-staging/gallery_remote_applets_${version}.zip;
cp GalleryRemote.MacOSX.NoVM.tgz /home/httpd/htdocs/gr-staging/GalleryRemote.${version}.MacOSX.NoVM.tgz;

lynx -dump -head http://jpmullan.com/galleryupdates/remote/gallery_remote_${version}.zip \
	| grep "HTTP/1.1 404" && \
	scp gallery_remote.zip paour@jpmullan.com:remote/gallery_remote_${version}.zip && \
	ssh paour@jpmullan.com "cp -pf remote/gallery_remote_${version}.zip remote/current_gallery_remote.zip" && \
	scp gallery_remote_applets.zip paour@jpmullan.com:remote/gallery_remote_applets_${version}.zip && \
	ssh paour@jpmullan.com "cp -pf remote/gallery_remote_applets_${version}.zip remote/current_gallery_remote_applets.zip" && \
	scp GalleryRemote.MacOSX.NoVM.tgz paour@jpmullan.com:remote/GalleryRemote.${version}.MacOSX.NoVM.tgz && \
	ssh paour@jpmullan.com "cp -pf remote/GalleryRemote.${version}.MacOSX.NoVM.tgz remote/current_GalleryRemote.MacOSX.NoVM.tgz" && \
	. ant post;
