using EmployeeEstimateModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateDatabaseAccess.Interface
{
    public  interface IProject: IGenericRepository<ProjectModel>
    {
        Task<int> AddAsync(ProjectModel ProjectModel);
    }
}
