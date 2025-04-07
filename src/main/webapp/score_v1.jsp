<%--
  Created by IntelliJ IDEA.
  User: maxchin
  Date: 2025/02/19
  Time: 12:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.cdnfonts.com/css/60s-scoreboard" rel="stylesheet">
  <link rel="stylesheet" href="tab.css">
  <script src="tab.js"></script>

  <title>Basketball Scoreboard</title>
  <style>
    body {
      text-align: center;
      font-family: 'Poppins', sans-serif;
      background-color: #121212;
      color: #ffffff;
    }
    .scoreboard {
      display: inline-block;
      padding: 20px;
      border-radius: 10px;
      background: #1e1e1e;
      box-shadow: 0 6px 15px rgba(11, 10, 10, 0.1);
      width: 560px;
      margin-top:10px;
    }

    #save_score{
      background: #1e1e1e;
      box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.1);
      width: 520px;
      padding: 20px;
    }
    #save_score input{
      width: 250px;
      font-size: 16px;
      padding:5px;
    }
    .team {
      font-size: 60px;
    }
    .score {
      font-size: 60px;
      margin: 10px;
    }
    .timer, .shot-clock, .timeouts, .quarter {
      font-size: 20px;
      margin: 10px;
    }
    button {
      margin: 5px;
      padding: 10px;
      border: none;
      border-radius: 5px;
      background: #ff9800;
      color: #ffffff;
      font-size: 16px;
      cursor: pointer;
    }
    button:hover {
      background: #e68900;
    }
    input {
      background: #1e1e1e;
      color: #fff;
      border: none;
      padding: 5px;
      border-radius: 5px;
    }

    h2{
      /*font-family: '60s Scoreboard', sans-serif;*/
      font-size:36px;
      font-weight: bold;
      /*border-bottom: 3px solid #fff;*/
      padding-bottom: 15px;
      text-shadow: 2px 2px 10px rgba(170, 168, 168, 0.8);
    }
    h3{
      /*border: 1px solid #fff;*/
      text-align: left;
      color:#ff9800;
      margin:0 0 10px 0;
      padding-left:90px;
    }
    #title_home{
      color:#fff;
    }
    #title_visitor {
      color: #2d61bf;
    }
    hr{
      color:#666666;
    }
    div.foul{
      /*border:1px solid #e76f51;*/
      width: 540px;
      height: 50px;
    }
    div.foul .add-foul{
      float:right;
    }
    div.foul span {
      display:block;
      float:left;
      color:#e76f51;
      /*border: 1px solid #fff;*/
      font-size: 20px;
      margin-top:10px;

    }
    .label_fouls{
      margin-right:0.5em;
      padding-left: 80px;
    }
    .team_name_font{
      float:left;
      color:#888;
      font-size: 28px;
    }
    #teamAName, #teamBName{
      /*border:1px solid #fff;*/
      width: 140px;
      height: 30px;
      float: left;
      text-align: right;
      padding-top:10px;
    }
    .team_name, input {
      font-size:30px;
    }
    .score {
      font-family: '60s Scoreboard', sans-serif;
      /*border:1px solid #fff;*/
      display:inline-block;
      width:150px;
      height:50px;
      font-size: 30px;
      color: #e30707;
      padding:0;
      margin:0;
    }
    .score_buttons{
      /*border: 1px solid #fff;*/
      width:240px;
      float: right;
    }
    #timer_buttons button, #clock_buttons button{
      font-size: 14px;
    }
    #startQuarterTimerBtn, #stopQuarterTimerBtn,#resetQuarterTimerBtn{
      background-color: #f37920;
    }
    #nextQuarterBtn, #resetQuarterBtn{
      background-color: #bf4f06;
    }
    #quarterTimer,#shotClock,#teamATimeoutTimer,#teamBTimeoutTimer{
      color:forestgreen;
      font-family: '60s Scoreboard', sans-serif;
      font-size: 24px;
    }
    #startShotClockBtn, #stopShotClockBtn,#resetShotClockBtn{
      background-color: #853808;
    }
    .timeout-btn{
      background-color: #602501;
    }
    #save_button{
      background-color: #400402;
      width:180px;
      border:1px solid #632400;
    }

  </style>
