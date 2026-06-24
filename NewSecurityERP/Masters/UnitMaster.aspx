<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UnitMaster.aspx.cs" Inherits="NewSecurityERP.Masters.UnitMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Unit Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row">

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="row">
                                                <div class="col-md-9 col-xxl-9">
                                                    <div>
                                                        <label class="form-label">Unit Code</label>
                                                        <asp:TextBox ID="txtUnitCode" runat="server" CssClass="form-control" Placeholder="Enter Unit Code"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredField1" ControlToValidate="txtUnitCode" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Unit Code" ValidationGroup="VerifyUnitCode"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-xxl-3" style="margin-top: 27px; margin-left: -12px;">
                                                    <asp:Button ID="btnShow" type="button" runat="server" Text="Show" CssClass="btn btn-success waves-effect waves-light" ValidationGroup="VerifyUnitCode" OnClick="btnShow_Click" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Client Name</label><span class="text-danger">*</span>
                                                <asp:DropDownList ID="ddlClient" runat="server" CssClass="form-control"> </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label for="txtUnitName" class="form-label">Unit Name</label><span class="text-danger">*</span>
                                                <%--<asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control"> </asp:DropDownList>--%>
                                                  <asp:TextBox ID="txtUnitName" runat="server" CssClass="form-control" Placeholder="Enter Unit Name"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label for="txtStatus" class="form-label">Status</label><span class="text-danger">*</span>
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="-- Select Status --" Value="" />
                                                    <asp:ListItem Text="Active" Value="Active" />
                                                    <asp:ListItem Text="InActive" Value="InActive" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label for="txtLocation" class="form-label">Location</label>
                                                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Location..." ></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->                                       

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Longitude</label>
                                                <asp:TextBox ID="txtLongitude" runat="server" CssClass="form-control" placeholder="Longitude"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Latitude</label>
                                                <asp:TextBox ID="txtLatitude" runat="server" CssClass="form-control" placeholder="Latitude" ></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person1</label>
                                                <asp:TextBox ID="txtContactPerson1" runat="server" CssClass="form-control" placeholder="Enter Contact Person Name..."></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person1 Phone No </label>
                                                <asp:TextBox ID="txtCP1Phone" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter Phone No..." onkeypress="return isNumeric(event)"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person1 Email ID</label>
                                                <asp:TextBox ID="txtCP1Email" runat="server" CssClass="form-control" placeholder="Enter Email ID...">
                                                </asp:TextBox>
                                                <asp:RegularExpressionValidator ID="REVEmailID" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter EmailID In Correct Format !!!" ControlToValidate="txtCP1Email" ValidationGroup="g1"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person2</label>
                                                <asp:TextBox ID="txtContactPerson2" runat="server" CssClass="form-control" placeholder="Enter Contact Person Name..."></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person2 Phone No </label>
                                                <asp:TextBox ID="txtCP2Phone" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter Phone No..." onkeypress="return isNumeric(event)"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person2 Email ID</label>
                                                <asp:TextBox ID="txtCP2Email" runat="server" CssClass="form-control" placeholder="Enter Email ID...">
                                                </asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter EmailID In Correct Format !!!" ControlToValidate="txtCP2Email" ValidationGroup="g1"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person3</label>
                                                <asp:TextBox ID="txtContactPerson3" runat="server" CssClass="form-control" placeholder="Enter Contact Person Name..."></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person3 Phone No </label>
                                                <asp:TextBox ID="txtCP3Phone" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter Phone No..." onkeypress="return isNumeric(event)"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Contact Person3 Email ID</label>
                                                <asp:TextBox ID="txtCP3Email" runat="server" CssClass="form-control" placeholder="Enter Email ID...">
                                                </asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter EmailID In Correct Format !!!" ControlToValidate="txtCP3Email" ValidationGroup="g1"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                         <div class="col-xxl-12 col-md-6">
                                            <div class="mb-3">
                                                <label for="txtAddress" class="form-label">Address</label>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"  TextMode="MultiLine"  placeholder="Enter Address..."></asp:TextBox>
                                            </div>
                                        </div>

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
                                <asp:GridView ID="gvUnitMaster" runat="server" AutoGenerateColumns="False" CssClass="UnitMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%" OnRowCommand="gvUnitMaster_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="editUnit" CommandArgument='<%# Eval("UnitCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="UnitCode" HeaderText="Unit Code " SortExpression="" />
                                        <asp:BoundField DataField="UnitName" HeaderText="Unit Name" SortExpression="" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="" />
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="" />
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
            var table = $(".UnitMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
