{% extends "base.tpl" %}

{% block main %}
<table id="photo-grid">
  <tbody>
    <tr>
      <td>
	<img src="/image/{{photo.key.id}}" class="photo" alt="{{photo.name}}"/>
      </td>
    </tr>
    <tr>
      <td>
	<a href="/">Return to Album</a> or
	<a href="/delete/{{photo.key.id}}">Delete this Photo </a>
      </td>
    </tr>
  </tbody>
</table>
{% endblock %}
