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
    
    public partial class State
    {
        public State()
        {
            this.Politicians = new HashSet<Politician>();
        }
    
        public string StateID { get; set; }
        public string StateName { get; set; }
        public string MajorityParty { get; set; }
    
        public virtual Party Party { get; set; }
        public virtual ICollection<Politician> Politicians { get; set; }
    }
}