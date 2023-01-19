using EmployeeEstimateBussinessLogic.Projects;
using EmployeeEstimateModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeTaskEstimateProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public AuthController(IConfiguration configuration)
        {
            this._configuration = configuration;
        }

        [HttpPost]
        [Route("Login")]
        public ActionResult Login(ProjectModel ProjectModel)
        {
            ProjectManager ProjectManager = new ProjectManager();
            var InsertedProject = ProjectManager.InsertNewProject(_configuration, ProjectModel);
            return Ok(new
            {
                success = true,
                data = InsertedProject
            });

        }
    }
}
