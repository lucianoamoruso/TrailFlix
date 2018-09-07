package trailFlix.flix_ui;

import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableItems;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.bindings.PropertyAdapter;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;
import trailFlix.flix.appModel.AdminContent;
import trailFlix.flix.model.Contenido;

@SuppressWarnings("all")
public class AdminContentWindow extends TransactionalDialog<AdminContent> {
  public AdminContentWindow(final WindowOwner owner, final AdminContent model) {
    super(owner, model);
    this.setTitle("Añada contenido relacionado");
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Añadir relacionado");
    final Panel contentPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    contentPanel.setLayout(_columnLayout);
    List<Object> _list = new List<Object>(mainPanel);
    final Procedure1<List<Object>> _function = new Procedure1<List<Object>>() {
      public void apply(final List<Object> it) {
        it.allowNull(false);
        ObservableItems<Selector<Object>, Object, ListBuilder<Object>> _items = it.items();
        Binding _spaceship = ArenaXtendExtensions.operator_spaceship(_items, "disponibles");
        _spaceship.setAdapter(AdminContentWindow.this.nameAdapter());
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "elegido");
      }
    };
    ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function);
    Button _button = new Button(contentPanel);
    final Procedure1<Button> _function_1 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Agregar");
        final Action _function = new Action() {
          public void execute() {
            AdminContentWindow.this.getModelObject().agregar();
            AdminContentWindow.this.close();
          }
        };
        it.onClick(_function);
        it.setAsDefault();
        it.disableOnError();
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
    Button _button_1 = new Button(contentPanel);
    final Procedure1<Button> _function_2 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Cancelar");
        final Action _function = new Action() {
          public void execute() {
            AdminContentWindow.this.close();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_2);
  }
  
  public PropertyAdapter nameAdapter() {
    return new PropertyAdapter(Contenido.class, "titulo");
  }
}
