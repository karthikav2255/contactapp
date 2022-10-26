// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./posts.js"

//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks

//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage

//= require_tree .

$( document ).ready(function() {
    $("#hide").click(function(){
     $("p").hide();
    });
 });
 $( document ).ready(function() {
    $("#show").click(function(){
        $("p").show();
 });
