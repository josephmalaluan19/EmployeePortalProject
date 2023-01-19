using EmployeeEstimateModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using EmployeeEstimateBussinessLogic.Employees;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authorization;

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
        [Route("Login")]
        public ActionResult Login(string userName,string password)
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var AuthUser = EmployeeManager.Auth(_configuration,userName,password);

            if (AuthUser != null)
            {
                var authClaims = new List<Claim>{
                    new Claim(ClaimTypes.Name, userName),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                };
                var token = GetToken(authClaims);
                return Ok(new
                {
                    success = true,
                    token = new JwtSecurityTokenHandler().WriteToken(token),
                    expiration = token.ValidTo
                });
            }
            return Ok(new
            {
                success = false,
            });

        }

        [HttpPost]
        [Route("InsertEmployee")]
        public ActionResult InsertNewEmployeeTaskEstimate(EmployeeModel EmployeeModel)
        {
            EmployeeManager EmployeeManager = new EmployeeManager();
            var InsertedEmployee = EmployeeManager.InsertNewEmployeeEstimate(_configuration, EmployeeModel);
            return Ok(new
            {
                success = true,
                data = InsertedEmployee
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

        [Authorize]
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
        [Authorize]
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

        [Authorize]
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

        private JwtSecurityToken GetToken(List<Claim> authClaims)
        {
            var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]));

            var token = new JwtSecurityToken(
                issuer: _configuration["JWT:ValidIssuer"],
                audience: _configuration["JWT:ValidAudience"],
                expires: DateTime.Now.AddHours(3),
                claims: authClaims,
                signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
                );

            return token;
        }
    }
}
