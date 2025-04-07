function switchTab(tabId) {
    var tab = document.getElementById(tabId);

    if (tab) {
        tab.checked = true; // Selects the tab
    } else {
        console.error("Element with ID '" + tabId + "' not found.");
        return;
    }

    // Redirect based on tab selection
    if(tabId === 'tab-1'){
        window.location.href = "index.html"; // Redirects to score page
    }else if(tabId === 'tab-2'){
        window.location.href = "enter_team_name.html"; // Redirects to score page
    }
    else if (tabId === 'tab-3') {
        window.location.href = "score.jsp"; // Redirects to score page
    } else if (tabId === 'tab-4') {
        window.location.href = "viewHistory.jsp"; // Redirects to view history page
    }
}
