using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpWebApp.Models
{
    public class Entity
    {
        public static void Invoke(Microsoft.AspNet.EntityDataSource.EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new ExampleDBEntities();
            e.Context = (db as IObjectContextAdapter).ObjectContext;
        }
    }
}
