using EmployeeEstimateDatabaseAccess.Repository;
using EmployeeEstimateModel;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateBussinessLogic.Projects
{
    public class ProjectManager
    {
        public async Task<int> InsertNewProject(IConfiguration config, ProjectModel ProjectModel)
        {
           
            ProjectRepository ProjectRepository = new EmployeeEstimateDatabaseAccess.Repository.ProjectRepository(config);
            return await ProjectRepository.AddAsync(ProjectModel);
        }
    }
}
