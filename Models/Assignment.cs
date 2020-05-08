using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalRApp.Models
{
    public class Assignment
    {
        public enum AssignmentStatus
        {
            Closed,
            Open,
            Paused
        }
        
        public int Id { get; set; }
        public AssignmentStatus Status { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
    }
}