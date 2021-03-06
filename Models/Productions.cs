//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Productions
    {
        public int Id { get; set; }
        public string TransactionId { get; set; }
        public Nullable<int> PermiteeId { get; set; }
        public Nullable<int> QuarriesId { get; set; }
        public Nullable<int> SagId { get; set; }
        public Nullable<decimal> Quantity { get; set; }
        public Nullable<int> VehicleId { get; set; }
        public Nullable<int> DestinationId { get; set; }
        public Nullable<int> OriginId { get; set; }
        public string ReceiptNo { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public Nullable<System.DateTime> ReceiptDate { get; set; }
        public Nullable<System.DateTime> ProductionDate { get; set; }
        public Nullable<int> ProgramOfWorkId { get; set; }
        public string Remarks { get; set; }
        public string Destination { get; set; }
        public string BundleCode { get; set; }
    
        public virtual Permitees Permitees { get; set; }
        public virtual ProgramOfWorks ProgramOfWorks { get; set; }
        public virtual Quarries Quarries { get; set; }
        public virtual Vehicles Vehicles { get; set; }
        public virtual Sags Sags { get; set; }
        public virtual Transactions Transactions { get; set; }
        public virtual Barangays Barangays { get; set; }
    }
}
