using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace CSharpWebApp
{
    using Models;

    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            using (var context = new ExampleDBEntities())
            {
                using (var contextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        if (!context.Logins.Any(m => m.Username.Equals("admin")))
                        {
                            context.Logins.Add(new Login {
                                Username = "admin",
                                Password = "1234",
                                UpdatedDate = DateTime.Now
                            });
                            context.SaveChanges();
                            contextTransaction.Commit();
                        }
                    }
                    catch (Exception)
                    {
                        contextTransaction.Rollback();
                    }
                }
            }
        }

        
    }
}