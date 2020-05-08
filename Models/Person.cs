using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SignalRApp.Models
{
    interface Person
    {
        string FirstName
        {
            set;
            get;
        }
        string LastName
        {
            set;
            get;
        }

    }
}
