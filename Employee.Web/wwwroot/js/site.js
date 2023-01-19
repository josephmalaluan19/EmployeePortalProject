// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function LoginUser() {
    $.ajax({
        type: 'POST',
        url: 'https://localhost:7256/api/Employee/Login?userName=string&password=string',
        success: function (data) {
            localStorage.setItem('token',data.token)
            document.location='/Dashboard'
        }
    });
}

function EditEmployee(id) {
    $('#updateModal').modal('show');

    $.ajax({
        type: 'GET',
        url: 'https://localhost:7256/api/Employee/GetEmployee?id=' + id,
        "headers": {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer " + localStorage.getItem('token'),
        },
        success: function (data) {
            $('#employeeId').val(data.data.result.employeeId)
            $('#firstName').val(data.data.result.firstName)
            $('#lastName').val(data.data.result.lastName)
            $('#userName').val(data.data.result.userName)


        }
    });
}

function AddNewUser() {
    $('#myModal').modal('show');
}

function SaveNewUser() {

}

function SaveUserUpdate() {
    $.ajax({
        type: 'POST',
        url: 'https://localhost:7256/api/Employee/UpdateEmployee',
        "headers": {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer " + localStorage.getItem('token'),
        },
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: {
            employeeId: $('#employeeId').val(),
            firstName: $('#firstName').val(),
            lastName: $('#lastName').val(),
            userName: $('#userName').val(),
        },
        success: function () {
            document.location = '/Dashboard'
        }
    });

}

$(document).ready(function () {
    $('#example').DataTable({
        processing: true,
        serverSide: true,
        ajax: 'https://localhost:7256/api/Employee/GetEmployees',
        dataSrc: function (json) {
            return json.employees.result;
        },
        columns: [
            { data: 'firstName' },
            { data: 'lastName' },

            {
                data: 'EmployeeId',
            render: function (datum, type, row) {
                return '<button class="btn btn-secondary" onclick="EditEmployee(' + row.employeeId + ')">Update</button> ' + ' <button class="btn btn-secondary" onclick="EditEmployee(' + row.employeeId + ')">Delete</button>';
                }
            }
        ],
    });
});

