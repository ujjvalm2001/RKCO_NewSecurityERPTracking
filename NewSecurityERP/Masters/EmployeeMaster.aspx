<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeMaster.aspx.cs" Inherits="NewSecurityERP.Masters.EmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h5 class="card-title mb-0 flex-grow-1">Employee Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-3">

                                        <div class="col-xxl-3 col-md-6">
                                            <div class="row">
                                                <div class="col-md-9 col-xxl-9">
                                                    <div>
                                                        <label class="form-label">Employee Code</label>
                                                        <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control" placeholder="Enter Employee Code"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredField1" ControlToValidate="txtEmpCode" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Employee Code" ValidationGroup="VerifyEmpCode"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-xxl-3" style="margin-top: 27px; margin-left: -12px;">
                                                    <asp:Button ID="btnShow" type="button" runat="server" Text="Show" CssClass="btn btn-success waves-effect waves-light" ValidationGroup="VerifyEmpCode" OnClick="btnShow_Click" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtEmpName" class="form-label">Employee Name</label>
                                                <asp:TextBox ID="txtEmpName" runat="server" CssClass="form-control" placeholder="Enter Employee Name" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="ddlStatus" class="form-label">Status</label><span class="text-danger">*</span>
                                                <asp:DropDownList  ID="ddlStatus" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="-- Select Status --" Value="" />
                                                    <asp:ListItem Text="Active" Value="Active" /> 
                                                    <asp:ListItem Text="InActive" Value="InActive" /></asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtEmpFName" class="form-label">Father Name</label>
                                                <asp:TextBox ID="txtEmpFName" runat="server" CssClass="form-control" placeholder="Enter Employee Father Name" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="lblGender" class="form-label">Gender</label><span class="text-danger">*</span>
                                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="-- Select Gender --" Value="" />
                                                    <asp:ListItem Text="Male" Value="Male" />
                                                    <asp:ListItem Text="Female" Value="Female" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtdoj" class="form-label">Date of Joining</label>
                                                <asp:TextBox ID="txtdoj" runat="server" Type="date" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtbranch" class="form-label">Branch </label>
                                                <span class="text-danger">*</span>
                                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtDepartment" class="form-label">Department </label>
                                                <span class="text-danger">*</span>
                                                 <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                                 </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtDesignation" class="form-label">Designation </label>
                                                <span class="text-danger">*</span>
                                                <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="lblUserType" class="form-label">UserType</label><span class="text-danger">*</span>
                                                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="-- Select UserType --" Value="" />
                                                    <asp:ListItem Text="Administrator" Value="Administrator" />
                                                    <asp:ListItem Text="User" Value="User" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="chkSupervisor" class="form-label">IS Supervisor </label>
                                                <asp:CheckBox ID="chkSupervisor" runat="server" CssClass="form-control"  Checked="true"  />
                                            </div>
                                        </div>
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <asp:Label ID="lblReportingTo" runat="server" AssociatedControlID="lstUserAdmin" CssClass="form-label" Text="Reporting To"></asp:Label>
                                                <asp:ListBox
                                                    runat="server"
                                                    ID="lstUserAdmin"
                                                    SelectionMode="Multiple"
                                                    CssClass="selectpicker form-control"
                                                    data-selected-text-format="count"
                                                    data-live-search="true"
                                                    data-actions-box="true"
                                                    AutoPostBack="false"></asp:ListBox>
                                            </div>
                                        </div>
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="chkIsUser" class="form-label">IS User </label>
                                                <asp:CheckBox ID="chkIsUser" runat="server" CssClass="form-control" Checked="false" AutoPostBack="true" OnCheckedChanged="chkIsUser_CheckedChanged" />
                                            </div>
                                        </div>
                                        <div id="divUserName" class="col-xxl-3 col-md-6" runat="server" visible="false">
                                            <div>
                                                <label for="txtUserName" class="form-label">UserName </label>
                                                <span class="text-danger">*</span>
                                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"  placeholder="Enter User Name"  ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div id="divUserPass" class="col-xxl-3 col-md-6" runat="server" visible="false">
                                            <div>
                                                <label for="txtUserPass" class="form-label">Password </label>
                                                <span class="text-danger">*</span>
                                                <asp:TextBox ID="txtUserPass" runat="server" CssClass="form-control" placeholder="Enter User Password" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div style="display: flex; justify-content: flex-end;">
                                            <div class="col-xxl-3 col-md-6" style="text-align: right">
                                                <div>
                                                    <asp:HiddenField  ID="IsEditFlag" runat="server"/>
                                                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success waves-effect waves-light" Text="Save" OnClick="btnSave_Click" ValidationGroup="g1" />
                                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger waves-effect waves-light" OnClick="btnCancel_Click" Text="Clear" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <asp:GridView ID="gvEMPMaster" runat="server" AutoGenerateColumns="False" CssClass="EmployeeMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvEMPMaster_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditEmpMaster" CommandArgument='<%# Eval("EmpCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Empcode" HeaderText="Employee Code " SortExpression="" />
                                        <asp:BoundField DataField="Empname" HeaderText="Employee Name" SortExpression="" />
                                        <asp:BoundField DataField="EmpStatus" HeaderText="Status" SortExpression="" />
                                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="" />
                                        <asp:TemplateField HeaderText="Supervisor">
                                            <ItemTemplate>
                                                <%# Convert.ToBoolean(Eval("IsSupervisor")) ? "Yes" : "No" %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div align="center">No data available in table</div>
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
     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
           
            var table = $(".EmployeeMaster").prepend($("<thead></thead>").append($(".EmployeeMaster").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</asp:Content>
