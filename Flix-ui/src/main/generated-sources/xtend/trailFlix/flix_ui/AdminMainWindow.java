package trailFlix.flix_ui;

import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableItems;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import trailFlix.flix.appModel.AdminMain;
import trailFlix.flix.appModel.AdminMovie;
import trailFlix.flix.model.TrailFlix;
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
        it.setWidth(150);
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
    List<Object> _list = new List<Object>(panelPeliDB);
    final Procedure1<List<Object>> _function_5 = new Procedure1<List<Object>>() {
      public void apply(final List<Object> it) {
        it.allowNull(false);
        ObservableItems<Selector<Object>, Object, ListBuilder<Object>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "peliculas");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "sel_pelicula");
        it.setWidth(200);
      }
    };
    ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function_5);
    Button _button_1 = new Button(panelPeliDB);
    final Procedure1<Button> _function_6 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Nuevo");
        final Action _function = new Action() {
          public void execute() {
            TrailFlix _trailFlix = AdminMainWindow.this.getModelObject().getTrailFlix();
            AdminMovie _adminMovie = new AdminMovie(_trailFlix);
            new AdminMovieWindow(AdminMainWindow.this, _adminMovie).open();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_6);
    Button _button_2 = new Button(panelPeliDB);
    final Procedure1<Button> _function_7 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Ver");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_7);
    Button _button_3 = new Button(panelPeliDB);
    final Procedure1<Button> _function_8 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Modificar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_3, _function_8);
    Button _button_4 = new Button(panelPeliDB);
    final Procedure1<Button> _function_9 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Borrar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_4, _function_9);
    Panel _panel_3 = new Panel(mainPanel);
    final Procedure1<Panel> _function_10 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelSerieLabel = ObjectExtensions.<Panel>operator_doubleArrow(_panel_3, _function_10);
    Label _label_1 = new Label(panelSerieLabel);
    _label_1.setText("Series");
    Panel _panel_4 = new Panel(mainPanel);
    final Procedure1<Panel> _function_11 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelSerieFind = ObjectExtensions.<Panel>operator_doubleArrow(_panel_4, _function_11);
    TextBox _textBox_1 = new TextBox(panelSerieFind);
    final Procedure1<TextBox> _function_12 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "serie_find");
        it.setWidth(150);
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_12);
    Button _button_5 = new Button(panelSerieFind);
    final Procedure1<Button> _function_13 = new Procedure1<Button>() {
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
    ObjectExtensions.<Button>operator_doubleArrow(_button_5, _function_13);
    Panel _panel_5 = new Panel(mainPanel);
    final Procedure1<Panel> _function_14 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
      }
    };
    final Panel panelSerieDB = ObjectExtensions.<Panel>operator_doubleArrow(_panel_5, _function_14);
    List<Object> _list_1 = new List<Object>(panelSerieDB);
    final Procedure1<List<Object>> _function_15 = new Procedure1<List<Object>>() {
      public void apply(final List<Object> it) {
        it.allowNull(false);
        ObservableItems<Selector<Object>, Object, ListBuilder<Object>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "series");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "sel_serie");
        it.setWidth(200);
      }
    };
    ObjectExtensions.<List<Object>>operator_doubleArrow(_list_1, _function_15);
    Button _button_6 = new Button(panelSerieDB);
    final Procedure1<Button> _function_16 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Nuevo");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_6, _function_16);
    Button _button_7 = new Button(panelSerieDB);
    final Procedure1<Button> _function_17 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Ver");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_7, _function_17);
    Button _button_8 = new Button(panelSerieDB);
    final Procedure1<Button> _function_18 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Modificar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_8, _function_18);
    Button _button_9 = new Button(panelSerieDB);
    final Procedure1<Button> _function_19 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Borrar");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_9, _function_19);
  }
  
  public static void main(final String[] args) {
    new AdminMainWindow().startApplication();
  }
}
