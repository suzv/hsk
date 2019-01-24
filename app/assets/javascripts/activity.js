var nextButton = document.getElementById('next-button');
var playerScore = 0;
var pinyinButton = document.getElementsByClassName('box-button');
var meaningButton = document.getElementsByClassName('box-button2');
var pinyinCheck = document.getElementById('pinyin-check');


$(".box-button").one('click', function(e){
  if (e.currentTarget.dataset.value == $('#word-check').data('value')) {
    var correct = e.currentTarget.style.backgroundColor = '#9DCF52';
    correct;
  }else{
    var wrong = e.currentTarget.style.backgroundColor = '#FF673F';
    wrong;
  }
});

if(nextButton){
  nextButton.addEventListener('click', function(){
    $.ajax({
      url: '<%= activities_next_check_path %>',
      type: 'POST',
      dataType: 'script',
      data: {param1: 'correct'}
    })
    .done(function() {
      console.log("success");
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  }, false);
}
