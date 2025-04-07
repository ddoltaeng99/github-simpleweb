document.addEventListener("DOMContentLoaded", function() {
    let tabs = document.querySelectorAll(".tab");
    let currentPage = window.location.pathname.split("/").pop(); // Get current page name

    tabs.forEach(tab => {
        if (tab.getAttribute("href") === currentPage) {
            tab.classList.add("active");
        }
    });
});
