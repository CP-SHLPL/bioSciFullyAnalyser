namespace Data.Enums
{

    public enum EnumDicitonaryKeys
    {
        None = 0,
        UserRole = 1,
        Unit = 2,
        Method = 3,
        BlankType = 4,
        Filter = 5,
        ReactionDirection = 6,
        StirrerSpeed = 7,

    }
    public enum EnumUserRole
    {
        Admin = 1,
        Technician = 2,
        ServiceEngineer = 3
    }

    public enum TestRepositoryErrors
    {
        None = 0,
        TestNotFound = 1,
        TestDetailsNotFound = 2,
        DatabaseError = 3,
        TestAlreadyExists = 4,
        SampleVolumeIncorrect = 5,
        TotalVolumeIncorrect = 6,
        ReactionTimeIncorrect = 7,
    }
}