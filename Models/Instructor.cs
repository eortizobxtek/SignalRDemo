using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalRApp.Models
{
    public class Instructor : Person
    {

        private string _firstName;
        private string _lastName;
        public int Id;
        public string FirstName { get => _firstName; set => _firstName = value;}
        public string LastName { get => _lastName; set => _lastName = value; }
        public virtual ICollection<Assignment> Assignments { get; set; }
       
    }
}