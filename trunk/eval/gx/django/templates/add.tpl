{% extends "base.tpl" %}

{% block add_anchor_attrs %}
  class="active"
{% endblock %}

{% block main %}
<form action="/upload" method="post" enctype="multipart/form-data">
  <table border="0px">
    <tr>
      <td>File to upload:</td>
      <td><input type="file" name="image"></td>
    </tr>
    <tr>
      <td>Image Name:</td>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
	<input type="submit" name="submit" value="Upload"/>
      </td>
    </tr>
  </table>
</form>
{% endblock %}
