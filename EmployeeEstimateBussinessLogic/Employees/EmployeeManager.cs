using EmployeeEstimateBussinessLogic.General;
using EmployeeEstimateDatabaseAccess.Repository;
using EmployeeEstimateModel;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateBussinessLogic.Employees
{
    public  class EmployeeManager
    {
        public async Task<int> InsertNewEmployeeEstimate(IConfiguration config, EmployeeModel EmployeeModel)
        {
            EmployeeModel.Password = Encryption.Encrypt(EmployeeModel.Password);
            EmployeeRepository EmployeeRepository = new EmployeeEstimateDatabaseAccess.Repository.EmployeeRepository(config);
            return await EmployeeRepository.AddAsync(EmployeeModel);
        }

        public async Task<List<EmployeeModel>> Auth(IConfiguration config, string userName,string password)
        {
            password = Encryption.Encrypt(password);
            EmployeeRepository EmployeeRepository = new EmployeeEstimateDatabaseAccess.Repository.EmployeeRepository(config);
            Auth Auth = new Auth();
            Auth.UserName = userName;
            Auth.Password = password;
            return await EmployeeRepository.GetAuthAsync(Auth);
        }

        public async Task<List<EmployeeModel>> GetAllEmployees(IConfiguration config)
        {
            EmployeeRepository EmployeeRepository = new EmployeeEstimateDatabaseAccess.Repository.EmployeeRepository(config);
            return await EmployeeRepository.GetAllEmployees();
        }

        public async Task<EmployeeModel> GetEmployee(IConfiguration config,int id)
        {
            EmployeeRepository EmployeeRepository = new EmployeeEstimateDatabaseAccess.Repository.EmployeeRepository(config);
            return await EmployeeRepository.GetEmployee(id);
        }

        public async Task<EmployeeModel> UpdateEmployee(IConfiguration config, EmployeeModel EmployeeModel)
        {
            EmployeeRepository EmployeeRepository = new EmployeeEstimateDatabaseAccess.Repository.EmployeeRepository(config);
            return await EmployeeRepository.UpdateEmployee(EmployeeModel);
        }

        public async Task<EmployeeModel> InsertEmployee(IConfiguration config, EmployeeModel EmployeeModel)
        {
            EmployeeRepository EmployeeRepository = new EmployeeEstimateDatabaseAccess.Repository.EmployeeRepository(config);
            return await EmployeeRepository.InsertEmployee(EmployeeModel);
        }


    }
}
