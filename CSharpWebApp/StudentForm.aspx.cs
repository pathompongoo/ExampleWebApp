using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSharpWebApp
{
    public partial class StudentForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Cite reference: http://blogs.msdn.com/b/webdev/archive/2012/09/13/how-to-use-the-entitydatasource-control-with-entity-framework-code-first.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void EntityDataSource1_ContextCreating(object sender, Microsoft.AspNet.EntityDataSource.EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new Models.ExampleDBEntities();
            e.Context = (db as IObjectContextAdapter).ObjectContext;
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            using (var db = new Models.ExampleDBEntities())
            {
                using (var trans = db.Database.BeginTransaction())
                {
                    try
                    {
                        int titleId = Convert.ToInt32(TitleDropDownList.SelectedValue);
                        int genderId = Convert.ToInt32(GenderDropDownList.SelectedValue);

                        Models.Student student = new Models.Student();
                        student.FirstName = new Models.Name { TH = FirstNameTHTextBox.Text, EN = FirstNameENTextBox.Text };
                        student.LastName = new Models.Name { TH = LastNameTHTextBox.Text, EN = LastNameENTextBox.Text };
                        student.Title = db.Titles.Where(m => m.Id == titleId).FirstOrDefault();
                        student.Gender = db.GenderSet.Where(m => m.Id == genderId).FirstOrDefault();
                        student.Age = Convert.ToInt16(AgeTextBox.Text);
                        student.GPA = Convert.ToSingle(GPATextBox.Text);
                        student.UpdatedDate = DateTime.Now;

                        db.People.Add(student);
                        
                        db.SaveChanges();
                        trans.Commit();
                        Response.Redirect("StudentGridForm.aspx");
                    }
                    catch (Exception ex)
                    {
                        trans.Rollback();
                        Response.Write(ex.Message);
                    }
                }
            }

        }
    }
}