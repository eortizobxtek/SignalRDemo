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
                </tr>
            </tfoot>
        </table>
    </div>

     <input id="text1" type="text" />

    <input id="button1" type="button" value="Send" />

    <ul id="discussion">

    </ul>

    <script src="Scripts/jquery.signalR-2.4.1.min.js"></script>
    <script src="signalr/hubs"></script>
    <script>
        $(document).ready(function () {
            $("#assignment-tbl").DataTable({
                ajax: {
                    url: "/api/assignment",
                    dataSrc: ""
                },
                columns: [
                    {
                        data: "Id",                    
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
                ]

            });
        })
    </script>
    <script type="text/javascript">

        $(function () {

            // Declare a proxy to reference the hub.

            var notifications = $.connection.assignmentHub;

            // Create a function that the hub can call to broadcast messages.

            notifications.client.receiveNotification = function (message) {

                // alert(" says '" + message + "'");

                // Html encode display name and message.                

                var encodedMsg = $('<div />').text(message).html();

                // Add the message to the page.

                $('#discussion').append('<li>' + encodedMsg + '</li>');

            };

            // Start the connection.

            $.connection.hub.start().done(function () {

                $("#button1").click(function () {

                    notifications.server.sendNotifications($("#text1").val());

                }).fail(function (e) {

                    alert(e);

                });

            });

        });

    </script>


</asp:Content>
