=begin
JRubyFX - Write JavaFX and FXML in Ruby
Copyright (C) 2013 The JRubyFX Team

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=end

require_relative 'utils'

# Update load path to include the JavaFX runtime and fail nicely if we can't find it
begin
  if ENV['JFX_DIR']
    $LOAD_PATH << ENV['JFX_DIR']
  else #should we check for 1.7 vs 1.8? oh well, adding extra paths won't hurt anybody (maybe performance loading)
    jfx_path = ENV_JAVA["sun.boot.library.path"]
    $LOAD_PATH << if jfx_path.include? ":\\" and !jfx_path.include? "/" # can be tricked, but should work fine
      #windows
      jfx_path.gsub(/\\bin[\\]*$/i, "\\lib")
    else
      # *nix
      jfx_path.gsub(/[\/\\][amdix345678_]+$/, "") # strip i386 or amd64 (including variants). TODO: ARM
    end
  end

  # Java 8 (after ea-b75) and above has JavaFX as part of the normal distib, only require it if we are 7 or below
  jre = ENV_JAVA["java.runtime.version"].match %r{^(?<version>(?<major>\d+)\.(?<minor>\d+))\.(?<patch>\d+)(_\d+)?-?(?<release>ea|u\d)?(-?b(?<build>\d+))?}
  require 'jfxrt.jar' if ENV['JFX_DIR'] or
    jre[:version].to_f < 1.8 or
    (jre[:version].to_f == 1.8 and jre[:release] == 'ea' and jre[:build].to_i < 75)

  # Java 8 at some point requires explicit toolkit/platform initialization
  # before any controls can be loaded.
  JRubyFX.load_fx
  
  # Attempt to load a javafx class
  Java.javafx.application.Application
rescue  LoadError, NameError
  puts "JavaFX runtime not found.  Please install Java 7u6 or newer or set environment variable JFX_DIR to the folder that contains jfxrt.jar "
  puts "If you have Java 7u6 or later, this is a bug. Please report to the issue tracker on github. Include your OS version, 32/64bit, and architecture (x86, ARM, PPC, etc)"
  exit -1
end

module JRubyFX
  # If you need JavaFX, just include this module. Its sole purpose in life is to
  # import all JavaFX stuff, plus a few useful Java classes (like Void)
  module FXImports

    # If something is missing, just java_import it in your code.
    # And then ask us to put it in this list
    #

    # The below lines are generated by `rake reflect`. Do not edit.

    def const_missing(c)
      if LOCAL_NAME_MAP.has_key? c
        java_import(LOCAL_NAME_MAP[c])[0]
      else
        super
      end
    end

