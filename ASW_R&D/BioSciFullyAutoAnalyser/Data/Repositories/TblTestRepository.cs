using Data.Contexts;
using Data.Entities;
using Data.Interfaces;
using Data.Enums;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using ZstdSharp.Unsafe;
using Microsoft.VisualBasic;
using Microsoft.EntityFrameworkCore.Query.Internal;

namespace Data.Repositories
{
    public class TblTestRepository : ITblTest
    {
        private readonly DatabaseContext _context;

        public TblTestRepository(DatabaseContext context)
        {
            _context = context;
        }

        public List<TblTest> GetTestList(bool getSpecialSolutions)
        {
            return _context.TblTest.Where(t => getSpecialSolutions || !t.IsSpecialSolution).ToList();
        }
        public List<TblTest> GetSpecialSolutions()
        {
            return _context.TblTest.Where(t => t.IsSpecialSolution).ToList();
        }

        public TblTest GetTest(int TestID)
        {
            var test = _context.TblTest.Find(TestID);
            if (test == null) test = new TblTest();
            return test;
        }
        public TblTestDetails GetTestDetails(int TestID)
        {
            var testDetails = _context.TblTestDetails.FirstOrDefault(td => td.IdTest == TestID);
            if (testDetails == null) testDetails = new TblTestDetails();
            return testDetails;
        }
        public TestRepositoryErrors UpdateTest(TblTest test, TblTestDetails testDetails)
        {
            try
            {
                var existing = _context.TblTest.Any(tblTest => tblTest.TestCode == test.TestCode);
                if (test.IdTest == 0 && !existing)
                {
                    test.IdTest = 0;
                    test.CreatedAt = DateTime.Now;
                    test.ModifiedAt = DateTime.Now;
                    _context.TblTest.Add(test);
                    _context.SaveChanges();
                    testDetails.IdTest = test.IdTest;
                    _context.TblTestDetails.Add(testDetails);
                    _context.SaveChanges();
                }
                else if (test.IdTest == 0 && existing)
                    return TestRepositoryErrors.TestAlreadyExists;
                else
                {
                    _context.TblTest.Update(test);
                    var existingDetails = _context.TblTestDetails.FirstOrDefault(td => td.IdTest == test.IdTest);
                    existingDetails.PrimaryFilterID = testDetails.PrimaryFilterID;
                    existingDetails.SecondaryFilterID = testDetails.SecondaryFilterID;
                    existingDetails.IsDelayedR2 = testDetails.IsDelayedR2;
                    existingDetails.Linearity = testDetails.Linearity;
                    existingDetails.SubstrateDepletion = testDetails.SubstrateDepletion;
                    existingDetails.IncubationTime = testDetails.IncubationTime;
                    existingDetails.ReadingTime = testDetails.ReadingTime;
                    existingDetails.ReadStartCycle = testDetails.ReadStartCycle;
                    existingDetails.ReadEndCycle = testDetails.ReadEndCycle;
                    existingDetails.CorelationA = testDetails.CorelationA;
                    existingDetails.CorelationB = testDetails.CorelationB;
                    existingDetails.R1Volume = testDetails.R1Volume;
                    existingDetails.R2Volume = testDetails.R2Volume;
                    existingDetails.SampleVolume = testDetails.SampleVolume;
                    existingDetails.AutoDilutionRatio = testDetails.AutoDilutionRatio;
                    existingDetails.StirrerSpeedSample = testDetails.StirrerSpeedSample;
                    existingDetails.StirrerSpeedR2 = testDetails.StirrerSpeedR2;
                    existingDetails.LastReagentBlank = testDetails.LastReagentBlank;
                    existingDetails.ReagentBlankLow = testDetails.ReagentBlankLow;
                    existingDetails.ReagentBlankHigh = testDetails.ReagentBlankHigh;
                    _context.TblTestDetails.Update(existingDetails);
                    _context.SaveChanges();

                }
            } catch (Exception ex)
            {
                // Log the exception or handle it as needed
                return TestRepositoryErrors.DatabaseError;
            }
            
                return TestRepositoryErrors.None;
            
        }
    }
}
