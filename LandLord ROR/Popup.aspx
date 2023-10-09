<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popup.aspx.cs" Inherits="LandLord_ROR.popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .modal-dialog {
            width: 890px !important;
            height: 100px !important;
        }

        .modal-header {
            height: 35px !important;
            padding: 4px !important;
        }

        .modal-body {
            padding-top: 1px !important;
        }

        body {
            font-family: math !important;
            font-size: 13px !important;
        }

        h3 {
            margin-top: 6px !important;
            margin-bottom: 8px !important;
            font-family: 'Segoe UI' !important;
        }

        hr {
            margin-top: 4px !important;
            margin-bottom: 6px !important;
            border: 0 !important;
            border-top: 1px solid #eee !important;
        }

        td {
            padding: 1px !important;
        }

        fieldset {
            border: thin solid #333 !important;
            margin-left: -30px !important;
            margin-right: 10px !important;
        }

        legend {
            color: maroon;
            font-family: fantasy !important;
            /*background: #000;*/
            font-size: 1.3em !important;
            padding: 5px !important;
            margin-bottom: 4px !important;
            margin-left: 40px !important;
            width: 120px !important;
            margin-right: 13px !important;
        }

        .required-field::before {
            content: "*" !important;
            color: red !important;
            margin-left: 2px !important;
        }

        th {
            padding: 2px !important;
            font-size: 16px !important;
        }

        #LandLordGrid {
            background-color: #DEBA84;
            border-color: #DEBA84;
            border-width: 1px;
            border-style: None;
            width: 99%;
            margin-left: 9px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <%-- <asp:scriptmanager runat="server"></asp:scriptmanager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
    <ContentTemplate>--%>
         <div>
        <asp:Table ID="Table1" runat="server" Style="margin-left:20px; margin-top:0px; border-collapse:collapse;" Align="center;" Height="141px" Width="1541px"> <%--CellPadding="2" CellSpacing="2" Border="0" Style="width: 100%; margin-left: 60px; margin-top: 20px;--%><%-- Align="center">--%>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="6" Style="margin-top: 0px; color: brown;" ><h3>Land Lord ROR</h3></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="6" Style="margin-top: 5px;margin-bottom:5px;">
                     <hr/>
                </asp:TableCell>
            </asp:TableRow>
           
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                        <span class="lable1" style="color:blue;font-size:16px;margin-top:10px;" ><span class="required-field"></span> LandLord</span>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                        <span class="lable2" style="color:blue;font-size:16px;">TotalExtent</span>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                        <span class="lable3" style="color:blue;font-size:16px;">Procured&Balance</span>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:DropDownList ID="DdlLname"  runat="server" DataSourceID="SqlDataSource1" DataTextField="LandLordName" AppendDataBoundItems="true" DataValueField="LandLordCode"  Style="padding:2px;border-radius: 0px;border: 1px solid black; height: 23px;margin-left:2px;" OnSelectedIndexChanged="DdlLname_SelectedIndexChanged" AutoPostBack="true">  
                 <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
            </asp:DropDownList>  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MILESTATESConnectionString %>" SelectCommand="select  CONCAT(LandLordName, '(', LandLordCode,')') AS LandLordName, LandLordCode from master.Landlord 
