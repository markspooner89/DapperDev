using Domain.Models;
using Domain.Repositories.Interfaces;
using Domain.Services.Interfaces;
using System.Collections.Generic;

namespace Domain.Services
{
    public class StudentService : IStudentService
    {
        private readonly IStudentRepository _studentRepository;

        public StudentService(IStudentRepository studentRepository)
        {
            _studentRepository = studentRepository;
        }

        public Student GetStudent(int id)
        {
            return _studentRepository.GetStudent(id);
        }

        public IEnumerable<Student> GetStudents()
        {
            return _studentRepository.GetStudents();
        }
    }
}
