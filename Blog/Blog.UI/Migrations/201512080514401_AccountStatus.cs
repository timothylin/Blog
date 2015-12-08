namespace Blog.UI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AccountStatus : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "AccountStatus", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "AccountStatus");
        }
    }
}
