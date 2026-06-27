using Data.Entities;
using Data.Enums;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using System;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;
using System.Text;

namespace Data.Interfaces
{
    public interface ITblTest
    {
        TblTest? GetTest(int TestID);
        TblTestDetails GetTestDetails(int TestID);
        TestRepositoryResponses UpdateTest(TblTest test, TblTestDetails testDetails);

        List<TblTest> GetTestList(bool getSpecialSolutions);
        List<TblTest> GetSpecialSolutions();
    }
}
