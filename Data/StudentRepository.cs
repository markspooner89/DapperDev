using Dapper;
using Domain.Models;
using Domain.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Data
{
    public class StudentRepository : IStudentRepository
    {
        private readonly string _connectionString = @"Data Source=MARK-LAPTOP\SQLEXPRESS;Initial Catalog=DapperDb;Integrated Security=True";
        public Student GetStudent(int id)
        {
            var studentDictionary = new Dictionary<int, Student>();

            Student mapping(Student student, StudentEmail email, Grade grade)
            {
                if (!studentDictionary.TryGetValue(student.Id, out Student studentEntry))
                {
                    studentEntry = student;
                    studentEntry.EmailAddresses = new List<StudentEmail>();
                    studentDictionary.Add(student.Id, student);
                }

                if (email != null)
                {
                    studentEntry.EmailAddresses.Add(email);
                }

                studentEntry.Grade = grade;

                return studentEntry;
            }

            using var sqlConnection = new SqlConnection(_connectionString);
            var students = sqlConnection.Query(
                sql: "usp_GetStudentById",
                commandType: CommandType.StoredProcedure,
                param: new { Id = id },
                map: (Func<Student, StudentEmail, Grade, Student>)mapping
            );

            return students.FirstOrDefault();
        }

        public IEnumerable<Student> GetStudents()
        {
            static Student map(Student student, Grade grade)
            {
                student.Grade = grade;
                return student;
            }

            using var sqlConnection = new SqlConnection(_connectionString);
            var students = sqlConnection.Query(
                sql: "usp_GetStudents",
                commandType: CommandType.StoredProcedure,
                map: (Func<Student, Grade, Student>)map
            );

            return students;
        }
    }
}
