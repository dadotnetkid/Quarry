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
    
    public partial class Sags
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sags()
        {
            this.Productions = new HashSet<Productions>();
            this.TransactionSags = new HashSet<TransactionSags>();
            this.Hauleds = new HashSet<Hauleds>();
            this.QuarriesInTransactions = new HashSet<QuarriesInTransactions>();
            this.SummaryProgramOfWorks = new HashSet<SummaryProgramOfWorks>();
        }
    
        public int Id { get; set; }
        public Nullable<int> UnitMeasurementId { get; set; }
        public string Sag { get; set; }
        public Nullable<decimal> UnitCost { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Productions> Productions { get; set; }
        public virtual UnitMeasurements UnitMeasurements { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TransactionSags> TransactionSags { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hauleds> Hauleds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuarriesInTransactions> QuarriesInTransactions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SummaryProgramOfWorks> SummaryProgramOfWorks { get; set; }
    }
}
