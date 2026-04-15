using Data.Contexts;
using Data.Entities;
using Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Repositories
{
    internal class TblDictionaryValuesRepository : ITblDictionaryValues
    {

        private readonly DatabaseContext _context;

        public TblDictionaryValuesRepository(DatabaseContext context)
        {
            _context = context;
        }

        public string GetDictionaryValue(int idDictionaryKey, int idDictionaryValue)
        {
            // Implementation here
            return string.Empty;
        }

        public List<string> GetDictionaryValues(int idDictionaryKey)
        {
            var dictionaryValueList = _context.TblDictionaryValues.Where(row =>
                                                                    row.IdDictionaryKey == idDictionaryKey &&
                                                                    row.IsActive)
                                                                .Select(row => row.ValueDescription)
                                                                .ToList();

            // Implementation here
            return dictionaryValueList;
        }

        public List<TblDictionaryValues> GetEditableDictionaryValues(int idDictionaryKey)
        {
            var dictionaryValues = from dictionaryKey in _context.TblDictionaryValues
                                   join dictonaryValues in _context.TblDictionaryValues on dictionaryKey.IdDictionaryKey equals dictonaryValues.IdDictionaryKey
                                   where dictionaryKey.IdDictionaryKey == idDictionaryKey && dictonaryValues.IsActive
                                   select dictonaryValues;
            List<TblDictionaryValues> dictionaryValueList = dictionaryValues.ToList();
            // Implementation here
            return dictionaryValueList;
        }

        public string GetUserRole(int dictionaryValue)
        {
            var userRole = _context.TblDictionaryValues.Where(row =>
                                                                    row.IdDictionaryValue == dictionaryValue &&
                                                                    row.IsActive)
                                                                .Select(row => row.ValueDescription)
                                                                .FirstOrDefault();
            // Implementation here
            return userRole ?? "Unkown";
        }

        public bool UpdateDictionaryValue(int idDictionaryKey, int idDictionaryValue, string newValue)
        {
            var dictionaryItem = _context.TblDictionaryValues.FirstOrDefault(row =>
                                                                    row.IdDictionaryKey == idDictionaryKey &&
                                                                    row.IdDictionaryValue == idDictionaryValue &&
                                                                    row.IsActive);
            if (dictionaryItem != null)
            {
                dictionaryItem.ValueDescription = newValue;
                _context.SaveChanges();
                return true;
            }
            return false;
        }
    }
}
