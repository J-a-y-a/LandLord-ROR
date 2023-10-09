using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LandLord_ROR
{
    public partial class _Default : Page
    {
        MILESTATESEntities db = new MILESTATESEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdown();
            }

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ModalScript", "openModal();", true);
            
        }
        public void BindDropdown()
        {
            using (MILESTATESEntities db = new MILESTATESEntities())
            {
               
                DropDownList1.DataSource = (from r in db.LandLords select r).ToList();
                DropDownList1.DataTextField = "LandLordName";
                DropDownList1.DataValueField = "LandLordCode";
                DropDownList1.DataBind();
                //DropDownList1.Items.Insert(0, new ListItem("--select--", "0", true));
                DDLVillage.DataSource = (from V in db.Villages select V).ToList();
                DDLVillage.DataTextField = "VillageName";
                DDLVillage.DataValueField = "VillageId";
                DDLVillage.DataBind();
                
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = DropDownList1.SelectedValue;
        }
        protected void DDLVillage_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Mandalcd = Convert.ToInt16(DDLVillage.SelectedValue.ToString());
            var Mandal = from s in db.Mandals where s.MandalCd.Equals(Mandalcd) select new { s.MandalId, s.MandalName };
            DDLMandal.DataSource = Mandal.ToList();
            DDLMandal.Enabled = true;
            DDLMandal.DataValueField = "MandalId";
            DDLMandal.DataTextField = "MandalName";
            DDLMandal.DataBind();
            DDLMandal.Items.Insert(0, "--Select--");
        }
        protected void DDLMandal_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Districtcd = Convert.ToInt16(DDLMandal.SelectedValue.ToString());
            var District = from c in db.Districts where c.DistrictCd.Equals(Districtcd) select new { c.DistrictCd, c.DistrictName};
           DDLDist.DataSource = District.ToList();
            DDLDist.Enabled = true;
            DDLDist.DataValueField = "DistrictId";
            DDLDist.DataTextField = "DistrictName";
            DDLDist.DataBind();
            DDLDist.Items.Insert(0, "--Select--");
        }
        //protected void DDLVillage_SelectedIndexChange(object sender, EventArgs e)
        //{
        //    int selectedVillage =Convert.ToInt16( DDLVillage.SelectedValue);
        //    using (var db = new MILESTATESEntities())
        //    {
        //        var village = db.Villages.FirstOrDefault(v => v.VillageId == selectedVillage);
        //        if (village != null)
        //        {
        //            DDLMandal.SelectedValue = village.M;
        //            DistrictDropDownList.SelectedValue = village.DistrictName;
        //            StateDropDownList.SelectedValue = village.StateName;
        //        }
        //    }
        //}
        protected void DDLDist_SelectedIndexChanged(object sender, EventArgs e)
        {
            int StateCd = Convert.ToInt16(DDLDist.SelectedValue.ToString());
            var State = from c in db.States where c.StateCd.Equals(StateCd) select new { c.StateCd, c.StateName };
            DDLState.DataSource = State.ToList();
            DDLState.Enabled = true;
            DDLState.DataValueField = "DistrictId";
            DDLState.DataTextField = "DistrictName";
            DDLState.DataBind();
            DDLState.Items.Insert(0, "--Select--");
        }




    }
}