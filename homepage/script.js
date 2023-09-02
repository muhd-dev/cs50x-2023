let fadeOut = document.getElementById("fadeOut");
const video = document.querySelector(".myVideo");
const playPauseButton = document.getElementById("playPauseButton");

playPauseButton.addEventListener("click", function() {
    if (video.paused) {
        video.play();
    } else {
        video.pause();
    }
    fadeOut.classList.toggle("fade"); // Toggle the "fade" class when the button is clicked
});

video.addEventListener("ended", function() {
    fadeOut.classList.remove("fade"); // Remove the "fade" class when the video ends to make the text fade in
});