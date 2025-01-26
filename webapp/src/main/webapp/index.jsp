<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Web Page with Tabs and Form</title>
    <style>
        /* Tab Styling */
        .tabs {
            display: flex;
            justify-content: flex-start;
            background-color: #444;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px 5px 0 0;
        }
        .tab {
            padding: 12px 20px;
            margin-right: 5px;
            background-color: #555;
            color: white;
            cursor: pointer;
            border-radius: 5px 5px 0 0;
        }
        .tab:hover {
            background-color: #888;
        }
        .tab.active {
            background-color: #007bff;
        }
        .tab-content {
            display: none;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 0 0 5px 5px;
        }
        .tab-content.active {
            display: block;
        }

        /* Form Styling */
        .form-section {
            background-color: #e9ecef;
            padding: 20px;
            border-radius: 5px;
            margin-top: 10px;
        }
        .form-section input, .form-section textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Table Styling */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }

        /* Button Styling */
        .btn {
            padding: 12px 18px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #218838;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .tabs {
                flex-direction: column;
            }
            .tab {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Interactive Web Page with Tabs, Form, and Table</h1>
    
    <div class="tabs">
        <div class="tab active" onclick="openTab(event, 'home')">Home</div>
        <div class="tab" onclick="openTab(event, 'about')">About</div>
        <div class="tab" onclick="openTab(event, 'form')">Form</div>
        <div class="tab" onclick="openTab(event, 'data')">Data</div>
    </div>

    <!-- Home Tab Content -->
    <div id="home" class="tab-content active">
        <h2>Welcome to Our Website</h2>
        <p>This is a dynamic web page with several interactive sections, including a form and a data table. You can explore the other tabs to see various features!</p>
    </div>

    <!-- About Tab Content -->
    <div id="about" class="tab-content">
        <h2>About Us</h2>
        <p>We are a passionate team dedicated to providing high-quality web services and products to our clients. Our expertise spans web development, marketing, and more.</p>
    </div>

    <!-- Form Tab Content -->
    <div id="form" class="tab-content">
        <h2>Submit Your Details</h2>
        <div class="form-section">
            <form id="myForm">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4" required></textarea>
                
                <button type="submit" class="btn">Submit</button>
            </form>
            <div id="formResponse"></div>
        </div>
    </div>

    <!-- Data Tab Content -->
    <div id="data" class="tab-content">
        <h2>Interactive Data Table</h2>
        <table id="dataTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamic Rows will be added here -->
            </tbody>
        </table>
    </div>

</div>

<script>
    // Function to switch between tabs
    function openTab(evt, tabName) {
        let tabContents = document.querySelectorAll('.tab-content');
        tabContents.forEach(function(content) {
            content.classList.remove('active');
        });

        let tabs = document.querySelectorAll('.tab');
        tabs.forEach(function(tab) {
            tab.classList.remove('active');
        });

        document.getElementById(tabName).classList.add('active');
        evt.currentTarget.classList.add('active');
    }

    // Form submission handler
    document.getElementById('myForm').addEventListener('submit', function(e) {
        e.preventDefault(); // Prevent the default form submission

        // Get form values
        let name = document.getElementById('name').value;
        let email = document.getElementById('email').value;
        let message = document.getElementById('message').value;

        // Show success message
        document.getElementById('formResponse').innerHTML = `
            <p><strong>Thank you, ${name}!</strong> Your message has been submitted successfully.</p>
        `;

        // Add form data to the table
        let table = document.getElementById('dataTable').getElementsByTagName('tbody')[0];
        let newRow = table.insertRow();
        newRow.insertCell(0).innerHTML = table.rows.length;
        newRow.insertCell(1).innerHTML = name;
        newRow.insertCell(2).innerHTML = email;
        newRow.insertCell(3).innerHTML = message;

        // Reset form fields
        document.getElementById('myForm').reset();
    });
</script>

</body>
</html>
