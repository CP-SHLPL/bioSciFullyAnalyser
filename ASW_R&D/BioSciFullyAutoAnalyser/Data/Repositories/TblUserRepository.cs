using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Data.Contexts;
using Data.Entities;
using Data.Interfaces;

namespace Data.Repositories
{
    internal class TblUserRepository : ITblUserRepository
    {
        private readonly DatabaseContext _context;

        public TblUserRepository(DatabaseContext context)
        {
            _context = context;
        }

        public async Task AddAsync(TblUser user)
        {
            if (user == null) throw new ArgumentNullException(nameof(user));
            await _context.TblUsers.AddAsync(user);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var entity = await _context.TblUsers.FindAsync(id);
            if (entity == null) return;
            _context.TblUsers.Remove(entity);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<string>> GetAllUsernamesAsync()
        {
            return await _context.TblUsers.Select(row => row.Username).AsNoTracking().ToListAsync();
        }

        /// <summary>
        /// Get User by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<TblUser> GetByIdAsync(int id)
        {
            return await _context.TblUsers.FindAsync(id);
        }

        /// <summary>
        /// Get User by username
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public async Task<TblUser> GetByUsernameAsync(string username)
        {
            return await _context.TblUsers.AsNoTracking()
                .FirstOrDefaultAsync(u => u.Username == username);
        }

        public async Task UpdateAsync(TblUser user)
        {
            if (user == null) throw new ArgumentNullException(nameof(user));
            _context.TblUsers.Update(user);
            await _context.SaveChangesAsync();
        }

        public TblUser AttemptLogin(string username, string password)
        {
            var user = _context.TblUsers.AsNoTracking()
                .FirstOrDefault(u => u.Username == username && u.Password == password);
            return user;
        }
    }
}