ORDER BY LandLordCode +0 asc"></asp:SqlDataSource>  

                    <asp:RequiredFieldValidator ID="RFVLandLName" runat="server" ErrorMessage="Please Select LandLord!" Display="Dynamic" ControlToValidate="DdlLname"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                    <span class="label4" style="width: 100px; font-size: 14px; display: inline-block">Acres</span>
                    <span class="label4" style="width: 100px; font-size: 14px; display: inline-block">Guntas</span>
                    <span class="label4" style="width: 100px; font-size: 14px; display: inline-block">Sq.Ads</span>
                    <br/>
                    <asp:TextBox ID="TxtTAcres" runat="server" Style="width:82px; height:21px;text-align: right; margin-right:6px;" disabled="disabled" placeholder="Acres"></asp:TextBox>
                    <asp:TextBox ID="TxtTGuntas" runat="server" Style="width: 82px;height:21px; text-align: right; margin-right:6px;" disabled="disabled" placeholder="Guntas"></asp:TextBox>
                    <asp:TextBox ID="TxtTSqYards" runat="server" Style="width: 82px;height:21px; text-align: right; margin-right:6px;" disabled="disabled" placeholder="Sq.Ads"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TextBox5" runat="server" placeholder="EnterProcuredValue" style="margin-right:6px;margin-top:23px;height: 23px;"></asp:TextBox>
                    <asp:TextBox ID="TextBox6" runat="server" placeholder="EnterBalance" Style="width: 200px; height: 23px;"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="6" style="margin-top:5px;">
                    <hr style="margin-top:16px;"/>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>

                <asp:TableCell ColumnSpan="5">
                    <asp:Button ID="BtnAdd" runat="server" Text=" + Add  " Style="float: right;font-size:20px; background-color:maroon;color:aliceblue; margin-right:92px;" OnClick="BtnAdd_Click" CausesValidation="false" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

         <asp:GridView runat="server" ID="LandLordGrid" ShowHeaderWhenEmpty="True" DataKeyNames="SNo" OnRowEditing="OnRowEditing" 
     Width="99%" 
            AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84"   BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowFooter="True" >
            <Columns>
                <asp:TemplateField HeaderText="SNO">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="LandLordName" HeaderText="LandLord" />
                <asp:BoundField DataField="SurveyNo" HeaderText="SurveyNo" />
                <asp:BoundField DataField="SurveyNo_SubLetter" HeaderText="SubLetter" />
                <asp:BoundField DataField="Extent_Acres" HeaderText="Acres" />
                <asp:BoundField DataField="Extent_Guntas" HeaderText="Guntas" />
                <asp:BoundField DataField="Extent_Sqyds" HeaderText="Sqyds" />
                <asp:BoundField DataField="Doc_No" HeaderText="DocumentNo" />
                <asp:BoundField DataField="SplCategory" HeaderText="Spl_Category" />
                <asp:BoundField DataField="ProceedingNo" HeaderText="ProceedingNo" />
                <asp:BoundField DataField="LandTitleName" HeaderText="Nature Of Ownership"/>
                <asp:TemplateField HeaderText="Actions" >
                    <ItemTemplate>
                         <asp:LinkButton id="lnkedit"   runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" OnClick="btnedit_Click" />                      
                        <asp:LinkButton id="LinkButton1"   runat="server" Text="Delete" CommandName="Edit" CausesValidation="false" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you want to delete this ...');"/>
                                        </ItemTemplate>
                </asp:TemplateField>
            </Columns>
             <EmptyDataTemplate>
                 <div style="align-content:center;">No records found.</div>
             </EmptyDataTemplate>
             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#FFF1D4" />
             <SortedAscendingHeaderStyle BackColor="#B95C30" />
             <SortedDescendingCellStyle BackColor="#F1E5CE" />
             <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
     </div>
              <asp:scriptmanager runat="server"></asp:scriptmanager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False" >
    <ContentTemplate>
