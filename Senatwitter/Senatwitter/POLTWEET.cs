//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Senatwitter
{
    using System;
    using System.Collections.Generic;
    
    public partial class POLTWEET
    {
        public int POLTWEETID { get; set; }
        public int PID { get; set; }
        public string TWITTERID { get; set; }
    
        public virtual Politician Politician { get; set; }
        public virtual TWEET TWEET { get; set; }
    }
}
