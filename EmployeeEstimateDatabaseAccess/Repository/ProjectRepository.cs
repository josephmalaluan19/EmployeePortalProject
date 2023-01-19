using Dapper;
using EmployeeEstimateDatabaseAccess.Interface;
using EmployeeEstimateModel;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateDatabaseAccess.Repository
{
    public class ProjectRepository:IProject
    {
        private readonly IConfiguration configuration;
        public ProjectRepository(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public async Task<int> AddAsync(ProjectModel ProjectModel)
        {
            var sql = "Insert into tblProject (ProjectName,ProjectDescription) Values (@ProjectName,@ProjectDescription) ";
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(sql, ProjectModel);
                return result;
            }
        }

        public async Task<int> LoginAsync(ProjectModel ProjectModel)
        {
            var sql = "Insert into tblProject (ProjectName,ProjectDescription) Values (@ProjectName,@ProjectDescription) ";
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(sql, ProjectModel);
                return result;
            }
        }
    }
}
