using EmployeeEstimateModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using EmployeeEstimateBussinessLogic.Employees;
namespace EmployeeTaskEstimateProject.Controllers
{


    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        public EmployeeController(IConfiguration configuration)
        {
            this._configuration = configuration;
        }

        [HttpPost]
        [Route("InsertEmployee")]
        public ActionResult InsertNewEmployeeTaskEstimate(EmployeeModel EmployeeModel)
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var InsertedEmployee= EmployeeManager.InsertNewEmployeeEstimate(_configuration, EmployeeModel);
            return Ok(new
            {
                success = true,
                data = InsertedEmployee
            });

        }

        [HttpPost]
        [Route("Login")]
        public ActionResult Login(string userName,string password)
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var AuthUser = EmployeeManager.Auth(_configuration,userName,password);
            return Ok(new
            {
                success = true,
                data = AuthUser
            });

        }

        [HttpGet]
        [Route("GetEmployees")]
        public ActionResult GetEmployees()
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var Employees = EmployeeManager.GetAllEmployees(_configuration);
            return Ok(new
            {
                success = true,
                Data = Employees.Result
            });

        }

        [HttpGet]
        [Route("GetEmployee")]
        public ActionResult GetEmployee(int id)
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var Employee = EmployeeManager.GetEmployee(_configuration,id);
            return Ok(new
            {
                success = true,
                Data = Employee
            });

        }

        [HttpPost]
        [Route("UpdateEmployee")]
        public ActionResult UpdateEmployee(EmployeeModel EmployeeModel)
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var Employee = EmployeeManager.UpdateEmployee(_configuration, EmployeeModel);
            return Ok(new
            {
                success = true,
                Data = Employee
            });

        }


        [HttpPost]
        [Route("InsertEmployee")]
        public ActionResult InsertEmployee(EmployeeModel EmployeeModel)
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var Employee = EmployeeManager.InsertEmployee(_configuration, EmployeeModel);
            return Ok(new
            {
                success = true,
                Data = Employee
            });

        }
    }
}
