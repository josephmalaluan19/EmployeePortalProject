using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeEstimateDatabaseAccess.Interface
{
    public interface IGenericRepository<T> where T : class
    {
          Task<int> AddAsync(T entity);
    }
}