LOCAL_NAME_MAP = { 
  :Animation => "javafx.animation.Animation",
  :AnimationTimer => "javafx.animation.AnimationTimer",
  :FadeTransition => "javafx.animation.FadeTransition",
  :FillTransition => "javafx.animation.FillTransition",
  :Interpolator => "javafx.animation.Interpolator",
  :KeyFrame => "javafx.animation.KeyFrame",
  :KeyValue => "javafx.animation.KeyValue",
  :ParallelTransition => "javafx.animation.ParallelTransition",
  :PathTransition => "javafx.animation.PathTransition",
  :PauseTransition => "javafx.animation.PauseTransition",
  :RotateTransition => "javafx.animation.RotateTransition",
  :ScaleTransition => "javafx.animation.ScaleTransition",
  :SequentialTransition => "javafx.animation.SequentialTransition",
  :StrokeTransition => "javafx.animation.StrokeTransition",
  :Timeline => "javafx.animation.Timeline",
  :Transition => "javafx.animation.Transition",
  :TranslateTransition => "javafx.animation.TranslateTransition",
  :Platform => "javafx.application.Platform",
  :SimpleBooleanProperty => "javafx.beans.property.SimpleBooleanProperty",
  :SimpleDoubleProperty => "javafx.beans.property.SimpleDoubleProperty",
  :SimpleFloatProperty => "javafx.beans.property.SimpleFloatProperty",
  :SimpleIntegerProperty => "javafx.beans.property.SimpleIntegerProperty",
  :SimpleListProperty => "javafx.beans.property.SimpleListProperty",
  :SimpleLongProperty => "javafx.beans.property.SimpleLongProperty",
  :SimpleMapProperty => "javafx.beans.property.SimpleMapProperty",
  :SimpleObjectProperty => "javafx.beans.property.SimpleObjectProperty",
  :SimpleSetProperty => "javafx.beans.property.SimpleSetProperty",
  :SimpleStringProperty => "javafx.beans.property.SimpleStringProperty",
  :ChangeListener => "javafx.beans.value.ChangeListener",
  :FXCollections => "javafx.collections.FXCollections",
  :Worker => "javafx.concurrent.Worker",
  :Task => "javafx.concurrent.Task",
  :Service => "javafx.concurrent.Service",
  :Event => "javafx.event.Event",
  :ActionEvent => "javafx.event.ActionEvent",
  :EventHandler => "javafx.event.EventHandler",
  :Initializable => "javafx.fxml.Initializable",
  :LoadException => "javafx.fxml.LoadException",
  :HorizontalDirection => "javafx.geometry.HorizontalDirection",
  :HPos => "javafx.geometry.HPos",
  :Insets => "javafx.geometry.Insets",
  :Orientation => "javafx.geometry.Orientation",
  :Pos => "javafx.geometry.Pos",
  :Rectangle2D => "javafx.geometry.Rectangle2D",
  :Side => "javafx.geometry.Side",
  :VerticalDirection => "javafx.geometry.VerticalDirection",
  :VPos => "javafx.geometry.VPos",
  :Group => "javafx.scene.Group",
  :Node => "javafx.scene.Node",
  :Parent => "javafx.scene.Parent",
  :Scene => "javafx.scene.Scene",
  :Canvas => "javafx.scene.canvas.Canvas",
  :AreaChart => "javafx.scene.chart.AreaChart",
  :Axis => "javafx.scene.chart.Axis",
  :BarChart => "javafx.scene.chart.BarChart",
  :BubbleChart => "javafx.scene.chart.BubbleChart",
  :CategoryAxis => "javafx.scene.chart.CategoryAxis",
  :Chart => "javafx.scene.chart.Chart",
  :LineChart => "javafx.scene.chart.LineChart",
  :NumberAxis => "javafx.scene.chart.NumberAxis",
  :PieChart => "javafx.scene.chart.PieChart",
  :ScatterChart => "javafx.scene.chart.ScatterChart",
  :StackedAreaChart => "javafx.scene.chart.StackedAreaChart",
  :StackedBarChart => "javafx.scene.chart.StackedBarChart",
  :ValueAxis => "javafx.scene.chart.ValueAxis",
  :XYChart => "javafx.scene.chart.XYChart",
  :Accordion => "javafx.scene.control.Accordion",
  :Button => "javafx.scene.control.Button",
  :Cell => "javafx.scene.control.Cell",
  :CheckBox => "javafx.scene.control.CheckBox",
  :CheckBoxTreeItem => "javafx.scene.control.CheckBoxTreeItem",
  :CheckMenuItem => "javafx.scene.control.CheckMenuItem",
  :ChoiceBox => "javafx.scene.control.ChoiceBox",
  :ColorPicker => "javafx.scene.control.ColorPicker",
  :ComboBox => "javafx.scene.control.ComboBox",
  :ContextMenu => "javafx.scene.control.ContextMenu",
  :Hyperlink => "javafx.scene.control.Hyperlink",
  :Label => "javafx.scene.control.Label",
  :ListCell => "javafx.scene.control.ListCell",
  :ListView => "javafx.scene.control.ListView",
  :Menu => "javafx.scene.control.Menu",
  :MenuBar => "javafx.scene.control.MenuBar",
  :MenuButton => "javafx.scene.control.MenuButton",
  :MenuItem => "javafx.scene.control.MenuItem",
  :Pagination => "javafx.scene.control.Pagination",
  :PasswordField => "javafx.scene.control.PasswordField",
  :PopupControl => "javafx.scene.control.PopupControl",
  :ProgressBar => "javafx.scene.control.ProgressBar",
  :ProgressIndicator => "javafx.scene.control.ProgressIndicator",
  :RadioButton => "javafx.scene.control.RadioButton",
  :RadioMenuItem => "javafx.scene.control.RadioMenuItem",
  :ScrollBar => "javafx.scene.control.ScrollBar",
  :ScrollPane => "javafx.scene.control.ScrollPane",
  :Separator => "javafx.scene.control.Separator",
  :SeparatorMenuItem => "javafx.scene.control.SeparatorMenuItem",
  :Slider => "javafx.scene.control.Slider",
  :SplitMenuButton => "javafx.scene.control.SplitMenuButton",
  :SplitPane => "javafx.scene.control.SplitPane",
  :Tab => "javafx.scene.control.Tab",
  :TableView => "javafx.scene.control.TableView",
  :TableCell => "javafx.scene.control.TableCell",
  :TableColumn => "javafx.scene.control.TableColumn",
  :TabPane => "javafx.scene.control.TabPane",
  :TextArea => "javafx.scene.control.TextArea",
  :TextField => "javafx.scene.control.TextField",
  :TitledPane => "javafx.scene.control.TitledPane",
  :ToggleButton => "javafx.scene.control.ToggleButton",
  :ToggleGroup => "javafx.scene.control.ToggleGroup",
  :ToolBar => "javafx.scene.control.ToolBar",
  :Tooltip => "javafx.scene.control.Tooltip",
  :TreeCell => "javafx.scene.control.TreeCell",
  :TreeItem => "javafx.scene.control.TreeItem",
  :TreeView => "javafx.scene.control.TreeView",
  :ContentDisplay => "javafx.scene.control.ContentDisplay",
  :OverrunStyle => "javafx.scene.control.OverrunStyle",
  :SelectionMode => "javafx.scene.control.SelectionMode",
  :Blend => "javafx.scene.effect.Blend",
  :BlendMode => "javafx.scene.effect.BlendMode",
  :Bloom => "javafx.scene.effect.Bloom",
  :BlurType => "javafx.scene.effect.BlurType",
  :BoxBlur => "javafx.scene.effect.BoxBlur",
  :ColorAdjust => "javafx.scene.effect.ColorAdjust",
  :ColorInput => "javafx.scene.effect.ColorInput",
  :DisplacementMap => "javafx.scene.effect.DisplacementMap",
  :DropShadow => "javafx.scene.effect.DropShadow",
  :GaussianBlur => "javafx.scene.effect.GaussianBlur",
  :Glow => "javafx.scene.effect.Glow",
  :ImageInput => "javafx.scene.effect.ImageInput",
  :InnerShadow => "javafx.scene.effect.InnerShadow",
  :Lighting => "javafx.scene.effect.Lighting",
  :MotionBlur => "javafx.scene.effect.MotionBlur",
  :PerspectiveTransform => "javafx.scene.effect.PerspectiveTransform",
  :Reflection => "javafx.scene.effect.Reflection",
  :SepiaTone => "javafx.scene.effect.SepiaTone",
  :Shadow => "javafx.scene.effect.Shadow",
  :Image => "javafx.scene.image.Image",
  :ImageView => "javafx.scene.image.ImageView",
  :PixelReader => "javafx.scene.image.PixelReader",
  :PixelWriter => "javafx.scene.image.PixelWriter",
  :Clipboard => "javafx.scene.input.Clipboard",
  :ClipboardContent => "javafx.scene.input.ClipboardContent",
  :ContextMenuEvent => "javafx.scene.input.ContextMenuEvent",
  :DragEvent => "javafx.scene.input.DragEvent",
  :GestureEvent => "javafx.scene.input.GestureEvent",
  :InputEvent => "javafx.scene.input.InputEvent",
  :InputMethodEvent => "javafx.scene.input.InputMethodEvent",
  :KeyCode => "javafx.scene.input.KeyCode",
  :KeyEvent => "javafx.scene.input.KeyEvent",
  :Mnemonic => "javafx.scene.input.Mnemonic",
  :MouseButton => "javafx.scene.input.MouseButton",
  :MouseDragEvent => "javafx.scene.input.MouseDragEvent",
  :MouseEvent => "javafx.scene.input.MouseEvent",
  :RotateEvent => "javafx.scene.input.RotateEvent",
  :ScrollEvent => "javafx.scene.input.ScrollEvent",
  :SwipeEvent => "javafx.scene.input.SwipeEvent",
  :TouchEvent => "javafx.scene.input.TouchEvent",
  :TransferMode => "javafx.scene.input.TransferMode",
  :ZoomEvent => "javafx.scene.input.ZoomEvent",
  :AnchorPane => "javafx.scene.layout.AnchorPane",
  :BorderPane => "javafx.scene.layout.BorderPane",
  :ColumnConstraints => "javafx.scene.layout.ColumnConstraints",
  :FlowPane => "javafx.scene.layout.FlowPane",
  :GridPane => "javafx.scene.layout.GridPane",
  :HBox => "javafx.scene.layout.HBox",
  :Pane => "javafx.scene.layout.Pane",
  :Priority => "javafx.scene.layout.Priority",
  :RowConstraints => "javafx.scene.layout.RowConstraints",
  :StackPane => "javafx.scene.layout.StackPane",
  :TilePane => "javafx.scene.layout.TilePane",
  :VBox => "javafx.scene.layout.VBox",
  :AudioClip => "javafx.scene.media.AudioClip",
  :AudioEqualizer => "javafx.scene.media.AudioEqualizer",
  :AudioTrack => "javafx.scene.media.AudioTrack",
  :EqualizerBand => "javafx.scene.media.EqualizerBand",
  :Media => "javafx.scene.media.Media",
  :MediaException => "javafx.scene.media.MediaException",
  :MediaErrorEvent => "javafx.scene.media.MediaErrorEvent",
  :MediaMarkerEvent => "javafx.scene.media.MediaMarkerEvent",
  :MediaPlayer => "javafx.scene.media.MediaPlayer",
  :MediaView => "javafx.scene.media.MediaView",
  :VideoTrack => "javafx.scene.media.VideoTrack",
  :Color => "javafx.scene.paint.Color",
  :CycleMethod => "javafx.scene.paint.CycleMethod",
  :ImagePattern => "javafx.scene.paint.ImagePattern",
  :LinearGradient => "javafx.scene.paint.LinearGradient",
  :Paint => "javafx.scene.paint.Paint",
  :RadialGradient => "javafx.scene.paint.RadialGradient",
  :Stop => "javafx.scene.paint.Stop",
  :Arc => "javafx.scene.shape.Arc",
  :ArcTo => "javafx.scene.shape.ArcTo",
  :ArcType => "javafx.scene.shape.ArcType",
  :Circle => "javafx.scene.shape.Circle",
  :ClosePath => "javafx.scene.shape.ClosePath",
  :CubicCurve => "javafx.scene.shape.CubicCurve",
  :CubicCurveTo => "javafx.scene.shape.CubicCurveTo",
  :Ellipse => "javafx.scene.shape.Ellipse",
  :FillRule => "javafx.scene.shape.FillRule",
  :HLineTo => "javafx.scene.shape.HLineTo",
  :Line => "javafx.scene.shape.Line",
  :LineTo => "javafx.scene.shape.LineTo",
  :MoveTo => "javafx.scene.shape.MoveTo",
  :Path => "javafx.scene.shape.Path",
  :PathElement => "javafx.scene.shape.PathElement",
  :Polygon => "javafx.scene.shape.Polygon",
  :Polyline => "javafx.scene.shape.Polyline",
  :QuadCurve => "javafx.scene.shape.QuadCurve",
  :QuadCurveTo => "javafx.scene.shape.QuadCurveTo",
  :Rectangle => "javafx.scene.shape.Rectangle",
  :Shape => "javafx.scene.shape.Shape",
  :StrokeLineCap => "javafx.scene.shape.StrokeLineCap",
  :StrokeLineJoin => "javafx.scene.shape.StrokeLineJoin",
  :StrokeType => "javafx.scene.shape.StrokeType",
  :SVGPath => "javafx.scene.shape.SVGPath",
  :VLineTo => "javafx.scene.shape.VLineTo",
  :Font => "javafx.scene.text.Font",
  :FontPosture => "javafx.scene.text.FontPosture",
  :FontSmoothingType => "javafx.scene.text.FontSmoothingType",
  :FontWeight => "javafx.scene.text.FontWeight",
  :Text => "javafx.scene.text.Text",
  :TextAlignment => "javafx.scene.text.TextAlignment",
  :TextBoundsType => "javafx.scene.text.TextBoundsType",
  :Affine => "javafx.scene.transform.Affine",
  :Rotate => "javafx.scene.transform.Rotate",
  :Scale => "javafx.scene.transform.Scale",
  :Shear => "javafx.scene.transform.Shear",
  :Translate => "javafx.scene.transform.Translate",
  :WebView => "javafx.scene.web.WebView",
  :HTMLEditor => "javafx.scene.web.HTMLEditor",
  :DirectoryChooser => "javafx.stage.DirectoryChooser",
  :FileChooser => "javafx.stage.FileChooser",
  :Modality => "javafx.stage.Modality",
  :Popup => "javafx.stage.Popup",
  :PopupWindow => "javafx.stage.PopupWindow",
  :Screen => "javafx.stage.Screen",
  :Stage => "javafx.stage.Stage",
  :StageStyle => "javafx.stage.StageStyle",
  :Window => "javafx.stage.Window",
  :WindowEvent => "javafx.stage.WindowEvent",
  :Duration => "javafx.util.Duration"
}
java_import 'java.lang.Void'
  end
end

