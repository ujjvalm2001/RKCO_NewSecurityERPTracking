<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ESIZoneMaster.aspx.cs" Inherits="NewSecurityERP.Masters.ESIZoneMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">ESI Zone Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-4">
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtZoneCode" class="form-label">Zone Code</label>
                                                <asp:TextBox ID="txtZoneCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtZoneName" class="form-label">Zone Name</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtZoneName" runat="server" CssClass="form-control" placeholder="Enter Zone Name..."></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVZone" runat="server"
                                                    ControlToValidate="txtZoneName" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Zone Name !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtEsttCode" class="form-label">Estt. Sub Code</label>
                                                <asp:TextBox ID="txtEsttCode" runat="server" CssClass="form-control" MaxLength="20" placeholder="Enter Estt. Sub Code..." onkeypress="return isNumeric(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtAddress" class="form-label">ESI Local Office Address</label>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Local Office..." TextMode="MultiLine" Height="36"></asp:TextBox>
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
                                <asp:GridView ID="gvESIZoneMaster" runat="server" CssClass="ESIZoneMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%" AutoGenerateColumns="False" OnRowCommand="gvESIZoneMaster_RowCommand" OnRowDeleting="gvESIZoneMaster_RowDeleting"
                                    OnRowUpdating="gvESIZoneMaster_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("ZoneCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ZoneCode" HeaderText="Zone Code " SortExpression="" />
                                        <asp:BoundField DataField="ZoneName" HeaderText="Zone Name" SortExpression="" />
                                        <asp:BoundField DataField="EsttCode" HeaderText="Estt Code" SortExpression="" />
                                        <asp:BoundField DataField="LocalOffice" HeaderText="Local Office" SortExpression="" />
                                        <asp:BoundField DataField="ZoneRemark" HeaderText="Zone Remark" SortExpression="" />
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
         var table = $(".ESIZoneMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
