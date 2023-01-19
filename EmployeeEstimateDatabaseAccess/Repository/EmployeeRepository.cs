using EmployeeEstimateModel;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using EmployeeEstimateDatabaseAccess.Interface;

namespace EmployeeEstimateDatabaseAccess.Repository
{

    public  class EmployeeRepository:IEmployee
    {
        private readonly IConfiguration configuration;
        public EmployeeRepository(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public async Task<int>  AddAsync(EmployeeModel EmployeeModel)
        {
            var sql = "Insert into tblEmployee (FirstName,LastName,UserName,Password) Values (@FirstName,@LastName, @UserName, @Password) ";
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(sql, EmployeeModel);
                return result;
            }
        }

        public async Task<List<EmployeeModel>> GetAuthAsync(Auth Auth)
        {
            EmployeeModel EmployeeModel = new EmployeeModel();
            var sql = "[Login]"; ;
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters dynamicP = new DynamicParameters();
                dynamicP.Add("@UserName", Auth.UserName);
                dynamicP.Add("@Password",Auth.Password);
                var result = await connection.QueryAsync<EmployeeModel>(sql, dynamicP,commandType:System.Data.CommandType.StoredProcedure);
                return result.ToList();
            }
        }

        public async Task<List<EmployeeModel>> GetAllEmployees()
        {
            EmployeeModel EmployeeModel = new EmployeeModel();
            var sql = "[Get_Employees]"; ;
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters dynamicP = new DynamicParameters();
                var result = await connection.QueryAsync<EmployeeModel>(sql, dynamicP, commandType: System.Data.CommandType.StoredProcedure);
                return result.ToList();
            }
        }

        public async Task<EmployeeModel> GetEmployee(int id)
        {
            EmployeeModel EmployeeModel = new EmployeeModel();
            var sql = "[Get_Employee_ById]"; ;
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters dynamicP = new DynamicParameters();
                dynamicP.Add("@id", id);
                var result = await connection.QueryFirstAsync<EmployeeModel>(sql, dynamicP, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<EmployeeModel> UpdateEmployee(EmployeeModel EmployeeModel)
        {
            var sql = "[Update_Employee_ById]"; ;
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters dynamicP = new DynamicParameters();
                dynamicP.Add("@id", EmployeeModel.EmployeeId);
                dynamicP.Add("@firstName", EmployeeModel.FirstName);
                dynamicP.Add("@lastName", EmployeeModel.LastName);
                dynamicP.Add("@userName", EmployeeModel.UserName);

                var result = await connection.QueryFirstAsync<EmployeeModel>(sql, dynamicP, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<EmployeeModel> InsertEmployee(EmployeeModel EmployeeModel)
        {
            var sql = "[Insert_New_Employee]"; ;
            using (var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                DynamicParameters dynamicP = new DynamicParameters();
                dynamicP.Add("@firstName", EmployeeModel.FirstName);
                dynamicP.Add("@lastName", EmployeeModel.LastName);
                dynamicP.Add("@userName", EmployeeModel.UserName);

                var result = await connection.QueryFirstAsync<EmployeeModel>(sql, dynamicP, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }


    }
}
