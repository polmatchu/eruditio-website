var ref;
var aud;
var speak;
var img;
var isAudio;

function onLoad() {
    ref = document.getElementById("captcha_image");
    aud = document.getElementById("captcha_audio");
    speak = document.getElementById("speaker");
    img = document.getElementById("image-icon");
    isAudio = false;
}

function refresh(){
    var d = new Date();
    if(isAudio)
    {
        aud.src = "AudioCaptchaMaker?" + (d.getTime());
    }
    else
    {
        ref.src = "CaptchaServlet?" + (d.getTime());
    }
}

function voice(){
    aud.src = "AudioCaptchaMaker";
    aud.style.display = "initial";
    ref.style.display = "none";
    speak.style.display = "none";
    img.style.display = "initial";
    isAudio = true;
}

function image(){
    ref.style.display = "initial";
    aud.style.display = "none";
    speak.style.display = "initial";
    img.style.display = "none";
    isAudio = false;
}


function onChange() {
  const password = document.querySelector('input[name=password]');
  const confirmPass = document.querySelector('input[name=confirmPass]');
  if (confirmPass.value === password.value) {
    confirmPass.setCustomValidity('');
  } else {
    confirmPass.setCustomValidity('Passwords do not match');
  }
}
