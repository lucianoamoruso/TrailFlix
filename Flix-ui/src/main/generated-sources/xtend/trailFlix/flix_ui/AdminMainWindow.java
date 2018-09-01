package trailFlix.flix_ui;

import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
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
import trailFlix.flix.appModel.AdminMain;
import trailFlix.flix.appModel.AdminMovie;
import trailFlix.flix_ui.AdminMovieWindow;

@SuppressWarnings("all")
public class AdminMainWindow extends MainWindow<AdminMain> {
  public AdminMainWindow() {
    super(new AdminMain());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Administración de TrailFlix");
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelPeliLabel = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Label _label = new Label(panelPeliLabel);
    _label.setText("Películas");
    Panel _panel_1 = new Panel(mainPanel);
    final Procedure1<Panel> _function_1 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelPeliFind = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
    TextBox _textBox = new TextBox(panelPeliFind);
    final Procedure1<TextBox> _function_2 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "peli_find");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_2);
    Button _button = new Button(panelPeliFind);
    final Procedure1<Button> _function_3 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Buscar");
        final Action _function = new Action() {
          public void execute() {
            AdminMainWindow.this.getModelObject().buscarPeliculas();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_3);
    Panel _panel_2 = new Panel(mainPanel);
    final Procedure1<Panel> _function_4 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
      }
    };
    final Panel panelPeliDB = ObjectExtensions.<Panel>operator_doubleArrow(_panel_2, _function_4);
    new Selector<Object>(panelPeliDB);
    Button _button_1 = new Button(panelPeliDB);
    final Procedure1<Button> _function_5 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Nuevo");
        final Action _function = new Action() {
          public void execute() {
            AdminMovie _adminMovie = new AdminMovie();
            new AdminMovieWindow(AdminMainWindow.this, _adminMovie).open();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_5);
    Button _button_2 = new Button(panelPeliDB);
    final Procedure1<Button> _function_6 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Ver");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_6);
    Button _button_3 = new Button(panelPeliDB);
    final Procedure1<Button> _function_7 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Modificar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_3, _function_7);
    Button _button_4 = new Button(panelPeliDB);
    final Procedure1<Button> _function_8 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Borrar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_4, _function_8);
    Panel _panel_3 = new Panel(mainPanel);
    final Procedure1<Panel> _function_9 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelSerieLabel = ObjectExtensions.<Panel>operator_doubleArrow(_panel_3, _function_9);
    Label _label_1 = new Label(panelSerieLabel);
    _label_1.setText("Series");
    Panel _panel_4 = new Panel(mainPanel);
    final Procedure1<Panel> _function_10 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelSerieFind = ObjectExtensions.<Panel>operator_doubleArrow(_panel_4, _function_10);
    TextBox _textBox_1 = new TextBox(panelSerieFind);
    final Procedure1<TextBox> _function_11 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "serie_find");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_11);
    Button _button_5 = new Button(panelSerieFind);
    final Procedure1<Button> _function_12 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Buscar");
        final Action _function = new Action() {
          public void execute() {
            AdminMainWindow.this.getModelObject().buscarSeries();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_5, _function_12);
    Panel _panel_5 = new Panel(mainPanel);
    final Procedure1<Panel> _function_13 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
      }
    };
    final Panel panelSerieDB = ObjectExtensions.<Panel>operator_doubleArrow(_panel_5, _function_13);
    new Selector<Object>(panelSerieDB);
    Button _button_6 = new Button(panelSerieDB);
    final Procedure1<Button> _function_14 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Nuevo");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_6, _function_14);
    Button _button_7 = new Button(panelSerieDB);
    final Procedure1<Button> _function_15 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Ver");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_7, _function_15);
    Button _button_8 = new Button(panelSerieDB);
    final Procedure1<Button> _function_16 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Modificar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_8, _function_16);
    Button _button_9 = new Button(panelSerieDB);
    final Procedure1<Button> _function_17 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Borrar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_9, _function_17);
  }
  
  public static void main(final String[] args) {
    new AdminMainWindow().startApplication();
  }
}
