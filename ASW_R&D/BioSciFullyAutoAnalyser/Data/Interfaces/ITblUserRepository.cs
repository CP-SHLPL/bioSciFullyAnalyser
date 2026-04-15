using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Entities;

namespace Data.Interfaces
{
    public interface ITblUserRepository
    {
        Task<TblUser> GetByIdAsync(int id);
        Task<TblUser> GetByUsernameAsync(string username);
        Task<IEnumerable<string>> GetAllUsernamesAsync();
        Task AddAsync(TblUser user);
        Task UpdateAsync(TblUser user);
        Task DeleteAsync(int id);
        TblUser AttemptLogin(string username, string password);
    }
}