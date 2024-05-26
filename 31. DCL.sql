--------------------------- DCL ---------------------------------
-- [Login]          Server (Omar)
-- [User]           DB ITI (Omar)
-- [Schema]         HR   [Department, Instructor]
-- Permissions      Grant [select,insert]    Deny [delete Update]

Create Schema HR

alter schema HR
transfer [dbo].[Instructor]

alter schema HR
transfer Department