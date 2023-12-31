//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LandLord_ROR
{
    using System;
    using System.Collections.Generic;
    
    public partial class LandLord
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LandLord()
        {
            this.LandLordRORs = new HashSet<LandLordROR>();
        }
    
        public int LandLordId { get; set; }
        public string LLType { get; set; }
        public string LandLordCode { get; set; }
        public string LLTitle { get; set; }
        public string LandLordName { get; set; }
        public string LL_Address1 { get; set; }
        public string LL_Address2 { get; set; }
        public string LL_State { get; set; }
        public string LL_District { get; set; }
        public string LL_Mandal { get; set; }
        public string LL_Village { get; set; }
        public string LL_PinCode { get; set; }
        public string LL_Phone1 { get; set; }
        public string LL_Phone2 { get; set; }
        public string LL_PAN { get; set; }
        public string LL_Aadhar { get; set; }
        public string LL_GST { get; set; }
        public string CIN { get; set; }
        public string DIN { get; set; }
        public Nullable<System.DateTime> IncorporationDate { get; set; }
        public string LL_Mail { get; set; }
        public string D_O { get; set; }
        public Nullable<int> Age { get; set; }
        public string Occupation { get; set; }
        public string Designation { get; set; }
        public string Description { get; set; }
        public string Rep_Off { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LandLordROR> LandLordRORs { get; set; }
    }
}
