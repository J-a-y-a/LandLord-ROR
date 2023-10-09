using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LandLord_ROR
{
    public partial class popup : System.Web.UI.Page
    {
        MILESTATESEntities db = new MILESTATESEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                BindGrid();

                //UpdatePanel1.Triggers.Add(new PostBackTrigger()
                //{
                //    ControlID = DDLVillage.UniqueID
                //});
            }
        }
     

        protected void BindGrid()
        {
            //TxtLcode.Text = DdlLname.SelectedValue;
            //var LandLordcode = DdlLname.SelectedItem.Value;
            
          var LandLordcode = DdlLname.SelectedValue;
            var emp = (from LLR in db.LandLordRORs
                       join LAL in db.LandLords on LLR.LandLordCode equals LAL.LandLordCode.ToString()
                       join ME in db.Land_Title_Type_Master on LLR.LandTitleCode equals ME.LandTitleCode.ToString() into ps_jointable
                       from MED in ps_jointable.DefaultIfEmpty()
                       join CAM in db.Spl_Category on LLR.Spl_Category equals CAM.SPlCategoryId.ToString() into pes_jointable
                       from CAM in pes_jointable.DefaultIfEmpty()
                       where LLR.LandLordCode == LandLordcode
                       select new
                       {
                           LLR.SNo,
                           LLR.LandLordCode,
                           LAL.LandLordName,
                           LLR.SurveyNo,
                           LLR.SurveyNo_SubLetter,
                           LLR.Extent_Acres,
                           LLR.Extent_Guntas,
                           LLR.Extent_Sqyds,
                           LLR.Spl_Category,
                           LLR.ProceedingNo,
                           LLR.Doc_No,
                           LLR.LandTitleCode,
                           MED.LandTitleName,
                           CAM.SplCategory,
                       });

            var records = emp.ToList();
            // Retrieve data from the database using Entity Framework
            //var records = db.LandLordRORs.Where(p => p.LandLordCode == LandLordcode).ToList();

            double totalAcres = 0;
            double totalGuntas = 0;
            double totalSqYards = 0;

            foreach (var record in records)
            {
                totalAcres += Convert.ToDouble(record.Extent_Acres);
                totalGuntas += Convert.ToDouble(record.Extent_Guntas);
                totalSqYards += Convert.ToDouble(record.Extent_Sqyds);
               
            }
            double gunta1 = 0, Acr = 0;
            if (totalSqYards >= 121)
            {
                //var gunta1 = Math.Round(totalSqYards / 121, 2);
                gunta1 = totalSqYards / 121;
                //totalGuntas += gunta1;
                totalSqYards = totalSqYards % 121;
            }
            totalGuntas += gunta1;
            if (totalGuntas >= 40)
            {

                //var Acr = Math.Round(totalGuntas / 40, 2);
                 Acr = totalGuntas / 40;
                //totalAcres += Acr;
                var Gunta = totalGuntas % 40;
                totalGuntas = Gunta;
            }
            totalAcres += Acr;
            //to round the decimal values Math.Round
            TxtTAcres.Text = Math.Floor(totalAcres).ToString();
            TxtTGuntas.Text = Math.Floor(totalGuntas).ToString();
            TxtTSqYards.Text = Math.Floor(totalSqYards).ToString();
            // Bind the GridView and set the footer row
            LandLordGrid.DataSource = records;
            LandLordGrid.DataBind();
            GridViewRow footerRow = LandLordGrid.FooterRow;
            if (footerRow != null)
            {
                footerRow.Cells[3].Text = "Total";
                footerRow.Cells[3].Font.Bold = true;
                footerRow.Cells[4].Text = TxtTAcres.Text.ToString();
                footerRow.Cells[4].Font.Bold = true;
                footerRow.Cells[5].Text = TxtTGuntas.Text.ToString();
                footerRow.Cells[5].Font.Bold = true;
                footerRow.Cells[6].Text = TxtTSqYards.Text.ToString();
                footerRow.Cells[6].Font.Bold = true;
            }
        }
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            //ClearPopupInputs();
            Txtllname.Text = DdlLname.SelectedItem.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "openModal();", true);
            //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "UpdatePanel1StartupScript", "openModal();", true);
        }
      
        protected void DdlLname_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void MandalDdlBind()
        {
           
            var mandalsList = (from v in db.Villages
                               join m in db.Mandals on v.MandalCd equals m.MandalCd
                               where v.VillageCd == DDLVillage.SelectedValue
                               select new
                               {
                                   MandalCd = m.MandalCd,
                                   MandalName = m.MandalName
                               }).ToList();
            if (mandalsList.Count == 0)
            {
                DDLMandal.Items.Clear();
            }
            else
            {
                DDLMandal.DataSource = mandalsList;
                DDLMandal.DataValueField = "MandalCd";
                DDLMandal.DataTextField = "MandalName";
                DDLMandal.DataBind();
            }
        }

        protected void DistDdLBind()
        {
            var districtsList = (from m in db.Mandals
                                 join d in db.Districts on m.DistrictCd equals d.DistrictCd
                                 where m.MandalCd.Equals(DDLMandal.SelectedValue.ToString())
                                 select new { d.DistrictCd, d.DistrictName }).ToList();
            DDLDist.DataSource = districtsList;
            DDLDist.DataValueField = "DistrictCd";
            DDLDist.DataTextField = "DistrictName";
            DDLDist.DataBind();
        }

        protected void StateDdlBind()
        {
            var statesList = (from d in db.Districts
                              join s in db.States on d.StateCd equals s.StateCd
                              where d.DistrictCd.Equals(DDLDist.SelectedValue.ToString())
                              select new { s.StateCd, s.StateName }).ToList();
            DDLState.DataSource = statesList;
            DDLState.DataValueField = "StateCd";
            DDLState.DataTextField = "StateName";
            DDLState.DataBind();
        }

        protected void DDLVillage_SelectedIndexChanged(object sender, EventArgs e)
      {


            MandalDdlBind();
            DistDdLBind();
            StateDdlBind();
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "openModal();", true);
            //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "Message", "<script>EnableDisableDropdownlist()</script>", true);
        }
        protected void BindControls(LandLordROR LandLordcode)
        {
            HiddenField1.Value = "";
            LandLordcode.LandLordCode = DdlLname.SelectedValue;
            LandLordcode.SurveyNo = TxtSNo.Text;
            LandLordcode.SurveyNo_SubLetter = TxtSL.Text;
            LandLordcode.Description = TxtDescrip.Text;
            LandLordcode.LandTitleCode = DDLLtt.SelectedValue;
            LandLordcode.OwnerShipType = DDLOs.SelectedValue;
            LandLordcode.Doc_No = TxtDocNo.Text;
            if (TxtDocDate.Text == "")
            {
                LandLordcode.Doc_Date = null;
            }
            else
            {
                LandLordcode.Doc_Date = Convert.ToDateTime(TxtDocDate.Text);
            }
            LandLordcode.LandNatureCode = DdlLandNature.SelectedValue;
            LandLordcode.LandZoneCode = DdlLandZone.SelectedValue;
            LandLordcode.ProceedingNo = TXTPNo.Text;
            LandLordcode.Spl_Category = DdlSplCat.SelectedValue;
            LandLordcode.PurchaseType = DdlTypeOfPurchase.SelectedValue;
            if (TxtAcr.Text =="" )
            {
                LandLordcode.Extent_Acres = null;
            }
            else
            {
                LandLordcode.Extent_Acres = Convert.ToDecimal(TxtAcr.Text);
            }
            if (TxtGunt.Text == "")
            {
                LandLordcode.Extent_Guntas = null;
            }
            else
            {
                LandLordcode.Extent_Guntas = Convert.ToDecimal(TxtGunt.Text);
            }
            if (TxtSqYds.Text == "")
            {
                LandLordcode.Extent_Sqyds = null;
            }
            else
            {
                LandLordcode.Extent_Sqyds = Convert.ToDecimal(TxtSqYds.Text);
            }
            MandalDdlBind();
            DistDdLBind();
            StateDdlBind();
            LandLordcode.VillageCd = DDLVillage.SelectedValue;
            LandLordcode.MandalCd = DDLMandal.SelectedValue;
            LandLordcode.DistrictCd = DDLDist.SelectedValue;
            LandLordcode.StateCd = DDLState.SelectedValue;
        }
        protected void ClearPopupInputs()
        {
            Txtllname.Text = string.Empty;
            TxtSNo.Text = string.Empty;
            TxtSL.Text = string.Empty;
            TxtAcr.Text = string.Empty;
            TxtGunt.Text = string.Empty;
            TxtSqYds.Text = string.Empty;
            DDLVillage.SelectedIndex = 0;
            MandalDdlBind();
            DistDdLBind();
            StateDdlBind();
            //DDLVillage.SelectedValue = null;
            DDLMandal.SelectedIndex = -1;
            DDLDist.SelectedIndex = -1;
            DDLState.SelectedIndex = -1;
            DdlLandZone.SelectedIndex = 0;
            DDLLtt.SelectedIndex = 0;
            DDLOs.SelectedIndex = 0;
            TxtDocNo.Text = string.Empty;
            TxtDocDate.Text = string.Empty;
            DdlLandNature.SelectedIndex = 0;
            //DropDownList6.Value = "";
            DdlSplCat.SelectedIndex = 0;
            DdlTypeOfPurchase.SelectedIndex = 0;
            TXTPNo.Text = string.Empty;
            Txtllname.Text = string.Empty;
            TxtDescrip.Text = string.Empty;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
           
            if (ModelState.IsValid)
            {
                var sno = HiddenField1.Value;
              
                if (sno == "")
                {

                    var duplicates = db.LandLordRORs
                       .Where(x => x.LandLordCode == DdlLname.SelectedValue.Trim()
                           && x.SurveyNo == TxtSNo.Text.Trim()
                           && x.SurveyNo_SubLetter == TxtSL.Text.Trim())
                       .ToList();
                    if (duplicates.Count > 0)
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Survey No. with Subletter Already Exists!');", true);
                        //return;
                        TxtSL.Focus();
                        return;
                    }
                    else
                    {
                        LandLordROR LandLordcode = new LandLordROR();
                        BindControls(LandLordcode);
                        db.LandLordRORs.Add(LandLordcode);
                    }
                }
                else
                {

                    int Sno = Convert.ToInt32(sno);

                    var recordToUpdate = (from stu in db.LandLordRORs
                                          where stu.SNo == Sno
                                          select stu).FirstOrDefault();
                    
                    if (recordToUpdate != null)
                    {
                        BindControls(recordToUpdate);
                        db.Entry(recordToUpdate).State = EntityState.Modified;

                    }
                }
                int i = db.SaveChanges();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data added Successfully...');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data Not added..');", true);
                }
            }
            ClearPopupInputs();
            BindGrid();
          
        }
        protected void btnclose_Click(object sender, EventArgs e)
        {
            ClearPopupInputs();
        }
        protected void btnedit_Click(object sender, EventArgs e)
        {
            LinkButton btndetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            if (gvrow.RowIndex < LandLordGrid.DataKeys.Count)
            {
                int sno = Convert.ToInt32(LandLordGrid.DataKeys[gvrow.RowIndex].Value);
                var landLord = db.LandLordRORs.SingleOrDefault(r => r.SNo == sno);
               
                Txtllname.Text = DdlLname.SelectedItem.Value + " " + DdlLname.SelectedItem.Text;
                HiddenField1.Value = Convert.ToString(landLord.SNo);
                DdlLname.SelectedValue = landLord.LandLordCode;
                TxtSNo.Text = landLord.SurveyNo;
                TxtSL.Text = landLord.SurveyNo_SubLetter;
                DDLVillage.SelectedValue = landLord.VillageCd;
                TxtDescrip.Text = landLord.Description;
               
                DateTime docDate;
                if (DateTime.TryParse(landLord.Doc_Date.ToString(), out docDate))
                {
                    TxtDocDate.Text = docDate.ToString("dd/MM/yyyy");
                }
                DdlLandNature.SelectedValue = landLord.LandNatureCode;
                DdlLandZone.SelectedValue = landLord.LandZoneCode;
                DdlTypeOfPurchase.SelectedValue = landLord.PurchaseType;
                TxtAcr.Text = landLord.Extent_Acres.ToString();
                TxtGunt.Text = landLord.Extent_Guntas.ToString();
                TxtSqYds.Text = landLord.Extent_Sqyds.ToString();
                TxtDocNo.Text = landLord.Doc_No;
                DdlSplCat.SelectedValue = landLord.Spl_Category;
                TXTPNo.Text = landLord.ProceedingNo;
                DDLLtt.SelectedValue = landLord.LandTitleCode;
                DDLOs.SelectedValue = landLord.OwnerShipType;
                MandalDdlBind();
                DistDdLBind();
                StateDdlBind();
                DDLMandal.SelectedValue = landLord.MandalCd;
                DDLDist.SelectedValue = landLord.DistrictCd;
                DDLState.SelectedValue = landLord.StateCd;
                // Show the popup
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                BindGrid();
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btndetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            if (gvrow.RowIndex < LandLordGrid.DataKeys.Count)
            {
                int sno = Convert.ToInt32(LandLordGrid.DataKeys[gvrow.RowIndex].Value);
                var recordToDelete = db.LandLordRORs.SingleOrDefault(r => r.SNo == sno);
                if (recordToDelete != null)
                {
                    db.LandLordRORs.Remove(recordToDelete);
                    int i = db.SaveChanges();

                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data Deleted Successfully...');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data Not Deleted..');", true);
                    }
                }

                BindGrid();
            }


        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            //LandLordGrid.EditIndex = -1;
            //this.BindGrid();
        }
       
    }
}


