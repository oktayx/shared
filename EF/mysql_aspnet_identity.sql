----------------------Tables----------------------

CREATE TABLE IF NOT EXISTS `AspNetRoles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `ConcurrencyStamp` longtext NULL,
  `NormalizedName` varchar(256) NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8
    COLLATE utf8_general_ci;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS `AspNetUserClaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(128) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8
    COLLATE utf8_general_ci AUTO_INCREMENT=1 ;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS `AspNetUserLogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `UserId` varchar(128) NOT NULL,
  `ProviderDisplayName` longtext,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`,`UserId`),
  KEY `ApplicationUser_Logins` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8
    COLLATE utf8_general_ci;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS `AspNetUserRoles` (
  `UserId` varchar(128) NOT NULL,
  `RoleId` varchar(128) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IdentityRole_Users` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8
    COLLATE utf8_general_ci;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS `AspNetUsers` (
  `Id` varchar(128) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `ConcurrencyStamp` longtext NULL,
  `NormalizedEmail` varchar(256) NULL,
  `NormalizedUserName` varchar(256) NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT 
  CHARACTER SET utf8
    COLLATE utf8_general_ci;


--------------------------------------------------------

CREATE TABLE  IF NOT EXISTS `AspNetRoleClaims` (
	`Id` int NOT NULL AUTO_INCREMENT,
	`ClaimType` longtext NULL,
	`ClaimValue` longtext NULL,
	`RoleId` varchar(450) NOT NULL,
    PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT 
  CHARACTER SET utf8
    COLLATE utf8_general_ci;


--------------------------------------------------------

CREATE TABLE  IF NOT EXISTS `AspNetUserTokens` (
	`UserId` varchar(128) NOT NULL,
	`LoginProvider` nvarchar(450) NOT NULL,
	`Name` nvarchar(450) NOT NULL,
	`Value` longtext NULL,
    PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
    KEY `PK_AspNetUserTokens` (`UserId`)
) ENGINE=InnoDB DEFAULT 
  CHARACTER SET latin1;


----------------------Constraints----------------------

ALTER TABLE `AspNetRoleClaims` 
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY(`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `AspNetUserClaims`
  ADD CONSTRAINT `ApplicationUser_Claims` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `AspNetUserLogins`
  ADD CONSTRAINT `ApplicationUser_Logins` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `AspNetUserRoles`
  ADD CONSTRAINT `ApplicationUser_Roles` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `IdentityRole_Users` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;
