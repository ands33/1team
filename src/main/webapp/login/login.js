document.querySelector(".id").addEventListener("focusin", function(){
    document.querySelector(".inputUserIcon").style.color = "#e74c3c";
});
document.querySelector(".id").addEventListener("focusout", function(){
    document.querySelector(".inputUserIcon").style.color = "#333";
});

document.querySelector(".pass").addEventListener("focusin", function(){
    document.querySelector(".inputPassIcon").style.color = "#e74c3c";
});
document.querySelector(".pass").addEventListener("focusout", function(){
    document.querySelector(".inputPassIcon").style.color = "#333";
});
