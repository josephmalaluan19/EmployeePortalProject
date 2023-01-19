using EmployeeEstimateModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateDatabaseAccess.Interface
{
    internal interface IEmployee: IGenericRepository<EmployeeModel>
    {
        Task<int> AddAsync(EmployeeModel EmployeeModel);
    }
}
