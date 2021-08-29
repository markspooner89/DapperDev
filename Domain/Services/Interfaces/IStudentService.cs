using Domain.Models;
using System.Collections.Generic;

namespace Domain.Services.Interfaces
{
    public interface IStudentService
    {
        Student GetStudent(int id);
        IEnumerable<Student> GetStudents();
    }
}
