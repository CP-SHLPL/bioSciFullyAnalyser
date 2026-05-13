using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Entities
{
    public class TblTest
    {
        public int IdTest { get; set; }
        public int UniqueIDTest { get; set; }
        public string TestCode { get; set; } = String.Empty;
        public string TestName { get; set; } = String.Empty;
        public bool IsActive { get; set; } = true;
        public int ConventionalUnitID { get; set; } = 0;
        public int SIUnitID { get; set; } = 0;
        public string DisplayString {  get; set; }
        public int CurveTypeID { get; set; }
        public int DirectionID { get; set; }
        public int MethodID { get; set; }
        public string MethodString {  get; set; }
        public int BlankType { get; set; }
        public string BlankTypeString {  get; set; }
        public int NoOfReagents { get; set; }
        public int DecimalPlaces { get; set; }
        public int TestSequence { get; set; }
        public bool IsSpecialSolution { get; set; } = false;
        public bool IsVisible { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.MinValue;
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedAt { get; set; } = DateTime.MinValue;
    }
}
