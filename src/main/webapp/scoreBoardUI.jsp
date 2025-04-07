<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Responsive CSS Tabs</title>
  <style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,500;1,600;1,700;1,800&family=Oswald:wght@200;300;400;500;600;700&family=Roboto+Condensed:wght@300;400;700&family=Roboto:wght@100;300;400;500;700;900&family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&family=Spectral:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.typekit.net/ovt6ynt.css">
  </style>
  <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital@0;1&family=Playfair+Display+SC:wght@900&family=Playfair+Display:ital,wght@0,800;1,800&family=Manrope:wght@800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./style.css">
  <link rel="stylesheet" href="scoreboard.css">
  <script src="scoreboard.js"></script>
  <script src="form.js"></script>
  <style>
    .form__field {
      background-color: #fff;
      color: #1d1e22;
      padding: 10px;
      border: 1px solid #1d1e22;
      border-radius: 15px;
      box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
      outline: none;
    }
    .form__field:focus {
      border-color: #007BFF;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }
    #save-btn, #cancel-btn {
      background-color: #248847; /* Blue background */
      color: #fff;               /* White text */
      padding: 8px 10px;        /* Padding */
      border: none;              /* Remove default border */
      border-radius: 15px;       /* Rounded corners */
      cursor: pointer;           /* Pointer cursor on hover */
      font-size: 12px;
      text-shadow: 1px 1px 2px #0e3017;/* Font size */
      cursor: pointer;
      background-image: radial-gradient(circle, #04a156, #09696e);
    }
    /* Hover Effect */
    #save-btn:hover, #cancel-btn:hover {
      background-color: #0056b3; /* Darker blue on hover */
    }
    .tab-link {
      color: inherit;
      text-decoration: none;
      display: block;
      width: 100%;
      height: 100%;
    }

  </style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class = "wrapper pre">

