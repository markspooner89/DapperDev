using Domain.Models;
using Domain.Services.Interfaces;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;

namespace Web.Pages
{
    public class IndexModel : PageModel
    {
        private readonly IStudentService _studentService;

        public IndexModel(IStudentService studentService)
        {
            _studentService = studentService;
        }

        public IEnumerable<Student> Students { get; set; }

        public void OnGet()
        {
            Students = _studentService.GetStudents();
        }
    }
}
