{% extends "base.tpl" %}

{% block view_anchor_attrs %}
  class="active"
{% endblock %}

{% block main %}
<h1>Album: Christmas 2007</h1>
<table id="photo-grid">
  <tbody>
    <tr>
      {% for photo in photos %}
      <td>
	{% ifequal photo None %}
	<img class="thumb" alt="photo"/>
	{% else %}
	<a href="/view/{{photo.key.id}}"><img src="/thumb/{{photo.key.id}}" class="thumb" alt="photo"/></a>
	{% endifequal %}
      </td>
      {% if forloop.counter|divisibleby:"3" %} </tr> <tr> {% endif %}
      {% endfor %}
    </tr>
  </tbody>
</table>
{% endblock %}
