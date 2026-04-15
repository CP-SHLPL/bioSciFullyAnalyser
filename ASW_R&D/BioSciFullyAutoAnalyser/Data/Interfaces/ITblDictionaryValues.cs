using Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Interfaces
{
    public interface ITblDictionaryValues
    {
        public string GetDictionaryValue(int idDictionaryKey, int idDictionaryValue);
        public List<string> GetDictionaryValues(int idDictionaryKey);
        public List<TblDictionaryValues> GetEditableDictionaryValues(int idDictionaryKey);

        public string GetUserRole(int dictionaryValue);

        public bool UpdateDictionaryValue(int idDictionaryKey, int idDictionaryValue, string newValue);
    }
}
