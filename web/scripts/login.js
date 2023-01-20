function execute(){
    var forms = document.getElementById("forms");
    const username = document.getElementById("username");
    const password = document.getElementById("password");
    const loginBtn = document.getElementById("loginBtn");

    forms.addEventListener('input', () => {
        if(username.value.length > 0 && password.value.length > 0){
            loginBtn.className = "btn1"
            loginBtn.disabled = false;
        }
        else{
            loginBtn.className = "btn-disabled"
            loginBtn.disabled = true;
        }
    });
}