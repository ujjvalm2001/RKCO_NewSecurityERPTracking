<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UnitWiseTaskManagment.aspx.cs" Inherits="NewSecurityERP.Transaction.UnitWiseTaskManagment" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">UnitWise Task Management</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row">

                                    <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />


                                    <div class="col-md-4 mb-3">
                                        <label class="form-label">Branch</label><span class="text-danger">*</span>
                                        <div class="pb-3 d-flex align-items-center">
                                            <div class="text-center">
                                                <span style="display: inline-block; height: 22px; width: 44px; margin-left: 11px;">
                                                    <asp:CheckBox ID="chkBranchAll" runat="server" onclick="Check_GridviewBranch(this)" />
                                                </span>
                                            </div>
                                            <div class="ms-auto">
                                                <asp:Label runat="server">Search</asp:Label>
                                                <asp:TextBox ID="TextBox1" runat="server" onkeyup="Search_GridviewBranch(this, 'gvBranch');"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div id="BranchDiv" style="height: 240px; overflow-y: auto;">
                                            <asp:Panel ID="PanelBranch" runat="server">
                                                <asp:GridView ID="gvBranch" CssClass="table table-striped" runat="server"
                                                    AutoGenerateColumns="False" ShowHeader="false"
                                                    AllowPaging="false" DataKeyNames="branchcode" ShowFooter="false" EmptyDataText="Record Not Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkBranch" runat="server" Height="22px" Width="44px" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="ClassGv" HorizontalAlign="Center" Width="50px" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="branchcode" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBranchCode" Width="16px" runat="server" Text='<%# Eval("branchcode") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Branch Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBranchName" runat="server" Text='<%# Eval("branchcode") + " - " + Eval("branchname") %>' Width="222px"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                        <div class="text-start mt-2">
                                            <asp:Button ID="BtnGetUnits" runat="server" Text="Get Units" OnClick="BtnGetUnits_Click" CssClass="btn btn-primary" />
                                        </div>
                                    </div>


                                    <div class="col-md-4 mb-3" id="UnitDiv" runat="server" visible="false">
                                        <label class="form-label">Unit</label><span class="text-danger">*</span>
                                        <div class="pb-3 d-flex align-items-center">
                                            <div class="text-center">
                                                <span style="display: inline-block; height: 22px; width: 44px; margin-left: 11px;">
                                                    <asp:CheckBox ID="chkUnitAll" runat="server" onclick="Check_GridviewUnit(this)" />
                                                </span>
                                            </div>
                                            <div class="ms-auto">
                                                <asp:Label runat="server">Search</asp:Label>
                                                <asp:TextBox ID="TextBox2" runat="server" onkeyup="Search_GridviewUnit(this, 'gvUnit');"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div id="UnitGridViewDiv" style="height: 240px; overflow-y: scroll;">
                                            <asp:Panel ID="PanelUnit" runat="server">
                                                <asp:GridView ID="gvUnit" CssClass="table table-striped" runat="server"
                                                    AutoGenerateColumns="False" ShowHeader="false"
                                                    AllowPaging="false" DataKeyNames="unitcode" ShowFooter="false" EmptyDataText="Record Not Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkUnit" runat="server" Height="22px" Width="44px" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="ClassGv" HorizontalAlign="Center" Width="50px" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="unitcode" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUnitCode" Width="16px" runat="server" Text='<%# Eval("unitcode") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Unit Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUnitName" runat="server" Text='<%# Eval("unitcode") + " - " + Eval("unitname") %>' Width="222px"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-3">
                                        <label class="form-label">Task</label><span class="text-danger">*</span>
                                        <div class="pb-3 d-flex align-items-center">
                                            <div class="text-center">
                                                <span style="display: inline-block; height: 22px; width: 44px; margin-left: 11px;">
                                                    <asp:CheckBox ID="chkTaskAll" runat="server" onclick="Check_GridviewTask(this)" />
                                                </span>
                                            </div>
                                            <div class="ms-auto">
                                                <asp:Label runat="server">Search</asp:Label>
                                                <asp:TextBox ID="TextBox3" runat="server" onkeyup="Search_GridviewTask(this, 'gvTask');"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div id="TaskDiv" style="height: 240px; overflow-y: scroll;">

                                            <asp:Panel ID="PanelTask" runat="server">
                                                <asp:GridView ID="gvTask" CssClass="table table-striped" runat="server"
                                                    AutoGenerateColumns="False" ShowHeader="false"
                                                    AllowPaging="false" DataKeyNames="Taskcode" ShowFooter="false" EmptyDataText="Record Not Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkTask" runat="server" Height="22px" Width="44px" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="ClassGv" HorizontalAlign="Center" Width="50px" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Task Code" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTaskCode" Width="16px" runat="server" Text='<%# Eval("Taskcode") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Task Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("Taskcode") + " - " + Eval("Taskname") %>' Width="222px"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                        <div class="text-start mt-2">
                                            <asp:Button ID="BtnGetQuestions" runat="server" Text="Get Questions" OnClick="BtnGetQuestions_Click" CssClass="btn btn-primary" />
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-3" id="QuestionsDiv" runat="server" visible="false">
                                        <label class="form-label">Questions</label><span class="text-danger">*</span>
                                        <div class="pb-3 d-flex align-items-center">
                                            <div class="text-center">
                                                <span style="display: inline-block; height: 22px; width: 44px; margin-left: 11px;">
                                                    <asp:CheckBox ID="chkQuestionAll" runat="server" onclick="Check_GridviewQuestion(this)" />
                                                </span>
                                            </div>
                                            <div class="ms-auto">
                                                <asp:Label runat="server">Search</asp:Label>
                                                <asp:TextBox ID="TextBox4" runat="server" onkeyup="Search_GridviewQuestion(this, 'gvQuestion');"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div id="QuesGridViewDiv" style="height: 240px; overflow-y: scroll;">
                                            <asp:Panel ID="PanelQuestion" runat="server">
                                                <asp:GridView ID="gvQuestion" CssClass="table table-striped" runat="server"
                                                    AutoGenerateColumns="False" ShowHeader="false"
                                                    AllowPaging="false" DataKeyNames="QuesId" ShowFooter="false" EmptyDataText="Record Not Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkQuestion" runat="server" Height="22px" Width="44px" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="ClassGv" HorizontalAlign="Center" Width="50px" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Question Id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblQuestionId" Width="16px" runat="server" Text='<%# Eval("QuesId") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-Height="15px" HeaderText="Task Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("QuesId") + " - " + Eval("Question") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
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
                                <asp:GridView ID="gvUnitWiseTask" runat="server" AutoGenerateColumns="False" CssClass="UnitWiseTask table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvUnitWiseTask_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditUnitWiseTask" CommandArgument='<%# Eval("TaskManagementID")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="BranchCode" HeaderText="Branch Code " SortExpression="" />
                                        <asp:BoundField DataField="unitCode" HeaderText="Unit Code" SortExpression="" />
                                        <asp:BoundField DataField="TaskCode" HeaderText="Task Code" SortExpression="" />
                                        <asp:BoundField DataField="QuestionID" HeaderText="Question ID" SortExpression="" />
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
            var table = $(".UnitWiseTask").prepend($("<thead></thead>").append($(".UnitWiseTask").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>

    <script>

        // CheckBox And Search Function For Branch
        function Check_GridviewBranch(strKey) {
            debugger;
            if ($('#<%= chkBranchAll.ClientID %>').is(":checked")) {
                $('#<%= gvBranch.ClientID %>').find("[type='checkbox']").prop('checked', true);
            }
            else {
                $('#<%= gvBranch.ClientID %>').find("[type='checkbox']").prop('checked', false);
            }
        }

        function Search_GridviewBranch(strKey) {
            debugger;
            var strData = strKey.value.toLowerCase().split(" ");
            var Grid = "<%=gvBranch.ClientID%>";
            var tblData = document.getElementById(Grid);
            var rowData;
            for (var i = 0; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerText;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
            var Grid = "<%=gvBranch.ClientID%>";
        }

        // CheckBox And Search Function For Unit
        function Check_GridviewUnit(strKey) {
            debugger;
            if ($('#<%= chkUnitAll.ClientID %>').is(":checked")) {
                $('#<%= gvUnit.ClientID %>').find("[type='checkbox']").prop('checked', true);
            }
            else {
                $('#<%= gvUnit.ClientID %>').find("[type='checkbox']").prop('checked', false);
            }
        }

        function Search_GridviewUnit(strKey) {
            debugger;
            var strData = strKey.value.toLowerCase().split(" ");
            var Grid = "<%=gvUnit.ClientID%>";
            var tblData = document.getElementById(Grid);
            var rowData;
            for (var i = 0; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerText;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
            var Grid = "<%=gvUnit.ClientID%>";
        }

        // CheckBox And Search Function For Task
        function Check_GridviewTask(strKey) {
            debugger;
            if ($('#<%= chkTaskAll.ClientID %>').is(":checked")) {
                $('#<%= gvTask.ClientID %>').find("[type='checkbox']").prop('checked', true);
            }
            else {
                $('#<%= gvTask.ClientID %>').find("[type='checkbox']").prop('checked', false);
            }
        }

        function Search_GridviewTask(strKey) {
            debugger;
            var strData = strKey.value.toLowerCase().split(" ");
            var Grid = "<%=gvTask.ClientID%>";
            var tblData = document.getElementById(Grid);
            var rowData;
            for (var i = 0; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerText;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
            var Grid = "<%=gvTask.ClientID%>";
        }

        // CheckBox And Search Function For Question
        function Check_GridviewQuestion(strKey) {
            debugger;
            if ($('#<%= chkQuestionAll.ClientID %>').is(":checked")) {
                $('#<%= gvQuestion.ClientID %>').find("[type='checkbox']").prop('checked', true);
            }
            else {
                $('#<%= gvQuestion.ClientID %>').find("[type='checkbox']").prop('checked', false);
            }
        }

        function Search_GridviewQuestion(strKey) {
            debugger;
            var strData = strKey.value.toLowerCase().split(" ");
            var Grid = "<%=gvQuestion.ClientID%>";
            var tblData = document.getElementById(Grid);
            var rowData;
            for (var i = 0; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerText;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
            var Grid = "<%=gvQuestion.ClientID%>";
        }
    </script>

</asp:Content>
