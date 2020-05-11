using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace SignalRDemo.SignalRConnections
{
    public class AssignmentHub : Hub
    {
        //[HubMethodName("Send")]

        public void Send(string name, string message)

        {

            Clients.All.broadcastMessage(name, message);

        }



        // [HubMethodName("SendNotifications")]

        public void SendNotifications(string message)

        {

            Clients.All.receiveNotification(message);

        }
    }
}