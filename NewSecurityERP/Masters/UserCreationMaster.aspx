<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserCreationMaster.aspx.cs" Inherits="NewSecurityERP.Masters.UserCreationMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">User Creation Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row">

                                    <asp:HiddenField ID="HdnFieldUserCreationId" runat="server" Value="0" />
 
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-md-3 col-xxl-3">
                                                <div>
                                                    <label class="form-label">Employee Code</label>
                                                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control" placeholder="Enter Employee Code"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredField1" ControlToValidate="txtEmpCode" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Employee Code" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredField2" ControlToValidate="txtEmpCode" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Employee Code" ValidationGroup="GroupBtnShow"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-xxl-3" style="margin-top: 27px; margin-left: -12px;">
                                                <asp:Button ID="btnShow" type="button" runat="server" Text="Show" CssClass="btn btn-success waves-effect waves-light" ValidationGroup="GroupBtnShow" OnClick="btnShow_Click"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="border mt-3 mb-3 border-dashed"></div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">User Name</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter User Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter User Name" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">User ID</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" placeholder="Enter User ID"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserId" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter User Id" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">User Password</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtUserPass" runat="server" CssClass="form-control" placeholder="Enter User Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserPass" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter User Password" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">User Type</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-select" AutoPostBack="false">
                                                <asp:ListItem Selected="True" disabled="" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="User">User</asp:ListItem>
                                                <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                                                <asp:ListItem Value="SuperAdministrator">SuperAdministrator</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlUserType" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select User Type" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Status</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select" AutoPostBack="false">
                                                <asp:ListItem Selected="True" disabled="" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                                <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlStatus" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select User Status" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Email ID</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtUserEmailId" runat="server" CssClass="form-control" placeholder="Enter Email ID"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUserEmailId" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter User Email ID" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Mobile No.</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter User Mobile Number" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>



                                    <div class="hstack gap-2 justify-content-end">
                                        <asp:Button ID="ClearBtn" type="button" runat="server" OnClick="ClearBtn_Click" Text="Clear" class="btn btn-danger"></asp:Button>
                                        <asp:Button ID="SaveBtn" type="button" runat="server" OnClick="SaveBtn_Click" Text="Save" ValidationGroup="Group1" class="btn btn-success"></asp:Button>
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
                                <asp:GridView ID="gvUserCreationMaster" runat="server" AutoGenerateColumns="False" CssClass="UserCreationMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvUserCreationMaster_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditUser" CommandArgument='<%# Eval("ID")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="EmpCode" HeaderText="Employee Code" SortExpression="" />
                                        <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="" />
                                        <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="" />
                                        <asp:BoundField DataField="UserPassword" HeaderText="Password" SortExpression="" />
                                        <asp:BoundField DataField="UserType" HeaderText="User Type" SortExpression="" />
                                        <asp:BoundField DataField="ActiveStatus" HeaderText="Status" SortExpression="" />
                                        <asp:BoundField DataField="EmailId" HeaderText="Email Id" SortExpression="" />
                                        <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" SortExpression="" />
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
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $(".UserCreationMaster").prepend($("<thead></thead>").append($(".UserCreationMaster").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</asp:Content>
