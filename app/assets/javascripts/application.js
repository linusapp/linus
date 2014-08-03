//= require deb
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  console.log("Creating GA Instance")
  ga('create', 'UA-34435277-17', 'auto')
  ga('send', 'pageview')

  $(document).on('page:change', function() {
    console.log("Tracking new page view")
    ga('send', 'pageview')
  })
})