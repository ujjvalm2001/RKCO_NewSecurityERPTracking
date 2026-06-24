<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PFZoneMaster.aspx.cs" Inherits="NewSecurityERP.Masters.PFZoneMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main-content overflow-hidden">
     <div class="page-content">
         <div class="container-fluid">
             <div class="row">
                 <div class="col-lg-12">
                     <div class="card">
                         <div class="card-header align-items-center d-flex">
                             <h5 class="card-title mb-0 flex-grow-1">PF Zone Master</h5>
                         </div>
                         <!-- end card header -->
                         <div class="card-body">
                             <div class="live-preview">
                                 <div class="row gy-4">
                                     <div class="col-xxl-3 col-md-6">
                                         <div>
                                             <label for="txtPFCode" class="form-label">PF Code</label>
                                             <asp:TextBox ID="txtPFCode" runat="server" CssClass="form-control" Enabled="False">
                                             </asp:TextBox>
                                         </div>
                                     </div>
                                     <!--end col-->
                                     <div class="col-xxl-3 col-md-6">
                                         <div>
                                             <label for="txtPFName" class="form-label">PF Name</label><span class="text-danger">*</span>
                                             <asp:TextBox ID="txtPFName" runat="server" CssClass="form-control" placeholder="Enter PF Name..."></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RFVPFName" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtPFName"
                                                 ErrorMessage="Please Enter the PF Name !!!" ValidationGroup="g1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                         </div>
                                     </div>
                                     <!--end col-->
                                     <div class="col-xxl-3 col-md-6">
                                         <div>
                                             <label for="txtPFEsttSubCode" class="form-label">PF Estt. Sub Code</label>
                                             <asp:TextBox ID="txtPFEsttSubCode" runat="server" CssClass="form-control" placeholder="Enter PF Estt. Sub Code..."></asp:TextBox>
                                         </div>
                                     </div>
                                     <!--end col-->
                                     <div class="col-xxl-3 col-md-6">
                                         <div>
                                             <label for="txtAddress" class="form-label">Address</label>
                                             <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Enter Address..." TextMode="MultiLine" Height="36"></asp:TextBox><%--OnKeyPress="return chkAlpha();"--%>
                                         </div>
                                     </div>
                                     <div class="col-xxl-3 col-md-6">
                                         <div>
                                             <label for="txtRemark" class="form-label">Remarks</label>
                                             <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" Placeholder="Enter Remarks..." TextMode="MultiLine" Height="36"></asp:TextBox>
                                         </div>
                                     </div>
                                     <!--end col-->

                                     <div style="display: flex; justify-content: flex-end;">
                                         <div class="col-xxl-3 col-md-6" style="text-align: right">
                                             <div>
                                                 <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success waves-effect waves-light" Text="Save" ValidationGroup="g1" OnClick="btnSave_Click" />
                                                 <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger waves-effect waves-light" Text="Clear" OnClick="btnCancel_Click" />
                                             </div>
                                         </div>
                                     </div>

                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <!--end col-->
             </div>

             <div class="row">
                 <div class="col-lg-12">
                     <div class="card">

                         <div class="card-body">
                             <asp:GridView ID="gvPFMaster" runat="server" AutoGenerateColumns="False" CssClass="PFMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                  OnRowCommand="gvPFMaster_RowCommand" OnRowDeleting="gvPFMaster_RowDeleting" OnRowUpdating="gvPFMaster_RowUpdating">
                                 <Columns>
                                     <asp:TemplateField HeaderText="Sr. No.">
                                         <ItemTemplate>
                                             <%# Container.DataItemIndex + 1 %>
                                         </ItemTemplate>
                                         <HeaderStyle CssClass="text-center" />
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="action">
                                         <ItemTemplate>
                                             <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("PFCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                             <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="PFCode" HeaderText="PF Code " SortExpression="" />
                                     <asp:BoundField DataField="PFName" HeaderText="PF Name" SortExpression="" />
                                     <asp:BoundField DataField="PFEsttCode" HeaderText="PF Estt. Code" SortExpression="" />
                                     <asp:BoundField DataField="LocalOffice" HeaderText="Local Office" SortExpression="" />
                                     <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="" />
                                 </Columns>
                                 <EmptyDataTemplate>
                                     <div align="center">No records found.</div>
                                 </EmptyDataTemplate>
                             </asp:GridView>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavaScript" runat="server">
</asp:Content>
