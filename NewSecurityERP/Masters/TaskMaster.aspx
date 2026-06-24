<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TaskMaster.aspx.cs" Inherits="NewSecurityERP.Masters.TaskMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Task Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Task Code</label>
                                            <asp:TextBox ID="txtTaskCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Task Name</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtTaskName" runat="server" CssClass="form-control" placeholder="Enter Task Name..."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTaskName" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Task Name" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Do you want to send mail?</label>
                                            <asp:RadioButtonList ID="rblSendMail" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">Yes &nbsp &nbsp </asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Do you want to send SMS?</label>
                                            <asp:RadioButtonList ID="rblSendSMS" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">Yes &nbsp &nbsp </asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                    <div class="hstack gap-2 justify-content-end">
                                        <asp:Button ID="ClearBtn" runat="server" OnClick="ClearBtn_Click" Text="Clear" type="button" class="btn btn-danger"></asp:Button>
                                        <asp:Button ID="SaveBtn" runat="server" OnClick="SaveBtn_Click" ValidationGroup="Group1" Text="Save" type="button" class="btn btn-success"></asp:Button>                                        
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
                                 <asp:GridView ID="gvTaskMaster" runat="server" AutoGenerateColumns="False" CssClass="TaskMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvTaskMaster_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditTask" CommandArgument='<%# Eval("Taskcode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Taskcode" HeaderText="Task Code " SortExpression="" />
                                        <asp:BoundField DataField="Taskname" HeaderText="Task Name" SortExpression="" />
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
            var table = $(".TaskMaster").prepend($("<thead></thead>").append($(".TaskMaster").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</asp:Content>
