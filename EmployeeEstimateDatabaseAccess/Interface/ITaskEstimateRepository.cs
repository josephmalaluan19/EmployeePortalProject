using EmployeeEstimateModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateDatabaseAccess.Interface
{
    internal interface ITaskEstimateRepository
    {
        Task<IEnumerable<TasksEstimateModel>> GetAllEmployeesActualTimeMoreThanEstimatedTime();
        Task<IEnumerable<TasksEstimateModel>> GetAllEmployeesActualTimeLessThanEstimatedTime();
        Task<int> InsertNewEmployeeEstimate(EmployeeTaskModel EmployeeTaskModel);
    }
}