</head>
<body>
<div class="tabs">
  <a href="index.jsp" class="tab">🏠 Home</a>
  <a href="enter_team.html" class="tab">📝 Enter Team</a>
  <a href="score.jsp" class="tab">🏀 Scoreboard</a>
  <a href="displayMatches.jsp" class="tab">📋 Matches</a>
</div>
<div class="scoreboard">

  <h2>BASKETBALL SCORE BOARD</h2>
  <form action="score.jsp" method="POST">
    <div>
        <%
      String h1 = request.getParameter("hidden_a_score");
      String h2 = request.getParameter("hidden_b_score");
      //int  s1 = Integer.parseInt(h1);
      if(h1 == null){
        h1 ="0";
      }else{
        h1 = request.getParameter("hidden_a_score");
      }
      if(h2 == null){
        h2 ="0";
      }else{
        h2 = request.getParameter("hidden_b_score");
      }
      %>
      <h3 id="title_home">Home</h3>
      <label class="team_name"> <input type="text" id="teamAName" name="teamA" value="<%=request.getParameter("teamA")%>"></label>
      <span class="score" id="teamAScore"><%=h1%></span>
      <input type="hidden" name="h_teamAScore" value="<%=h1%>" id="h_teamAScore" />
      <div class="score_buttons">
        <button type="button" class="add-point" data-team="A" data-points="1">+1</button>
        <button type="button" class="add-point" data-team="A" data-points="2">+2</button>
        <button type="button" class="add-point" data-team="A" data-points="3">+3</button>
        <button type="button" class="add-point" data-team="A" data-points="-1">-1</button>
      </div>
      <div class="foul" ><span class="label_fouls">Fouls:</span> <span id="teamAFouls">0</span>
        <button type="button" class="add-foul" data-team="A">Add Foul</button>
      </div>
      <hr>
      <div>
        <h3 id="title_visitor">Visitor</h3>
        <label class="team_name"> <input type="text" id="teamBName" name="teamB" value="<%=request.getParameter("teamB")%>"></label>
        <span class="score" id="teamBScore"><%=h2%></span>
        <input type="hidden" name="h_teamBScore" value="<%=h2%>" id="h_teamBScore" />
        <div class="score_buttons">
          <button type="button" class="add-point" data-team="B" data-points="1">+1</button>
          <button type="button" class="add-point" data-team="B" data-points="2">+2</button>
          <button type="button" class="add-point" data-team="B" data-points="3">+3</button>
          <button type="button" class="add-point" data-team="B" data-points="-1">-1</button>
        </div>
        <div class="foul"><span class="label_fouls">Fouls:</span> <span id="teamBFouls">0</span>
          <button type="button" class="add-foul" data-team="B">Add Foul</button>
        </div>
      </div>
      <hr>
      <div class="quarter">Quarter: <span id="currentQuarter">1st</span></div>
      <div class="timer">Time: <span id="quarterTimer">10:00</span></div>
      <div id="timer_buttons">
        <button type="button" id="startQuarterTimerBtn">Start Timer</button>
        <button type="button" id="stopQuarterTimerBtn">Stop Timer</button>
        <button type="button" id="resetQuarterTimerBtn">Reset Timer</button>
        <button type="button" id="nextQuarterBtn">Next Quarter</button>
        <button type="button" id="resetQuarterBtn">Reset Quarter</button>
      </div>
      <div class="shot-clock">Shot Clock: <span id="shotClock">24</span>&nbsp;seconds</div>
      <div id="clock_buttons">
        <button type="button" id="startShotClockBtn">Start Shot Clock</button>
        <button type="button" id="stopShotClockBtn">Stop Shot Clock</button>
        <button type="button" id="resetShotClockBtn">Reset Shot Clock</button>
      </div>
      <hr>
      <div class="timeouts">
        Home Timeout:&nbsp; <span id="teamATimeoutTimer">0</span>
        <button type="button" class="timeout-btn" data-team="A" data-seconds="30">30s</button>
        <button type="button" class="timeout-btn" data-team="A" data-seconds="60">1min</button>
      </div>

      <div class="timeouts">
        Visitor Timeout:&nbsp;<span id="teamBTimeoutTimer">0</span>
        <button type="button" class="timeout-btn" data-team="B" data-seconds="30">30s</button>
        <button type="button" class="timeout-btn" data-team="B" data-seconds="60">1min</button>
      </div>

      <div id="save_score">
        <input type="hidden" id="teamF" value="<%=request.getParameter("teamA")%>">
        <input type="hidden" id="teamS" value="<%=request.getParameter("teamB")%>">
        <input type="hidden" id="scoreF" value="<%=request.getParameter("h_teamAScore")%>">
        <input type="hidden" id="scoreS" value="<%=request.getParameter("h_teamBScore")%>">
        <input type="hidden" id="save_yes" value="1">
        <button id="save_button" type="button">Save Score</button>
      </div>
  </form>
