<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Scoreboard Pro</title>
  <link rel="stylesheet" href="styles.css">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #121212;
      color: white;
      text-align: center;
    }
    .header {

      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.8);
      position: relative;
    }
    .overlay {
      background: rgba(0, 0, 0, 0.6);
      padding: 50px;
      border-radius: 10px;
      display: inline-block;
    }
    .header h1 {
      font-size: 4rem;
      margin-bottom: 20px;
      font-weight: bold;
    }
    .header p {
      font-size: 1.5rem;
      max-width: 600px;
      margin: auto;
    }
    .buttons-container {
      margin-top: 30px;
      display: flex;
      justify-content: center;
      gap: 20px;
    }
    .buttons-container button {
      background-color: #f4a261;
      color: black;
      font-size: 1.5rem;
      padding: 15px 40px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      font-weight: bold;
      transition: background 0.3s, transform 0.2s;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }
    .buttons-container button i {
      font-size: 1.8rem;
    }
    .buttons-container button:hover {
      background-color: #e76f51;
      transform: scale(1.1);
    }
    .features {
      padding: 60px 20px;
      background-color: #1e1e1e;
    }
    .features h2 {
      font-size: 2.5rem;
      margin-bottom: 30px;
    }
    .feature-list {
      display: flex;
      justify-content: center;
      gap: 30px;
      flex-wrap: wrap;
    }
    .feature-item {
      background: #292929;
      padding: 30px;
      border-radius: 15px;
      text-align: center;
      width: 300px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }
    .feature-item i {
      font-size: 3rem;
      color: #f4a261;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="overlay">
    <h1>Scoreboard Pro</h1>
    <p>Your ultimate solution for real-time sports score tracking and game management.</p>
    <div class="buttons-container">
      <button onclick="getStarted()"><i class="fas fa-play"></i> Get Started</button>
      <button onclick="viewHistory()"><i class="fas fa-history"></i> View History</button>
    </div>
  </div>
</div>
<div class="features">
  <h2>Why Choose Scoreboard Pro?</h2>
  <div class="feature-list">
    <div class="feature-item">
      <i class="fas fa-clock"></i>
      <h3>Real-time Updates</h3>
      <p>Instantly update and track scores for ongoing games.</p>
    </div>
    <div class="feature-item">
      <i class="fas fa-chart-line"></i>
      <h3>Comprehensive Statistics</h3>
      <p>Analyze team performance with in-depth game stats.</p>
    </div>
    <div class="feature-item">
      <i class="fas fa-users"></i>
      <h3>Multi-User Access</h3>
      <p>Allow coaches, referees, and fans to access live scores.</p>
    </div>
  </div>
</div>
<script>
  function getStarted() {
    window.location.href = 'enter_team.html';
  }
  function viewHistory() {
    window.location.href = 'displayMatches.jsp';
  }
</script>
</body>
</html>



