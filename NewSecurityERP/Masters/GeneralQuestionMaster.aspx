<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GeneralQuestionMaster.aspx.cs" Inherits="NewSecurityERP.Masters.GeneralQuestionMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">General Question Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row" id="optionContainer" runat="server">
                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Question ID</label>
                                            <asp:TextBox ID="txtQuesID" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Question</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control" placeholder="Enter Sub Task Question"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQuestion" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Sub Task Question" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Is Image Required</label>
                                            <asp:RadioButtonList ID="rblImage" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">Yes &nbsp &nbsp </asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Is Audio Required</label>
                                            <asp:RadioButtonList ID="rblAudio" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">Yes &nbsp &nbsp </asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Is Video Required</label>
                                            <asp:RadioButtonList ID="rblVideo" runat="server" AutoPostBack="false" CssClass="form-control" Height="36px" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">Yes &nbsp &nbsp </asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Question Type</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlQuesType" runat="server" CssClass="form-select" AutoPostBack="false">
                                                <asp:ListItem Selected="True" disabled="" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="Text">Text</asp:ListItem>
                                                <asp:ListItem Value="Single-Select">Single Option Select</asp:ListItem>
                                                <asp:ListItem Value="Multi-Select">Multi Option Select</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlQuesType" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select a value" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Question Category</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlQSCategory" runat="server" CssClass="form-select" AutoPostBack="false">
                                                <asp:ListItem Selected="True" disabled="" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="NS">New Site</asp:ListItem>
                                                <asp:ListItem Value="OS">Old Site</asp:ListItem>
                                                <asp:ListItem Value="OTH">Other</asp:ListItem>
                                                <asp:ListItem Value="MKT">Marketing</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlQSCategory" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select a value" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3 option d-none" id="option1">
                                        <div class="mb-3">
                                            <label class="form-label">Option 1</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtOption1" runat="server" CssClass="form-control" placeholder="Enter Sub Task Question"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOption1" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Option Text" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>

                                    <div class="col-md-3 option d-none" id="option2">
                                        <div class="mb-3">
                                            <label class="form-label">Option 2</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtOption2" runat="server" CssClass="form-control" placeholder="Enter Sub Task Question"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtOption2" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Option Text" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>

                                    <div class="col-md-3 mt-auto d-none" id="optionButton">
                                        <div class="mb-3">
                                            <asp:Button ID="AddOptionBtn" runat="server" Text="Add Option" OnClientClick="return addOption();" CssClass="btn btn-primary" />
                                        </div>
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
                            <asp:GridView ID="gvSubTaskMaster" runat="server" AutoGenerateColumns="False" CssClass="SubTaskMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                OnRowCommand="gvSubTaskMaster_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr. No.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="text-center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditQuestion" CommandArgument='<%# Eval("GQuesID")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="GQuesID" HeaderText="Question Id " SortExpression="" />
                                    <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="" />
                                    <asp:BoundField DataField="QuestionOptions" HeaderText="Options" SortExpression="" />
                                    <asp:BoundField DataField="QuestionType" HeaderText="Question Type" SortExpression="" />
                                     <asp:BoundField DataField="QuestionFor" HeaderText="Question Cat." SortExpression="" />
                                    <asp:BoundField DataField="IsImage" HeaderText="Image" SortExpression="" />
                                    <asp:BoundField DataField="IsAudio" HeaderText="Audio" SortExpression="" />
                                    <asp:BoundField DataField="IsVideo" HeaderText="Video" SortExpression="" />
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
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavaScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $(".SubTaskMaster").prepend($("<thead></thead>").append($(".SubTaskMaster").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {

            //$("#option1").addClass("d-none");
            //$("#option2").addClass("d-none");

            $('#<%= ddlQuesType.ClientID %>').change(function () {
                var selectedValue = $(this).val();
                if (selectedValue === "Text") {
                    $('#<%= txtOption1.ClientID %>').val('');
                    $('#<%= txtOption2.ClientID %>').val('');
                    $("#option1").addClass("d-none");
                    $("#option2").addClass("d-none");
                    $("#optionButton").addClass("d-none");

                } else {
                    $("#option1").removeClass("d-none");
                    $("#option2").removeClass("d-none");
                    $("#optionButton").removeClass("d-none");
                }
            });
        });
    </script>

    // script to generate or remove the option input.
    <script type="text/javascript">
        // function to add option Input Div On add Option Button click.
        function addOption() {
            var optionContainer = document.getElementById("<%= optionContainer.ClientID %>");
            var optionCount = optionContainer.getElementsByClassName("option").length + 1;

            var div = document.createElement("div");
            div.className = "col-md-3 option";
            div.innerHTML = '<div class="mb-3">' +
                '<label class="form-label">Option ' + optionCount + '</label> <span class="text-danger float-end cursor-pointer" onclick="removeOption(this)">Remove</span>' +
                '<input type="text" id="txtOption_' + optionCount + '" name="txtOption_' + optionCount + '" class="form-control" placeholder="Enter Option" />' +
                '</div>';

            var addOptionBtnDiv = document.getElementById("optionButton");
            optionContainer.insertBefore(div, addOptionBtnDiv);
            return false; // Prevent postback
        }

        // function to remove the option input on Remove Button Click.
        function removeOption(element) {
            var optionDiv = element.parentNode.parentNode;
            optionDiv.parentNode.removeChild(optionDiv);
            updateOptionLabels(); // Update option labels after removing
        }

        // function to update the label and input id text when user remove any generated options.
        function updateOptionLabels() {
            var optionContainer = document.getElementById("<%= optionContainer.ClientID %>");
            var options = optionContainer.getElementsByClassName("option");
            for (var i = 0; i < options.length; i++) {
                var optionCount = i + 1;
                options[i].querySelector('.form-label').textContent = 'Option ' + optionCount;
                var inputField = options[i].querySelector('input[type="text"]');
                inputField.id = 'txtOption_' + optionCount;
                inputField.name = 'txtOption_' + optionCount;
                options[i].querySelector('.text-danger').setAttribute('data-option-index', optionCount);
            }
        }

        // function to show or hide the option inputs and add option button according to the question type from server side.
        function ShowHideOptionInput(QuesType) {
            if (QuesType == "Text") {
                $("#option1").addClass("d-none");
                $("#option2").addClass("d-none");
                $("#optionButton").addClass("d-none");
            } else {
                $("#option1").removeClass("d-none");
                $("#option2").removeClass("d-none");
                $("#optionButton").removeClass("d-none");
            }
        }

        // function to append the generated option input from server side when user click on edit button.
        function AppendDiv(optionDiv) {
            debugger;
            var addOptionBtnDiv = document.getElementById("optionButton");
            addOptionBtnDiv.insertAdjacentHTML('beforebegin', optionDiv);

        }
    </script>



</asp:Content>

