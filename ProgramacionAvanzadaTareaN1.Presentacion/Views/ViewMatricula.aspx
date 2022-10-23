<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewMatricula.aspx.cs" Inherits="ProgramacionAvanzadaTareaN1.Presentacion.Views.ViewMatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Proceso de Matrícula</h3>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10">
                <label class="mr-1">Cuatrimestre:</label>
                <asp:DropDownList ID="DropDownListPeriodo" runat="server" Width="100px" CssClass="form-control form-control-sm mr-2" >
                    <asp:ListItem Value="32022" Text="032022" Selected="True" />
                </asp:DropDownList>
                <label class="mr-1">Estudiante:</label>
                <asp:DropDownList ID="DropDownListEstudiantes" runat="server" Width="300px" DataValueField="Identificacion" 
                    DataTextField="NombreCompleto" CssClass="form-control form-control-sm mr-2" >
                </asp:DropDownList>
                <asp:TextBox ID="TextBoxBuscar" runat="server" Width="300px" CssClass="form-control form-control-sm mr-2"></asp:TextBox>
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" OnClick="ButtonBuscar_Click" CssClass="btn btn-sm btn-primary" />
            </div>
            <div class="col-md-2 text-right">
                <asp:Button ID="ButtonNuevo" runat="server" Text="Agregar Curso" CssClass="btn btn-sm btn-primary" />
            </div>
        </div>
         <div class="row mt-2">
            <div class="col-md-12">
                <asp:GridView ID="GridViewMatriculados" CssClass="table"
                    runat="server" AllowPaging="True" PageSize="10" 
                    AutoGenerateColumns="False" ForeColor="#333333" 
                    GridLines="None" Width="100%" CellSpacing="1"  
                    DataKeyNames="CursoId"
                    EmptyDataText="Sin cursos Matriculados."
                    OnPageIndexChanging="GridViewMatriculados_PageIndexChanging" 
                    OnSelectedIndexChanged="GridViewMatriculados_SelectedIndexChanged" 
                    OnRowCommand="GridViewMatriculados_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Curso" HeaderText="Curso" />
                        <asp:BoundField DataField="FMatricula" HeaderText="Fecha Matrícula" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="Costo" HeaderText="Costo" DataFormatString="{0:n}"/>

                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Detalle"> 
                            <ItemTemplate>
                                <asp:Button ID="ButtonVer" runat="server" CommandName="Select" Text="Ver" CssClass="btn btn-sm btn-primary btn-block"/>
                                <asp:Button ID="ButtonQuitar" runat="server" CommandName="Borrar" CommandArgument='<%# Container.DataItemIndex%>' Text="Quitar" CssClass="btn btn-sm btn-primary btn-block"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#0082C8" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E1E1E1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <div>
        <asp:Label ID="LabelCTotal" runat="server" Font-Bold="True"></asp:Label>
    </div>

<ajaxtoolkit:modalpopupextender ID="ModalPopupExtender1" runat="server"
    TargetControlID="ButtonNuevo"
    PopupControlID="Panel1"
    BackgroundCssClass="modalBackground"
    CancelControlID="ButtonCancelar">
</ajaxtoolkit:modalpopupextender>

<asp:Panel ID="Panel1" runat="server" CssClass="container-fluid table" Style="width:400px; display:none;" >
    <div class="row">
        <div class="col-sm">
            <h4>Curso</h4>
        </div>
    </div>
    <div class="form-group">
        <label>Escuela:</label>
        <asp:DropDownList ID="DropDownListEscuela" runat="server" DataValueField="Id" DataTextField="Nombre" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="DropDownListEscuela_SelectedIndexChanged"></asp:DropDownList>
    </div>
    <div class="form-group">
        <label>Curso:</label>
        <asp:DropDownList ID="DropDownListCursos" runat="server" DataValueField="Id" DataTextField="Nombre" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="DropDownListCursos_SelectedIndexChanged"></asp:DropDownList>
    </div>
    <div class="form-group">
        <label>Descripcion:</label>
        <asp:TextBox ID="TextBoxDescripcion" runat="server" CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required2" runat="server" ControlToValidate="TextBoxDescripcion" Display="Dynamic" ValidationGroup="vgCurso" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Costo:</label>
        <asp:TextBox ID="TextBoxCosto" runat="server" CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required3" runat="server" ControlToValidate="TextBoxCosto" Display="Dynamic" ValidationGroup="vgCurso" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="row">
        <div class="col-sm text-right mt-2">
            <asp:Button ID="ButtonAceptar" runat="server" Text="Agregar" CssClass="btn btn-sm btn-primary" ValidationGroup="vgCurso" OnClick="ButtonAceptar_Click" />&nbsp;
            <asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar" CssClass="btn btn-sm btn-secondary" UseSubmitBehavior="false" OnClick="ButtonCancelar_Click" />
        </div>
    </div>
</asp:Panel>


</asp:Content>
