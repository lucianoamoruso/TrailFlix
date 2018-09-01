package trailFlix.flix_ui;

import org.uqbar.arena.bindings.PropertyAdapter;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import trailFlix.flix.appModel.AdminContent;
import trailFlix.flix.model.Contenido;

@SuppressWarnings("all")
public class AdminContentWindow extends SimpleWindow<AdminContent> {
  public AdminContentWindow(final WindowOwner parent, final AdminContent model) {
    super(parent, model);
  }
  
  protected void addActions(final Panel actionsPanel) {
  }
  
  protected void createFormPanel(final Panel mainPanel) {
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field accept is undefined for the type AdminContentWindow");
  }
  
  public PropertyAdapter nameAdapter() {
    return new PropertyAdapter(Contenido.class, "titulo");
  }
}
