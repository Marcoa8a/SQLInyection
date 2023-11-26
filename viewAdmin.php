<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MAEK BANK Admin</title>
    <link rel="stylesheet" href="css/styles2.css">
</head>

<body>

    <div>
        <nav id="navbar">
            <div id="logo-container">
                <img id="logo" src="images/logo bank.png" alt="Logo ">
                <span id="logo-text">MAEK Bank</span>
            </div>
            <div id="menu">
                <ul>
                    <li><a href="#" onclick="showTable('Account')">Account</a></li>
                    <li><a href="#" onclick="showTable('Branch')">Branch</a></li>
                    <li><a href="#" onclick="showTable('Client')">Client</a></li>
                    <li><a href="#" onclick="showTable('User')">User</a></li>
                    <li><a href="login.php">Logout</a></li>
                </ul>
            </div>
        </nav>
    </div>

    <div id="table-container">
        <!-- La tabla se mostrará aquí -->
    </div>

    <script src="ajax.js"></script>


    <script>
        function showTable(option) {
            var tableContainer = document.getElementById("table-container");
            var tableHTML = "<table border='1'><tr>";

            if (option === 'Account') {
                tableHTML += "<th>AccountId</th><th>noAccountId</th><th>TransactionType</th><th>TransactionDate</th><th>Balance</th><th>BranchId</th>";
            } else if (option === 'Branch') {
                tableHTML += "<th>BranchId</th><th>RFC</th><th>Name</th><th>Location</th><th>Phone</th><th>ManagerName</th>";
            } else if (option === 'Client') {
                tableHTML += "<th>ClientId</th><th>Name</th><th>Phone</th><th>AccountId</th>"; 
            } else if (option === 'User') {
                tableHTML += "<th>UserId</th><th>Email</th><th>Password</th><th>Rol</th><th>ClientId</th>";
            }

            tableHTML += "</tr><tr><td></td><td></td><td></td><td></td></tr></table>";

            tableContainer.innerHTML = tableHTML;
            fetchData(option, tableContainer);
        }
    </script>
</body>
</html>