package trailFlix.flix.flix_ui;

import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
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
import trailFlix.flix.appModel.AdminMovie;

@SuppressWarnings("all")
public class AdminMovieWindow extends MainWindow<AdminMovie> {
  public AdminMovieWindow() {
    super(new AdminMovie());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Administración de peliculas");
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelTitulo = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Label _label = new Label(panelTitulo);
    _label.setText("Título");
    TextBox _textBox = new TextBox(panelTitulo);
    final Procedure1<TextBox> _function_1 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "titulo");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_1);
    Panel _panel_1 = new Panel(mainPanel);
    final Procedure1<Panel> _function_2 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
      }
    };
    final Panel panelDatos = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_2);
    Label _label_1 = new Label(panelDatos);
    _label_1.setText("Categorias");
    new Selector<Object>(panelDatos);
    Label _label_2 = new Label(panelDatos);
    _label_2.setText("Duración");
    TextBox _textBox_1 = new TextBox(panelDatos);
    final Procedure1<TextBox> _function_3 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "duracion");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_3);
    Label _label_3 = new Label(panelDatos);
    _label_3.setText("Clasificación");
    new Selector<Object>(panelDatos);
    Label _label_4 = new Label(panelDatos);
    _label_4.setText("Fecha estreno");
    TextBox _textBox_2 = new TextBox(panelDatos);
    final Procedure1<TextBox> _function_4 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "fecha_estreno");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_2, _function_4);
    Label _label_5 = new Label(panelDatos);
    _label_5.setText("Directores");
    TextBox _textBox_3 = new TextBox(panelDatos);
    final Procedure1<TextBox> _function_5 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "directores");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_3, _function_5);
    Label _label_6 = new Label(panelDatos);
    _label_6.setText("Actores principales");
    TextBox _textBox_4 = new TextBox(panelDatos);
    final Procedure1<TextBox> _function_6 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "actores_principales");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_4, _function_6);
    Label _label_7 = new Label(panelDatos);
    _label_7.setText("Link Youtube");
    TextBox _textBox_5 = new TextBox(panelDatos);
    final Procedure1<TextBox> _function_7 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "link");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_5, _function_7);
    Panel _panel_2 = new Panel(mainPanel);
    final Procedure1<Panel> _function_8 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        VerticalLayout _verticalLayout = new VerticalLayout();
        it.setLayout(_verticalLayout);
      }
    };
    final Panel panelRelated = ObjectExtensions.<Panel>operator_doubleArrow(_panel_2, _function_8);
    Panel _panel_3 = new Panel(panelRelated);
    final Procedure1<Panel> _function_9 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
      }
    };
    final Panel panelRelatedLabel = ObjectExtensions.<Panel>operator_doubleArrow(_panel_3, _function_9);
    Label _label_8 = new Label(panelRelatedLabel);
    _label_8.setText("Contenido relacionado");
    Button _button = new Button(panelRelatedLabel);
    final Procedure1<Button> _function_10 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Quitar");
        final Action _function = new Action() {
          public void execute() {
            AdminMovieWindow.this.getModelObject().quitarContenido();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_10);
    Button _button_1 = new Button(panelRelatedLabel);
    final Procedure1<Button> _function_11 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Agregar");
        final Action _function = new Action() {
          public void execute() {
            AdminMovieWindow.this.getModelObject().agregarContenido();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_11);
    new Selector<Object>(panelRelated);
    Button _button_2 = new Button(mainPanel);
    final Procedure1<Button> _function_12 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Cancelar");
        final Action _function = new Action() {
          public void execute() {
          }
        };
        it.onClick(_function);
        it.alignRight();
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_12);
    Button _button_3 = new Button(mainPanel);
    final Procedure1<Button> _function_13 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Aceptar");
        final Action _function = new Action() {
          public void execute() {
            AdminMovieWindow.this.getModelObject().nuevaPeli();
          }
        };
        it.onClick(_function);
        it.alignRight();
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_3, _function_13);
  }
  
  public static AdminMovieWindow main(final String[] args) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method rellenarDatos() from the type AdminMovie refers to the missing type Object");
  }
}
