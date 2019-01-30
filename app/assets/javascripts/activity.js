document.addEventListener('turbolinks:load',function() {

var nextButton = document.getElementById('next-button');
var playerScore = 0;
var pinyinCheck = document.getElementById('pinyin-check');


$(".pinyin").on('click', function(e){
  if (e.currentTarget.dataset.value == $('#word-check').data('value')) {
    var correct = e.currentTarget.style.backgroundColor = '#9DCF52';
    $(this).addClass('visible_correct');
    var x = document.getElementsByClassName("pinyin");
    var i;
    for (i = 0; i < x.length; i++) {
      if ($(x[i]).hasClass("visible_correct")){} else{$(x[i]).addClass('hide')}
    }
  }else{
    var wrong = e.currentTarget.style.backgroundColor = '#FF673F';
    $(this).addClass('visible_false');
    var x = document.getElementsByClassName("pinyin");
    var i;
    for (i = 0; i < x.length; i++) {
      if ($(x[i]).hasClass("visible_false")){} else{$(x[i]).addClass('hide')}
    }
  }
});

$(".meaning").on('click', function(e){
  if (e.currentTarget.dataset.value == $('#word-check').data('value')) {
    var correct = e.currentTarget.style.backgroundColor = '#9DCF52';
    $(this).addClass('visible_correct');
    var x = document.getElementsByClassName("meaning");
    var i;
    for (i = 0; i < x.length; i++) {
      if ($(x[i]).hasClass("visible_correct")){} else{$(x[i]).addClass('hide')}
    }
  }else{
    var wrong = e.currentTarget.style.backgroundColor = '#FF673F';
    $(this).addClass('visible_false');
    var x = document.getElementsByClassName("meaning");
    var i;
    for (i = 0; i < x.length; i++) {
      if ($(x[i]).hasClass("visible_false")){} else{$(x[i]).addClass('hide')}
    }
  }
});






});