<div class="modal"  id="loginmodal" tabindex="-1" style:"width:80%;height:100px;" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog" >
            <div class="modal-content"> 
                <div class="modal-header"  style="background-color:cadetblue">
                    <h4 class="modal-title" >
                        New LandLord ROR</h4>
                    <button class="close" data-dismiss="modal" style="margin-top:-28px;margin-right:10px;color:white;">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group" >
                        <div class="row" style="background-color:burlywood;color:aliceblue; padding:1px;height:30px;">
                            <div class="col-md-6">
                                <label for="inputUserName" style="font-size:15px; "><span class="required-field"></span> Land Lord: </label>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="Txtllname" runat="server" style="color:black;width:402px;height:23px;margin-top:2px;" disabled="disabled"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row" >
                            <div class="col-sm-7" >
                               <div class="row" style="margin-top:10px; font-size:15px;">
                                    <div class="col-sm-7" style="margin-top:10px;">
                                        <asp:Label ID="LblSurveyNo" runat="server" Text="Label" style="font-size:15px;color:blue;"><span class="required-field"></span> Survey No & SubLetter:</asp:Label>
                                                    </div>
                                         <div class="col-sm-05">
                                        <asp:Label ID="Label8" runat="server" Text="Label" style="font-size:15px;color:blue;"><span class="required-field"></span> Extent:</asp:Label>
                                                         </div>
                                                         </div>
                                    <div class="row">
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="TxtSNo" runat="server" placeholder="Survey No" style="width:112px;"></asp:TextBox>
                                        <asp:TextBox ID="TxtSL" runat="server" placeholder="SubLetter" style="width:112px;"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TxtSNo" ErrorMessage="Please Enter Only Numbers" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="TxtSNo" Display="Dynamic" ForeColor="Red"
                                             ErrorMessage="SurveyNumber is required"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-05" style="margin-left:4px;">
                                        <asp:TextBox ID="TxtAcr" runat="server" placeholder="Acres" style="width:60px;height:21px;"></asp:TextBox>
                                        <asp:TextBox ID="TxtGunt" runat="server" placeholder="Guntas" style="width:60px;height:21px;"></asp:TextBox>
                                        <asp:TextBox ID="TxtSqYds" runat="server" placeholder="Sq.Yds" style="width:60px;height:21px;"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TxtSqYds" ErrorMessage="Please Enter Only Numbers" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtAcr" ErrorMessage="Please Enter Only Numbers" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtGunt" ErrorMessage="Please Enter Only Numbers" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server"  Display="Dynamic" ValidateEmptyText="true" ForeColor="Red"
                                            ControlToValidate="TxtAcr" ErrorMessage="Please Enter Atleast One Extent" ClientValidationFunction="validateExtents"></asp:CustomValidator>
                                </div>
                                            </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Label ID="LblVillage" runat="server" Text="Label" style="font-size:15px;color:blue;"><span class="required-field"></span>  Village : </asp:Label>
                                        </div>
                                </div>
                                         <div class="row">
                                             <asp:DropDownList ID="DDLVillage" runat="server" DataSourceID="VgSqlDataSource" DataTextField="VillageName" AutoPostback="true" EnableViewState="true" AppendDataBoundItems="true" DataValueField="VillageCd" style="width:480px;height:21px;margin-left:15px;padding:2px;border-radius: 0px;border: 1px solid black" OnSelectedIndexChanged ="DDLVillage_SelectedIndexChanged">  
                <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
                </asp:DropDownList>  
                                             <asp:SqlDataSource ID="VgSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MILESTATESConnectionString %>" SelectCommand="select distinct VillageCd,VillageName from master.Village where IsActive = 1"></asp:SqlDataSource>
                                              <asp:RequiredFieldValidator ID="RFVVillage" runat="server" ErrorMessage="Please Select Village" ControlToValidate="DDLVillage" InitialValue="0" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Label ID="LblMandal" runat="server" Text="Label" style="font-size:15px;color:blue;"> <span class="required-field"></span>Mandal: </asp:Label>
                                        </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:DropDownList ID="DDLMandal" runat="server" style="width:480px;height:21px;" AutoPostback="true"  AppendDataBoundItems="true"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Label ID="LblDist" runat="server" Text="Label" style="font-size:15px;color:blue;"> <span class="required-field"></span>District: </asp:Label>
                                         </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:DropDownList ID="DDLDist" runat="server" style="width:480px;height:21px;" AutoPostback="true" ></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Label ID="LblState" runat="server" Text="Label" style="font-size:15px;color:blue;"> <span class="required-field"></span> State : </asp:Label>
                                          </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:DropDownList ID="DDLState" runat="server" style="width:480px;height:21px;" AutoPostback="true"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Label ID="LblDptn" runat="server" Text="Label" style="font-size:15px;color:blue;">Description:</asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5" >
                                <fieldset>
                                    <legend>Land Details</legend>
                                <div class="row">
                                    <div class="col-md-5">
                                   <asp:Label ID="LblTitleType" runat="server" Text="Label" style="font-size:15px;color:blue;"> <span class="required-field"></span> Land Title Type: </asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DDLLtt" runat="server" style="width:177px;">
                                            <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Lavani Patta" Value="LPTA"></asp:ListItem>
                                            <asp:ListItem Text="Patta" Value="PTA"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFVLandTitle" runat="server" ErrorMessage="Please Select LandTitleType" ControlToValidate="DDLLtt"  InitialValue="0" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            </div>
                                  <div class="row" style="margin-top:3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Lblowner" runat="server" Text="Label" style="font-size:15px;color:blue; margin-left:6px; padding-left:2px;">Ownership Type:</asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DDLOs" runat="server" style="width:177px;">
                                            <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Virasat" Value="VR" ></asp:ListItem>
                                            <asp:ListItem Text="Partition Deed" Value="PD"></asp:ListItem>
                                            <asp:ListItem Text="Gift Deed" Value="GD"></asp:ListItem>
                                            <asp:ListItem  Text=" Ex Service Man" Value="EXSER"></asp:ListItem>
                                            <asp:ListItem Text="Freedom Fighter" Value="FF"></asp:ListItem>
                                        </asp:DropDownList>
                            </div>
                            </div>
                                  <div class="row" style="margin-top:3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Label1" runat="server" Text="Label" style="font-size:15px;color:blue;"> <span class="required-field"></span> Doc/Patta No. : </asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TxtDocNo" runat="server" style=""></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFVDocNo" runat="server" ErrorMessage="Please Enter Document NO." ControlToValidate="TxtDocNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtDocNo" ErrorMessage="Please Enter Only Numbers" Display="Dynamic" ForeColor="Red" ValidationExpression="^(0|[1-9]\d*)$"></asp:RegularExpressionValidator>
                                        </div>
                            </div>
                                  <div class="row" style="margin-top:3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Label2" runat="server" Text="Label" style="font-size:15px;color:blue; margin-left:6px;padding-left:2px;">    Doc Date:  </asp:Label>
                                </div>
                                    <div class="col-md-6 ">
                                        <asp:TextBox ID="TxtDocDate" runat="server"  style="width:177px;"></asp:TextBox>
                            </div>
                            </div>
                                  <div class="row" style="margin-top:3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Label3" runat="server" Text="Label" style="font-size:15px;color:blue;"><span class="required-field"></span> Land Nature: </asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DdlLandNature"  runat="server" DataSourceID="LNSqlDataSource" DataTextField="LandNatureName" DataValueField="LandNatureCode" AppendDataBoundItems="true" style="width:177px; height:21px;padding:2px;border-radius: 0px;border: 1px solid black" >  
                <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
            </asp:DropDownList>  
                                             <asp:SqlDataSource ID="LNSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MILESTATESConnectionString %>" SelectCommand="select distinct LandNatureCode,LandNatureName from master.LandNature "></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="RFVLandNature" runat="server" ErrorMessage="Please Select LandNature" ControlToValidate="DdlLandNature" InitialValue="0" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            </div>
                                  <div class="row" style="margin-top:3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Label4" runat="server" Text="Label" style="font-size:15px;color:blue;"> <span class="required-field"></span> Land Use Zone: </asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DdlLandZone" CssClass="form-control" runat="server" DataSourceID="LzSqlDataSource" DataTextField="LandZoneName" DataValueField="LandZoneCode" AppendDataBoundItems="true" style="width:177px; height:21px;padding:2px;border-radius: 0px;border: 1px solid black;font-size:13px" >  
                <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
                       </asp:DropDownList>  
                                             <asp:SqlDataSource ID="LzSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MILESTATESConnectionString %>" SelectCommand="select distinct LandZoneCode,LandZoneName from master.LandZone "></asp:SqlDataSource>


                                        <asp:RequiredFieldValidator ID="RFVLandZone" runat="server" ErrorMessage="Please Select LandZone" ControlToValidate="DdlLandZone" InitialValue="0" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            </div>
                                  <div class="row" style="margin-top:3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Label5" runat="server" Text="Label" style="font-size:15px;color:blue; margin-left:6px;padding-left:2px;">Proceeding No:</asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TXTPNo" runat="server" placeholder="Enter proceding No:" style=""></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TXTPNo" ErrorMessage="Please Enter Only Numbers" Display="Dynamic" ForeColor="Red" ValidationExpression="^(0|[1-9]\d*)$"></asp:RegularExpressionValidator>
                                        
                            </div>
                            </div>
                                  <div class="row" style="margin-top:3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Label6" runat="server" Text="Label" style="font-size:15px; color:blue;"> <span class="required-field"></span> Spl.Category: </asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DdlSplCat" runat="server" style="width:177px;" DataSourceID="SplCatSqlDataSource">
                                        <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Assigned" Value="1" ></asp:ListItem>
                                            <asp:ListItem Text="PT" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="No PT" Value="3"></asp:ListItem>
                                            <asp:ListItem  Text=" 111 GO" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Catchment Area" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SplCatSqlDataSource" runat="server"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="RFVSplCat" runat="server" ErrorMessage="Please select Special Category" ControlToValidate="DdlSplCat" InitialValue="0" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            </div>
                                  <div class="row" style=" margin-top: 3px;">
                                    <div class="col-md-5">
                                   <asp:Label ID="Label7" runat="server" Text="Label" style="font-size:15px; color:blue;"><span class="required-field"></span> Type Of Purchase: </asp:Label>
                                </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DdlTypeOfPurchase" runat="server" style="width:177px;">
                                            <asp:ListItem Text="-Please Select-" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Sale Agreement" Value="SA" ></asp:ListItem>
                                            <asp:ListItem Text="Sale Deed" Value="SD"></asp:ListItem>
                                            <asp:ListItem Text="AGPA" Value="AGPA"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFVTPUR" runat="server" ErrorMessage="Please Select Type Of Purchase" ControlToValidate="DdlTypeOfPurchase" InitialValue="0" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
                            </div>
                            </div>
                                    </fieldset>
                                    </div>
                        </div>
                    </div>
                    </div>
                            <div class="row">
                               
                            <div class="col-md-12">
                                <asp:TextBox ID="TxtDescrip" runat="server" TextMode="MultiLine"  style="width:96%; margin-left:12px;margin-top:-22px"></asp:TextBox>
                            </div>
                        </div>
                    <div class="modal-footer">
                        <asp:Button ID="BtnLLsave" runat="server" Text="Save" class="btn btn-primary" OnClick="btnsave_Click"  />
                      <asp:Button ID="Btnclose" runat="server"  class="btn btn-danger" Text="Close"  CausesValidation="false"  OnClick="btnclose_Click"/>
                    </div>
                </div>
           </div>
        </div>
        </ContentTemplate>
        <Triggers>
    <asp:AsyncPostbackTrigger ControlID="DDLVillage" EventName="SelectedIndexChanged" />
