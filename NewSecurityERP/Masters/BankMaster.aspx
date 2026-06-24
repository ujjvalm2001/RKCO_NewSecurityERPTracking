<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BankMaster.aspx.cs" Inherits="NewSecurityERP.Masters.BankMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Bank Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-4">
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtBankCode" class="form-label">Bank Code</label>
                                                <asp:TextBox ID="txtBankCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtBankName" class="form-label">Bank Name</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control" placeholder="Enter Bank Name..."></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVBank" runat="server"
                                                    ControlToValidate="txtBankName" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Bank Name !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtBranchName" class="form-label">Branch Name</label>
                                                <asp:TextBox ID="txtBranchName" runat="server" CssClass="form-control" MaxLength="20" placeholder="Enter Branch Name..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtAccountNo" class="form-label">Account No</label>
                                                <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control" MaxLength="20" placeholder="Enter Account No..."  onkeypress="return isNumeric(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtIFSCode" class="form-label">IFSC Code</label>
                                                <asp:TextBox ID="txtIFSCode" runat="server" CssClass="form-control" placeholder="Enter IFSC Code..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtAddress" class="form-label">Address</label>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address..." TextMode="MultiLine" Height="36"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtRemark" class="form-label">Remark</label>
                                                <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" placeholder="Enter Remark..." TextMode="MultiLine" Height="36"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div style="display: flex; justify-content: flex-end;">
                                            <div class="col-xxl-3 col-md-6" style="text-align: right">
                                                <div>
                                                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success waves-effect waves-light" Text="Save" OnClick="btnSave_Click" ValidationGroup="g1" />
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
                                <asp:GridView ID="gvBankMaster" runat="server" CssClass="BankMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%" AutoGenerateColumns="False" 
                                    OnRowCommand="gvBankMaster_RowCommand" OnRowDeleting="gvBankMaster_RowDeleting" OnRowUpdating="gvBankMaster_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("bankcode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="bankcode" HeaderText="Bank Code " SortExpression="" />
                                        <asp:BoundField DataField="bankname" HeaderText="Bank Name" SortExpression="" />
                                        <asp:BoundField DataField="BranchName" HeaderText="Branch Name" SortExpression="" />
                                        <asp:BoundField DataField="AccNo" HeaderText="Account No" SortExpression="" />
                                        <asp:BoundField DataField="IFSCode" HeaderText="IFSC Code" SortExpression="" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="" />
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
     <script type="text/javascript">
 $(document).ready(function () {
     var table = $(".BankMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
         dom: 'Bfrtip',
         buttons: [
             'copy', 'csv', 'excel', 'pdf', 'print'
         ]
     });
 });
 </script>
 <script>
     function isNumeric(evt) {
         var charCode = (evt.which) ? evt.which : event.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57)) {
             return false;
         }
         return true;
     }
 </script>
</asp:Content>