</div>

<script>

  document.getElementById("save_button").addEventListener("click", function (event) {
    event.preventDefault(); // ✅ Only prevents the form from submitting
  });
  document.addEventListener("DOMContentLoaded", function () {
    console.log("DOM fully loaded");

    let quarter = 1;
    let quarterTime = 600;
    let shotClock = 24;
    let quarterInterval, shotClockInterval, timeoutIntervals = {};

    function addPoints(team, points) {
      let teamname = 'team'+String(team)+'Score';
      let h_teamscore = 'h_team'+String(team)+'Score';
      //window.alert("h_teamscore: "+h_teamscore);

      let scoreElement = document.getElementById(teamname);
      let hiddenScoreElement = document.getElementById(h_teamscore);

      if (!scoreElement || !hiddenScoreElement) {
        console.error(`Error: Score elements for team ${team} not found`);
        return;
      }

      let newScore = Math.max(0, parseInt(scoreElement.innerText) + points);
      scoreElement.innerText = newScore;
      hiddenScoreElement.value = newScore;
    }

    function addFoul(team) {
      var tname = 'team'+String(team)+'Fouls';
      let foulElement = document.getElementById(tname);
      if (!foulElement) {
        console.error(`Error: Foul element for team ${tname} not found`);
        return;
      }
      foulElement.innerText = parseInt(foulElement.innerText) + 1;
    }

    function nextQuarter() {
      if (quarter < 4) {
        quarter++;
      } else if (quarter === 4) {
        quarter = "OT";
      } else if (typeof quarter === "string" && quarter.startsWith("OT")) {
        let otNumber = parseInt(quarter.replace("OT ", "").trim()) || 1;
        quarter = `OT ${otNumber + 1}`;
      }

      document.getElementById("currentQuarter").innerText =
              typeof quarter === "string" ? quarter : quarter + getQuarterSuffix(quarter);

      console.log(`Quarter updated to: ${quarter}`);
    }

    function getQuarterSuffix(q) {
      return (q === 1) ? "st" : (q === 2) ? "nd" : (q === 3) ? "rd" : "th";
    }

    function resetQuarter() {
      quarter = 1;
      document.getElementById("currentQuarter").innerText = "1st";
      document.getElementById("teamAFouls").innerText = "0";
      document.getElementById("teamBFouls").innerText = "0";
    }

    function startQuarterTimer() {
      clearInterval(quarterInterval);
      quarterInterval = setInterval(() => {
        if (quarterTime > 0) {
          quarterTime--;
          document.getElementById('quarterTimer').innerText =
                  Math.floor(quarterTime / 60) + ":" + (quarterTime % 60 < 10 ? "0" : "") + (quarterTime % 60);
        } else {
          clearInterval(quarterInterval);
        }
      }, 1000);
    }

    function stopQuarterTimer() {
      clearInterval(quarterInterval);
    }

    function resetQuarterTimer() {
      quarterTime = 600;
      document.getElementById('quarterTimer').innerText = '10:00';
    }

    function startShotClock() {
      clearInterval(shotClockInterval);
      shotClockInterval = setInterval(() => {
        if (shotClock > 0) {
          shotClock--;
          document.getElementById('shotClock').innerText = shotClock;
        } else {
          clearInterval(shotClockInterval);
        }
      }, 1000);
    }

    function stopShotClock() {
      clearInterval(shotClockInterval);
    }

    function resetShotClock() {
      shotClock = 24;
      document.getElementById('shotClock').innerText = "24";
    }

    function useTimeout(team, seconds) {
      // Ensure the timeoutIntervals object exists and clear any existing interval
      if (!timeoutIntervals[team]) {
        timeoutIntervals[team] = null;
      }
      clearInterval(timeoutIntervals[team]);

      let timer = seconds;
      let teamName ='team'+String(team)+'TimeoutTimer';
      //window.alert('teamName:'+teamName +'seconds:' + timer);
      let timerElement = document.getElementById(teamName);
      if (!timerElement) {
        console.error(`Error: Timeout element for team ${team} not found`);
        return;
      }

      timerElement.innerText = timer; // ✅ Correct display

      timeoutIntervals[team] = setInterval(() => {
        if (timer > 0) {
          timer--;  // Decrease time
          timerElement.innerText = timer; // ✅ Update text correctly
        } else {
          clearInterval(timeoutIntervals[team]); // Stop timer when it reaches 0
          timerElement.innerText = "0"; // ✅ Display message when done
        }
      }, 1000);
    }

    // ✅ Attach event listeners to timeout buttons dynamically
    document.querySelectorAll(".timeout-btn").forEach(button => {
      button.addEventListener("click", function () {
        let team = this.dataset.team;
        let seconds = parseInt(this.dataset.seconds);
        useTimeout(team, seconds);
      });
    });


    // ✅ Attach event listeners for points buttons dynamically
    document.querySelectorAll(".add-point").forEach(button => {
      button.addEventListener("click", function () {
        let team = this.dataset.team;
        let points = parseInt(this.dataset.points);
        addPoints(team, points);
      });
    });

    // ✅ Attach event listeners for fouls
    document.querySelectorAll(".add-foul").forEach(button => {
      button.addEventListener("click", function () {
        let team = this.dataset.team;
        addFoul(team);
      });
    });

    // ✅ Attach event listeners for timers and quarter functions
    document.getElementById("startQuarterTimerBtn")?.addEventListener("click", startQuarterTimer);
    document.getElementById("stopQuarterTimerBtn")?.addEventListener("click", stopQuarterTimer);
    document.getElementById("resetQuarterTimerBtn")?.addEventListener("click", resetQuarterTimer);
    document.getElementById("nextQuarterBtn")?.addEventListener("click", nextQuarter);
    document.getElementById("resetQuarterBtn")?.addEventListener("click", resetQuarter);
    document.getElementById("startShotClockBtn")?.addEventListener("click", startShotClock);
    document.getElementById("stopShotClockBtn")?.addEventListener("click", stopShotClock);
    document.getElementById("resetShotClockBtn")?.addEventListener("click", resetShotClock);

  });


  document.getElementById("save_button").addEventListener("click", function (event) {
    event.preventDefault(); // Prevents form submission

    const team1Field = document.getElementById("teamAName");
    const team2Field = document.getElementById("teamBName");
    const score1Field = document.getElementById("h_teamAScore");
    const score2Field = document.getElementById("h_teamBScore");

    if (!team1Field || !team2Field || !score1Field || !score2Field) {
      console.error("One or more elements are missing.");
      return;
    }

    const team1 = encodeURIComponent(team1Field.value.trim());
    const team2 = encodeURIComponent(team2Field.value.trim());
    const score1 = encodeURIComponent(score1Field.value.trim());
    const score2 = encodeURIComponent(score2Field.value.trim());

    if (!team1 || !team2 || !score1 || !score2) {
      alert("Please fill in all fields before saving.");
      return;
    }

    let formData = new URLSearchParams();
    formData.append("teamA", team1);
    formData.append("teamB", team2);
    formData.append("score1", score1);
    formData.append("score2", score2);
    console.log("Sending Data:");
    for (let pair of formData.entries()) {
      console.log(pair[0] + ": " + pair[1]);
    }
    let testData = {
      teamA: "Lakers",
      teamB: "Celtics",
      score1: "100",
      score2: "98"
    };
    console.log("Test JSON:", JSON.stringify(testData, null, 2));

    fetch("http://localhost:8080/SimpleWebApp_war_exploded/ProcessGameServlet", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"  // ✅ Fix this
      },
      body: formData
    }).then(response => {
      if (response.redirected) {
        window.location.href = response.url; // ✅ Follows redirect to displayMatches.jsp
      } else {
        return response.json();
      }
    }).then(data => {
      if (data.status === "error") {
        alert("Error: " + data.message);
      }
    }).catch(error => console.error("Error:", error));
  })
</script>
</body>
</html>