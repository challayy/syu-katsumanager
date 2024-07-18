// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery'
import 'bootstrap/dist/js/bootstrap.bundle'
import 'bootstrap';

Rails.start()
ActiveStorage.start()

document.addEventListener("turbo:load", function() {
    console.log('Turbo loaded');
    $('.dropdown-toggle').dropdown();
});

import "controllers"

import { Turbo } from "@hotwired/turbo-rails";
window.Turbo = Turbo;