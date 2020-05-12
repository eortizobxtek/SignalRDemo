<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SignalRDemo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="margin-top: 3em;">
        <table id="assignment-tbl" class="table table-bordered" >
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Assignment Status</th>
                    <th>Description</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Assignment Status</th>
                    <th>Description</th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
    </div>
    
    <script src="Scripts/jquery.signalR-2.4.1.min.js"></script>
    <script src="signalr/hubs"></script>
    <script>
        $(document).ready(function () {
          var assignmentTable =   $("#assignment-tbl").DataTable({
                ajax: {
                    url: "/api/assignment",
                    dataSrc: ""
                },
                columns: [
                    {
                        data: "Id", 
                        createdCell:  function (td, cellData, rowData, row, col) {
                                             $(td).attr("id", rowData.Id)
                                            
                        }                  
                    },
                    {
                        data: "Title",
                    },
                    {
                        data: "Status",
                    },
                    {
                        data: "Description",
                    },
                    {
                        data: null,
                        render: function(data, type, row) {
                            return '<button type="button" class="btn btn-primary status-toggle">Toggle Status</button>';
                        }
                    },
                ]

            });
                     
                // hub reference
        
                var notifications = $.connection.assignmentHub;
        

        
                // connection start for hub
        
                $.connection.hub.start().done(function () {
        
                    $(".status-toggle").click(function () {
                        var button = $(this);
                        var status = button.closest("tr").find('td').eq(2).html();
                        var id = button.closest("tr").find('td').eq(0).html();
                        var newStatus = Math.abs(parseInt(status) % 2 - 1);
                        
                         var putData = {
                                "Status": newStatus,
                                "Title" : "Updated Title",
                                "Description" : "This assignment was changed with Web API put method"                      
                         }
                         putData = JSON.stringify(putData);
                        $.ajax({
                            url: '/api/assignment/UpdateAssignment?id=' + id,
                            contentType: "application/json",
                            dataType: "json",
                            type: 'PUT',   
                            data: putData,
                            success: function (result) {
                                console.log("Status of asssignment id " + id + " changed." )
                                notifications.server.sendNotifications(id); 
                            }
                        })
        
                    });
        
                });
            
        })
    </script>
    <script type="text/javascript">
                        // receive hub broadcasts
                        var notifications = $.connection.assignmentHub;
                        notifications.client.receiveNotification = function (message) {
                            alert("Status of assignment id  " + message + " changed");
                            var status = $("#"+message).closest("tr").find('td').eq(2).html();
                            var newStatus = Math.abs(parseInt(status) % 2 - 1);
                            $("#"+message).closest("tr").find('td').eq(2).html(newStatus);                            
                        };
    </script>


</asp:Content>
