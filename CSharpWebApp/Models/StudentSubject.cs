//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CSharpWebApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class StudentSubject
    {
        public int Id { get; set; }
        public float Grade { get; set; }
        public System.DateTime UpdatedDate { get; set; }
    
        public virtual Student Student { get; set; }
        public virtual Subject Subject { get; set; }
    }
}