</div>
<div class="wrapper">
  <div class="title">
    Scoreboard Pro
    <div class="line"></div>
  </div>
  <div class="container">
    <div class="card tabs">
      <input id="tab-1" type="radio" class="tab tab-selector" name="tab" />
      <label for="tab-1" class="tab tab-primary"><a class="tab-link" onclick="switchTab('tab-1')" >Home</a></label>
      <input id="tab-2" type="radio" class="tab tab-selector" name="tab" />
      <label for="tab-2" class="tab tab-success"><a class="tab-link" onclick="switchTab('tab-2')">Enter Teams</a></label>
      <input id="tab-3" type="radio" class="tab tab-selector" checked="checked" name="tab" />
      <label for="tab-3" class="tab tab-default"><a class="tab-link" onclick="switchTab('tab-3')" >Scoreboard</a></label>
      <input id="tab-4" type="radio" class="tab tab-selector" name="tab" />
      <label for="tab-4" class="tab tab-warning"><a class="tab-link" onclick="switchTab('tab-4')" > View History</a></label>
      <div class="tabsShadow"></div>
      <div class="glider"></div>

        <div class="item" id="content-3">
          <section class="content">
          <h2 class="tab-title tab-default" style="padding-bottom: 20px">Basketball Scoreboard</h2>
          <div id="scoreboard-table">
            <form action="scoreBoardUI.jsp" method="POST">
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
            <figure class="table">
              <table class="ck-table-resized">
                <colgroup>
                  <col style="width:28.65%;">
                  <col style="width:15.72%;">
                  <col style="width:6.36%;">
                  <col style="width:6.19%;">
                  <col style="width:14.64%;">
                  <col style="width:28.44%;">
                </colgroup>
                <tbody>

                <tr class="tr-title">
                  <td colspan="3">
                    HOME
                  </td>
                  <td colspan="3">
                    VISITOR
                  </td>
                </tr>
                <tr>
                  <td style="width:35%;">
                    <button type="button" class="add-point" data-team="A" data-points="1">+1</button>
                    <button type="button" class="add-point" data-team="A" data-points="2">+2</button>
                    <button type="button" class="add-point" data-team="A" data-points="3">+3</button>
                    <button type="button" class="add-point" data-team="A" data-points="-1">-1</button>
                  </td>
                  <td style="width:10%;">
                    <label class="team_name"> <input type="text" id="teamAName" name="teamA" value="<%=request.getParameter("teamA")%>"></label>
                  </td>
                  <td style="width:5%;" class="digit" >
                    <span class="score" id="teamAScore" style="font-size: 26px;text-align: center; color:blue;"><%=h1%></span>
                    <input type="hidden" name="h_teamAScore" value="<%=h1%>" id="h_teamAScore" />
                  </td>
                  <td style="width:5%;" class="digit">
                    <span class="score" id="teamBScore" style="font-size: 26px;text-align: center; color:blue;"><%=h2%></span>
                    <input type="hidden" name="h_teamBScore" value="<%=h2%>" id="h_teamBScore" />
                  </td>
                  <td style="width:10%;">
                    <label class="team_name"> <input type="text" id="teamBName" name="teamB" value="<%=request.getParameter("teamB")%>"></label>
                  </td>
                  <td style="width:35%;">
                    <button type="button" class="add-point" data-team="B" data-points="1">+1</button>
                    <button type="button" class="add-point" data-team="B" data-points="2">+2</button>
                    <button type="button" class="add-point" data-team="B" data-points="3">+3</button>
                    <button type="button" class="add-point" data-team="B" data-points="-1">-1</button>
                  </td>
                </tr>
                <tr>
                  <td><button type="button" class="add-foul" data-team="A">Add Foul</button></td>
                  <td><span id="teamAFouls">0</span></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td><span id="teamBFouls">0</span></td>
                  <td><button type="button" class="add-foul" data-team="B">Add Foul</button></td>
                </tr>
                <tr class="tr-title">
                  <td colspan="6">
                   QUARTER TIMER
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <button type="button" id="startQuarterTimerBtn">Start Timer</button>
                    <button type="button" id="stopQuarterTimerBtn">Stop Timer</button>
                    <button type="button" id="resetQuarterTimerBtn">Reset Timer</button>
                  </td>
                  <td colspan="2" class="digit">
                    <span >10:00</span>
                  </td>
                  <td colspan="2">
                    <button type="button" id="nextQuarterBtn">Next Quarter</button>
                    <button type="button" id="resetQuarterBtn">Reset Quarter</button>
                  </td>
                </tr>
                <tr class="tr-title">
                  <td colspan="6">
                    SHOT CLOCK
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <button type="button" id="startShotClockBtn">Start Shot Clock</button>
                    <button type="button" id="stopShotClockBtn">Stop Shot Clock</button>
                  </td>
                  <td class="digit">
                    <span>00</span>
                  </td>
                  <td class="digit">
                    <span>24</span>
                  </td>
                  <td colspan="2">
                    <button type="button" id="resetShotClockBtn">Reset Shot Clock</button>
                  </td>
                </tr>
                <tr class="tr-title">
                  <td colspan="6">
                    TIMEOUT
                  </td>
                </tr>
                <tr>
                  <td><button type="button" class="timeout-btn" data-team="A" data-seconds="30">30s</button>
                    <button type="button" class="timeout-btn" data-team="A" data-seconds="60">1min</button></td>
                  <td>
                    Home
                  </td>
                  <td class="digit">
                    <span id="teamATimeoutTimer">0</span>
                  </td>
                  <td class="digit">
                    <span id="teamBTimeoutTimer">0</span>
                  </td>
                  <td>Visitor
                  </td>
                  <td><button type="button" class="timeout-btn" data-team="B" data-seconds="30">30s</button>
                    <button type="button" class="timeout-btn" data-team="B" data-seconds="60">1min</button></td>
                </tr>
                 <tr>
                  <td colspan="6">
                    <input type="hidden" id="teamF" value="<%=request.getParameter("teamA")%>">
                    <input type="hidden" id="teamS" value="<%=request.getParameter("teamB")%>">
                    <input type="hidden" id="scoreF" value="<%=request.getParameter("h_teamAScore")%>">
                    <input type="hidden" id="scoreS" value="<%=request.getParameter("h_teamBScore")%>">
                    <input type="hidden" id="save_yes" value="1">
                    <button id="save_button" type="button">Save Score</button>
                  </td>
                </tr>
                </tbody>
              </table>
            </figure>
            </form>
          </div>
      </section><!--section content>-->
    </div> <!--content-3-->
  </div><!--card tabs-->
</div><!--class container-->
  <!-- partial -->
</div><!--wrapper-->
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
