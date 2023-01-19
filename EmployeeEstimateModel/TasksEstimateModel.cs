using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateModel
{
    public  class TasksEstimateModel
    {
        public int TaskEstimateID { get; set; }
        public string TaskName { get; set; }
        public string ProjectName { get; set; }
        public int EmployeeEstimate { get; set; }

        public string FullName { get; set; }
        public int ActualHours { get; set; }
    }
}
