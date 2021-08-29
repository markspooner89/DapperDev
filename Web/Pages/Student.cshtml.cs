using Domain.Models;
using Domain.Services.Interfaces;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Web.Pages
{
    public class StudentModel : PageModel
    {
        private readonly IStudentService _studentService;

        public StudentModel(IStudentService studentService)
        {
            _studentService = studentService;
        }

        public Student Student { get; set; }

        public void OnGet()
        {
            var successfulParse = int.TryParse(Request.Query["id"], out var id);

            if (successfulParse)
            {
                Student = _studentService.GetStudent(id);
            }
        }
    }
}
