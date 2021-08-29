using System;
using System.Collections.Generic;

namespace Domain.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string Forename { get; set; }
        public string Surname { get; set; }
        public DateTime DateOfBirth { get; set; }
        public Grade Grade { get; set; }
        public List<StudentEmail> EmailAddresses { get; set; }
    }
}
