using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Warden.Components.Common {
    public partial class BaseTableUsc : BaseUsc {

        public class TableColumn {

            public String Text { get; set; }
            public String Name { get; set; }
            public String Format { get; set; }

        }

        public List<TableColumn> TableColumns { get; set; }
        public String HtmlDataSource { get; set; }
        public DataTable DataSource { get; set; }

        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public String TableLoad(DataTable Table) {
            StringBuilder NewTable;
            Int32 Count = 1;
            String TheadInit = "<thead>";
            String TheadClose = "</thead>";
            String TbodyInit = "<tbody>";
            String TbodyClose = "</tbody>";
            String ThInit = "<th>";
            String ThClose = "</th>";
            String TableHtml = "";
            String TrInit = "<tr>";
            String TrClose = "</tr>";
            String InitTd = "<td class='text-center'>";
            String Td = "<td>";
            String ActionTd = "<td class='td-actions text-right'>";
            String CloseTd = "</td>";
            String Actions = " <button type='button' rel='tooltip' class='btn btn-info btn-link btn-icon btn-sm'>"       +
                             "      <i class='tim-icons icon-single-02'></i> "      +
                             " </button>" +
                             " <button type = 'button' rel='tooltip' class='btn btn-success btn-link btn-icon btn-sm'>"  +
                             "      <i class='tim-icons icon-settings'></i> "       +
                             " </button>" +
                             " <button type = 'button' rel='tooltip' class='btn btn-danger btn-link btn-icon btn-sm'>"   +
                             "      <i class='tim-icons icon-simple-remove'></i>"   +
                             " </button>";
            try {
                NewTable = new StringBuilder();

                if (TableColumns != null) {
                    NewTable.Append(TheadInit);
                    NewTable.Append(TrInit);
                    foreach (TableColumn Column in this.TableColumns) {
                        if (Count == 1) {
                            NewTable.Append(InitTd.Replace("td", "th"));
                        } else if (Count == TableColumns.Count) {
                            NewTable.Append(ActionTd.Replace("td-actions", " ").Replace("td", "th"));
                        } else {
                            NewTable.Append(ThInit);
                        }
                        NewTable.Append(Column.Text);
                        NewTable.Append(ThClose);
                        Count++;
                    }
                    Count = 1;
                    //Actions
                    NewTable.Append(ActionTd.Replace("td-actions", " ").Replace("td", "th"));
                    NewTable.Append("Ações");
                    NewTable.Append(ThClose);

                    NewTable.Append(TrClose);
                    NewTable.Append(TheadClose);
                    NewTable.Append(TbodyInit);
                    foreach (DataRow Row in Table.Rows) {
                        NewTable.Append(TrInit);
                        foreach (TableColumn Column in this.TableColumns) {
                            if (Count == 1) {
                                NewTable.Append(InitTd);
                            } else if (Count == TableColumns.Count) {
                                NewTable.Append(ActionTd.Replace("td-actions", " "));
                            }
                            else{
                                NewTable.Append(Td);
                            }
                            if (String.IsNullOrEmpty(Column.Format)) {
                                NewTable.Append(Convert.ToString(Row[Column.Name]));
                            } else {
                                NewTable.Append(String.Format("{0:" + Column.Format + "}", Row[Column.Name]));
                            }
                            NewTable.Append(CloseTd);
                            Count++;
                        }
                        Count = 1;
                        NewTable.Append(ActionTd);
                        NewTable.Append(Actions);
                        NewTable.Append(CloseTd);
                        NewTable.Append(TrClose);
                    }
                }
                NewTable.Append(TbodyClose);
                TableHtml = Convert.ToString(NewTable);
            } catch (Exception Except) {
                throw new Exception(Except.Message);
            }

            return TableHtml;
        }

        public override void LoadDataSource(DataTable Table) {
            base.LoadDataSource();
            if (Table != null) {
               HtmlDataSource = TableLoad(Table);
            }
        }
    }
}