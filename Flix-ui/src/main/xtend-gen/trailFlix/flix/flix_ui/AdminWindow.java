package trailFlix.flix.flix_ui;

import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import trailFlix.flix.appModel.AdminMainWindow;

@SuppressWarnings("all")
public class AdminWindow extends MainWindow<AdminMainWindow> {
  public AdminWindow() {
    super(new AdminMainWindow());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Administración de TrailFlix");
    Label _label = new Label(mainPanel);
    _label.setText("Películas");
    TextBox _textBox = new TextBox(mainPanel);
    final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "peli_find");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    Button _button = new Button(mainPanel);
    final Procedure1<Button> _function_1 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Buscar");
        final Action _function = new Action() {
          public void execute() {
            AdminWindow.this.getModelObject().buscarPeliculas();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
    new Selector<Object>(mainPanel);
    Label _label_1 = new Label(mainPanel);
    _label_1.setText("Series");
    TextBox _textBox_1 = new TextBox(mainPanel);
    final Procedure1<TextBox> _function_2 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "serie_find");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_2);
    Button _button_1 = new Button(mainPanel);
    final Procedure1<Button> _function_3 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Buscar");
        final Action _function = new Action() {
          public void execute() {
            AdminWindow.this.getModelObject().buscarSeries();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_3);
    new Selector<Object>(mainPanel);
  }
  
  public static void main(final String[] args) {
    new AdminWindow().startApplication();
  }
}
