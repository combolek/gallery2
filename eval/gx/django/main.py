import cgi
import os
import wsgiref.handlers

from google.appengine.ext import db
from google.appengine.ext import webapp
from google.appengine.api import images
from google.appengine.ext.webapp import template

class Photo(db.Model):
  image = db.BlobProperty()
  thumb = db.BlobProperty()
  name = db.StringProperty()

class TemplatedHandler(webapp.RequestHandler):
  def render(self, name, values):
    path = '%s/templates/%s' % (os.path.dirname(__file__), name)
    self.response.out.write(template.render(path, values))


class AlbumHandler(TemplatedHandler):
  def get(self):
    photos = Photo.all().fetch(9)
    while len(photos) < 9:
      photos.append(None)
    page = {'title': "John Doe's Gallery"}
    self.render('album.tpl', locals())


class PhotoHandler(TemplatedHandler):
  def get(self, id):
    photo = Photo.get_by_id(int(id))
    if photo:
      page = {'title': photo.name}
      self.render('photo.tpl', locals())
    else:
      self.error(404)


class AddHandler(TemplatedHandler):
  def get(self):
    self.render('add.tpl', locals())


class ImageHandler(TemplatedHandler):
  def get(self, type, id):
    photo = Photo.get_by_id(int(id))
    if photo:
      self.response.headers.add_header('Expires', 'Thu, 01 Dec 2014 16')
      self.response.headers['Cache-Control'] = 'public, max-age=366000'
      self.response.headers['Content-type'] = 'image/jpeg'
      if type == 'image':
        self.response.out.write(photo.image)
      else:
        self.response.out.write(photo.thumb)
    else:
      self.error(404)


class UploadHandler(webapp.RequestHandler):
  def post(self):
    photo = Photo()
    photo.image = self.request.get('image')
    photo.thumb = images.resize(self.request.get('image'), 200, 140)
    photo.name = self.request.get('name')
    photo.put()
    self.redirect('/')


def main():
  application = webapp.WSGIApplication([
      ('/', AlbumHandler),
      ('/view/(\d+)', PhotoHandler),
      ('/add', AddHandler),
      ('/upload', UploadHandler),
      ('/(image)/(\d)', ImageHandler),
      ('/(thumb)/(\d)', ImageHandler),
      ], debug=True)
  wsgiref.handlers.CGIHandler().run(application)


if __name__ == '__main__':
  main()
