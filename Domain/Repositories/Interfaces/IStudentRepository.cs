using Domain.Models;
using System.Collections.Generic;

namespace Domain.Repositories.Interfaces
{
    public interface IStudentRepository
    {
        IEnumerable<Student> GetStudents();
        Student GetStudent(int id);
    }
}