</Triggers>
    </asp:UpdatePanel>
       <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-ui-1.13.2.min.js"></script>
    <script src="Scripts/jquery-ui-1.13.2.js"></script>
    <link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
      <script type="text/javascript">
          $(function () {
              $("#TxtDocDate").datepicker({
                  dateFormat: "dd/mm/yy"
              })

          });

          function openModal() {
              debugger;
              $('#loginmodal').modal('show');
          }

          function clearPopupInputs() {
              $('#Txtllname').val('');
              $('#TxtSNo').val('');
              $('#TxtSL').val('');
              $('#TxtAcr').val('');
              $('#TxtGunt').val('');
              $('#TxtSqYds').val('');
              $('#DDLVillage').val('');
              $('#DDLMandal').val('');
              $('#DdlLandZone').val('');
              $('#DDLLtt').val('');
              $('#DDLOs').val('');
              $('#TxtDocNo').val('');
              $('#TxtDocDate').val('');
              $('#DdlLandNature').val('');
              $('#DropDownList6').val('');
              $('#DdlSplCat').val('');
              $('#DdlTypeOfPurchase').val('');
              $('#TXTPNo').val('');
              $('#Txtllcode').val('');
              $('#Txtllname').val('');
              $('#TxtDescrip').val('');
          }
          $('.close').on('click', function () {
              debugger;
              clearPopupInputs();
          });

          function validateExtents(source, args) {
              try {
                  debugger;
                  var acres = $('#TxtAcr').val();
                  var gunts = $('#TxtGunt').val();
                  var sqYds = $('#TxtSqYds').val();
                  if (acres.trim() == '' && gunts.trim() == '' && sqYds.trim() == '') {
                      args.IsValid = false;
                  } else {
                      args.IsValid = true;
                  }
              } catch (err) {
                  console.error('Error in validateExtents:', err);
                  args.IsValid = false;
              }
          }
          </script>
        </form>
     
</body>
</html>
