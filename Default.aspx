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


</asp:Content>
