using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalRApp.Models
{
    public class Student : Person
    {
        public int Id;
        private string _firstName;
        private string _lastName;

        public string FirstName { get => _firstName; set => _firstName = value;}
        public string LastName { get => _lastName; set => _lastName = value; }

    }
}