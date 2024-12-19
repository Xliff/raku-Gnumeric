class ColRowRLEState is repr<CStruct> is export {
	has int         $.length is rw;
	has ColRowState $!state ;
}

class DialogStfResult_t is repr<CStruct> is export {
	has char              $!encoding    ;
	has char              $!text        ;
	has int               $.rowcount     is rw;
	has int               $.colcount     is rw;
	has StfParseOptions_t $!parseoptions;
}

class FormatInfo_t is repr<CStruct> is export {
	has GtkWidget    $!format_data_container ;
	has GtkWidget    $!format_trim           ;
	has GtkWidget    $!column_selection_label;
	has GOLocaleSel  $!locale_selector       ;
	has RenderData_t $!renderdata            ;
	has GPtrArray    $!formats               ;
	has int          $.index                  is rw;
	has gboolean     $!manual_change         ;
	has gboolean     $!sublist_select        ;
	has gboolean     $!col_autofit_array     ;
	has gboolean     $!col_import_array      ;
	has int          $.col_import_count       is rw;
	has int          $.col_import_array_len   is rw;
	has char         $!col_header            ;
}

class GODataCache is repr<CStruct> is export {
	has GObject           $!base             ;
	has GODataCacheSource $!data_source      ;
	has GPtrArray         $!fields           ;
	has int               $.record_size       is rw;
	has int               $.records_len       is rw;
	has int               $.records_allocated is rw;
	has guint8            $.records           is rw;
	has char              $!refreshed_by     ;
	has GOVal             $!refreshed_on     ;
	has gboolean          $!refresh_upgrades ;
	has int               $.XL_created_ver    is rw;
	has int               $.XL_refresh_ver    is rw;
}

class GODataCacheClass is repr<CStruct> is export {
	has GObjectClass $!base;
}

class GODataCacheField is repr<CStruct> is export {
	has GObject              $!base        ;
	has GODataCache          $!cache       ;
	has GOString             $!name        ;
	has int                  $.indx         is rw;
	has int                  $.group_parent is rw;
	has int                  $.offset       is rw;
	has GODataCacheFieldType $!ref_type    ;
	has GOValArray           $!indexed     ;
	has GOValArray           $!grouped     ;
	has GOValBucketer        $!bucketer    ;
}

class GODataCacheFieldClass is repr<CStruct> is export {
	has GObjectClass $!base;
}

class GODataSlicer is repr<CStruct> is export {
	has GObject     $!base      ;
	has GODataCache $!cache     ;
	has GOString    $!name      ;
	has GPtrArray   $!all_fields;
	has GArray      $!fields    ;
}

class GODataSlicerClass is repr<CStruct> is export {
	has GObjectClass $!base;
}

class GODataSlicerField is repr<CStruct> is export {
	has GObject      $!base                 ;
	has GODataSlicer $!ds                   ;
	has GOString     $!name                 ;
	has int          $.indx                  is rw;
	has int          $.data_cache_field_indx is rw;
	has int          $.field_type_pos        is rw;
	has int          $.aggregations          is rw;
}

class GODataSlicerFieldClass is repr<CStruct> is export {
	has GObjectClass $!base;
}

class GnmBorder is repr<CStruct> is export {
	has GnmStyleBorderType $!line_type   ;
	has GnmColor           $!color       ;
	has int                $.begin_margin is rw;
	has int                $.end_margin   is rw;
	has int                $.width        is rw;
	has gint               $.ref_count    is rw;
}

class GnmCell is repr<CStruct> is export {
	has GnmDependent $!base ;
	has GnmCellPos   $!pos  ;
	has GnmValue     $!value;
}

class GnmCellCombo is repr<CStruct> is export {
	has SheetObject $!parent;
	has SheetView   $!sv    ;
}

class GnmCellComboClass is repr<CStruct> is export {
	has SheetObjectClass $!parent_class;
}

class GnmCellDrawStyle is repr<CStruct> is export {
	has GdkRGBA $!extension_marker_color;
	has int     $.extension_marker_size  is rw;
}

class GnmCellPos is repr<CStruct> is export {
	has int $.col is rw;
	has int $.row is rw;
}

class GnmCellRef is repr<CStruct> is export {
	has Sheet $!sheet       ;
	has int   $.col          is rw;
	has int   $.row          is rw;
	has char  $!col_relative;
	has char  $!row_relative;
}

class GnmCellRendererExprEntryClass_ is repr<CStruct> is export {
	has GnmCellRendererTextClass $!parent_class;
}

class GnmCellRendererExprEntry_ is repr<CStruct> is export {
	has GnmCellRendererText $!parent;
	has WBCGtk              $!wbcg  ;
	has GnmExprEntry        $!entry ;
}

class GnmCellRendererTextClass_ is repr<CStruct> is export {
	has GtkCellRendererTextClass $!parent_class;
}

class GnmCellRendererText_ is repr<CStruct> is export {
	has GtkCellRendererText $!parent;
}

class GnmCellRendererToggleClass_ is repr<CStruct> is export {
	has GtkCellRendererToggleClass $!parent_class;
}

class GnmCellRendererToggle_ is repr<CStruct> is export {
	has GtkCellRendererToggle $!parent;
	has GdkPixbuf             $!pixbuf;
}

class GnmColor is repr<CStruct> is export {
	has GOColor  $!go_color ;
	has int      $.ref_count is rw;
	has gboolean $!is_auto  ;
}

class GnmCommandClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
	has UndoCmd      $!undo_cmd    ;
	has RedoCmd      $!redo_cmd    ;
	has RepeatCmd    $!repeat_cmd  ;
}

class GnmCompleteSheet is repr<CStruct> is export {
	has GnmComplete $!parent      ;
	has Sheet       $!sheet       ;
	has GnmCellPos  $!entry       ;
	has GnmCellPos  $!current     ;
	has GnmCell     $!cell        ;
	has char        $!current_text;
}

class GnmCompleteSheetClass is repr<CStruct> is export {
	has GnmCompleteClass $!parent_class;
}

class GnmComplete_ is repr<CStruct> is export {
	has GObject                  $!parent        ;
	has GnmCompleteMatchNotifyFn $!notify        ;
	has void                     $!notify_closure;
	has char                     $!text          ;
	has guint                    $.idle_tag       is rw;
}

class GnmDBCriteria is repr<CStruct> is export {
	has int    $.row        is rw;
	has GSList $!conditions;
}

class GnmDashedCanvasLineClass is repr<CStruct> is export {
	has GocLineClass $!parent_class;
}

class GnmDashedCanvasLine_ is repr<CStruct> is export {
	has GocLine            $!line            ;
	has GnmStyleBorderType $!dash_style_index;
}

class GnmDepManaged is repr<CStruct> is export {
	has GnmDependent $!base;
}

class GnmExprArrayElem is repr<CStruct> is export {
	has guint8  $.oper is rw;
	has guint32 $.x    is rw;
	has guint32 $.y    is rw;
}

class GnmExprCellRef is repr<CStruct> is export {
	has guint8     $.oper is rw;
	has GnmCellRef $!ref ;
}

class GnmExprFunction is repr<CStruct> is export {
	has guint8          $.oper is rw;
	has int             $.argc is rw;
	has GnmFunc         $!func;
	has GnmExprConstPtr $!argv;
}

class GnmExprName is repr<CStruct> is export {
	has guint8       $.oper              is rw;
	has Sheet        $!optional_scope   ;
	has Workbook     $!optional_wb_scope;
	has GnmNamedExpr $!name             ;
}

class GnmExprSet is repr<CStruct> is export {
	has guint8          $.oper is rw;
	has int             $.argc is rw;
	has GnmExprConstPtr $!argv;
}

class GnmExprWalk is repr<CStruct> is export {
	has gpointer $!user ;
	has gboolean $!stop ;
	has guint    $.flags is rw;
}

class GnmFTCategory is repr<CStruct> is export {
	has char     $!directory  ;
	has gboolean $!is_writable;
	has char     $!name       ;
	has char     $!description;
}

class GnmFTCategoryGroup is repr<CStruct> is export {
	has GList $!categories ;
	has char  $!name       ;
	has char  $!description;
}

class GnmFTColRowInfo is repr<CStruct> is export {
	has int $.offset         is rw;
	has int $.offset_gravity is rw;
	has int $.size           is rw;
}

class GnmFTMember is repr<CStruct> is export {
	has GnmFTColRowInfo    $!row      ;
	has GnmFTColRowInfo    $!col      ;
	has GnmFTFreqDirection $!direction;
	has int                $.repeat    is rw;
	has int                $.skip      is rw;
	has int                $.edge      is rw;
	has GnmStyle           $!mstyle   ;
}

class GnmFilter is repr<CStruct> is export {
	has int       $.ref_count is rw;
	has Sheet     $!sheet    ;
	has GnmRange  $!r        ;
	has GPtrArray $!fields   ;
	has gboolean  $!is_active;
}

class GnmFilterCombo is repr<CStruct> is export {
	has SheetObject        $!parent;
	has GnmFilterCondition $!cond  ;
	has GnmFilter          $!filter;
}

class GnmFilterCondition is repr<CStruct> is export {
	has GnmFilterOp $!op    ;
	has GnmValue    $!value ;
	has gboolean    $!is_and;
	has double      $!count ;
}

class GnmFontButton is repr<CStruct> is export {
	has GtkButton $!button;
	has gpointer  $!priv  ;
}

class GnmGraphDataClosure is repr<CStruct> is export {
	has int              $.colrowmode  is rw;
	has gboolean         $!share_x    ;
	has gboolean         $!new_sheet  ;
	has GObject          $!obj        ;
	has GogDataAllocator $!dalloc     ;
	has GnmSOAnchorMode  $!anchor_mode;
}

class GnmHLink is repr<CStruct> is export {
	has GObject $!obj   ;
	has Str     $!tip   ;
	has Str     $!target;
	has Sheet   $!sheet ;
}

class GnmIterSolverClass is repr<CStruct> is export {
	has GnmSolverClass $!parent_class;
}

class GnmIterSolver_ is repr<CStruct> is export {
	has GnmSolver         $!parent    ;
	has gnm_float         $!xk        ;
	has gnm_float         $!yk        ;
	has GnmSolverIterator $!iterator  ;
	has guint64           $.iterations is rw;
	has guint             $.idle_tag   is rw;
}

class GnmLexerItem is repr<CStruct> is export {
	has gsize $!start;
	has gsize $!end  ;
	has int   $.token is rw;
}

class GnmMatrix_ is repr<CStruct> is export {
	has int       $.ref_count is rw;
	has gnm_float $!data     ;
	has int       $.cols      is rw;
	has int       $.rows      is rw;
}

class GnmPageBreak is repr<CStruct> is export {
	has int              $.pos  is rw;
	has GnmPageBreakType $!type;
}

class GnmPageBreaks is repr<CStruct> is export {
	has gboolean $!is_vert;
	has GArray   $!details;
}

class GnmPaneSlideInfo is repr<CStruct> is export {
	has int      $.col       is rw;
	has int      $.row       is rw;
	has gpointer $!user_data;
}

class GnmParseError is repr<CStruct> is export {
	has GError $!err       ;
	has int    $.begin_char is rw;
	has int    $.end_char   is rw;
}

class GnmParsePos is repr<CStruct> is export {
	has GnmCellPos $!eval ;
	has Sheet      $!sheet;
	has Workbook   $!wb   ;
}

class GnmPasteTarget is repr<CStruct> is export {
	has Sheet         $!sheet      ;
	has GnmRange      $!range      ;
	has GnmPasteFlags $!paste_flags;
}

class GnmPluginServiceSolverCallbacks is repr<CStruct> is export {
	has GnmSolverCreator           $!creator   ;
	has GnmSolverFactoryFunctional $!functional;
}

class GnmPrintDesiredDisplay is repr<CStruct> is export {
	has GtkUnit $!top   ;
	has GtkUnit $!bottom;
	has GtkUnit $!left  ;
	has GtkUnit $!right ;
	has GtkUnit $!header;
	has GtkUnit $!footer;
}

class GnmPrintHF is repr<CStruct> is export {
	has char $!left_format  ;
	has char $!middle_format;
	has char $!right_format ;
}

class GnmRange is repr<CStruct> is export {
	has GnmCellPos $!start;
	has GnmCellPos $!end  ;
}

class GnmRangeRef is repr<CStruct> is export {
	has GnmCellRef $!a;
	has GnmCellRef $!b;
}

class GnmRenderedValueCollection is repr<CStruct> is export {
	has PangoContext $!context;
	has gsize        $!size   ;
	has GHashTable   $!values ;
}

class GnmScenarioClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}

class GnmScenarioItem is repr<CStruct> is export {
	has GnmDepManaged $!dep  ;
	has GnmValue      $!value;
}

class GnmScenario_ is repr<CStruct> is export {
	has GObject $!parent ;
	has Sheet   $!sheet  ;
	has char    $!name   ;
	has char    $!comment;
	has GSList  $!items  ;
}

class GnmSearchFilterResult is repr<CStruct> is export {
	has GnmEvalPos            $!ep   ;
	has GnmSearchReplaceLocus $!locus;
}

class GnmSearchReplace is repr<CStruct> is export {
	has GOSearchReplace           $!base                     ;
	has GnmSearchReplaceScope     $!scope                    ;
	has char                      $!range_text               ;
	has Sheet                     $!sheet                    ;
	has gboolean                  $!query                    ;
	has gboolean                  $!is_number                ;
	has gnm_float                 $!low_number               ;
	has gnm_float                 $!high_number              ;
	has gboolean                  $!search_strings           ;
	has gboolean                  $!search_other_values      ;
	has gboolean                  $!search_expressions       ;
	has gboolean                  $!search_expression_results;
	has gboolean                  $!search_comments          ;
	has gboolean                  $!search_scripts           ;
	has gboolean                  $!invert                   ;
	has GnmSearchReplaceError     $!error_behaviour          ;
	has gboolean                  $!replace_keep_strings     ;
	has gboolean                  $!by_row                   ;
	has GnmSearchReplaceQueryFunc $!query_func               ;
	has void                      $!user_data                ;
}

class GnmSearchReplaceCellResult is repr<CStruct> is export {
	has GnmCell $!cell    ;
	has char    $!old_text;
	has char    $!new_text;
}

class GnmSheetRange is repr<CStruct> is export {
	has Sheet    $!sheet;
	has GnmRange $!range;
}

class GnmSheetSize is repr<CStruct> is export {
	has int $.max_cols is rw;
	has int $.max_rows is rw;
}

class GnmSheetSlicerCombo is repr<CStruct> is export {
	has GnmCellCombo      $!parent;
	has GODataSlicerField $!dsf   ;
}

class GnmSimpleCanvas is repr<CStruct> is export {
	has GocCanvas       $!canvas;
	has SheetControlGUI $!scg   ;
}

class GnmSimpleCanvasClass is repr<CStruct> is export {
	has GocCanvasClass $!canvas;
}

class GnmSolverConstraint_ is repr<CStruct> is export {
	has GnmSolverConstraintType $!type;
	has GnmDepManaged           $!lhs ;
	has GnmDepManaged           $!rhs ;
}

class GnmSolverFactoryClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}

class GnmSolverFactory_ is repr<CStruct> is export {
	has GObject                    $!parent    ;
	has char                       $!id        ;
	has char                       $!name      ;
	has GnmSolverModelType         $!type      ;
	has GnmSolverCreator           $!creator   ;
	has GnmSolverFactoryFunctional $!functional;
	has gpointer                   $!data      ;
	has GDestroyNotify             $!notify    ;
}

class GnmSolverIteratorCompoundClass is repr<CStruct> is export {
	has GnmSolverIteratorClass $!parent_class;
}

class GnmSolverIterator_ is repr<CStruct> is export {
	has GObject $!parent;
}

class GnmSolverParametersClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}

class GnmSolverResult is repr<CStruct> is export {
	has GObject                $!parent  ;
	has GnmSolverResultQuality $!quality ;
	has gnm_float              $!value   ;
	has gnm_float              $!solution;
}

class GnmSolverResultClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}

class GnmSolverSensitivityClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}

class GnmSortClause is repr<CStruct> is export {
	has int      $.offset is rw;
	has gboolean $!asc   ;
	has gboolean $!cs    ;
	has gboolean $!val   ;
}

class GnmSortData is repr<CStruct> is export {
	has Sheet         $!sheet         ;
	has GnmRange      $!range         ;
	has int           $.num_clause     is rw;
	has GnmSortClause $!clauses       ;
	has gboolean      $!top           ;
	has gboolean      $!retain_formats;
	has char          $!locale        ;
}

class GnmStyleCond is repr<CStruct> is export {
	has GnmStyle        $!overlay;
	has GnmStyleCondDep $!deps   ;
	has GnmStyleCondOp  $!op     ;
}

class GnmStyleCondDep is repr<CStruct> is export {
	has GnmDependent $!base    ;
	has GnmCellPos   $!pos     ;
	has GnmDependent $!dep_cont;
}

class GnmStyleRegion is repr<CStruct> is export {
	has GnmRange $!range;
	has GnmStyle $!style;
}

class GnmTabulateInfo is repr<CStruct> is export {
	has GnmCell   $!target          ;
	has int       $.dims             is rw;
	has GnmCell   $!cells           ;
	has gnm_float $!minima          ;
	has gnm_float $!maxima          ;
	has gnm_float $!steps           ;
	has gboolean  $!with_coordinates;
}

class GnmUndoColrowRestoreStateGroup is repr<CStruct> is export {
	has GOUndo           $!base       ;
	has Sheet            $!sheet      ;
	has gboolean         $!is_cols    ;
	has ColRowIndexList  $!selection  ;
	has ColRowStateGroup $!saved_state;
}

class GnmUndoColrowRestoreStateGroupClass is repr<CStruct> is export {
	has GOUndoClass $!base;
}

class GnmUndoColrowSetSizes is repr<CStruct> is export {
	has GOUndo          $!base     ;
	has Sheet           $!sheet    ;
	has gboolean        $!is_cols  ;
	has ColRowIndexList $!selection;
	has int             $.new_size  is rw;
	has int             $.from      is rw;
	has int             $.to        is rw;
}

class GnmUndoColrowSetSizesClass is repr<CStruct> is export {
	has GOUndoClass $!base;
}

class GnmUndoFilterSetConditionClass is repr<CStruct> is export {
	has GOUndoClass $!base;
}

class GnmValidation is repr<CStruct> is export {
	has int             $.ref_count    is rw;
	has GOString        $!title       ;
	has GOString        $!msg         ;
	has GnmDepManaged   $!deps        ;
	has ValidationStyle $!style       ;
	has ValidationType  $!type        ;
	has ValidationOp    $!op          ;
	has gboolean        $!allow_blank ;
	has gboolean        $!use_dropdown;
}

class MainInfo_t is repr<CStruct> is export {
	has GtkRadioButton $!main_separated     ;
	has GtkRadioButton $!main_fixed         ;
	has GtkSpinButton  $!main_startrow      ;
	has GtkSpinButton  $!main_stoprow       ;
	has GtkLabel       $!main_lines         ;
	has GtkWidget      $!main_data_container;
	has GtkCheckButton $!line_break_unix    ;
	has GtkCheckButton $!line_break_windows ;
	has GtkCheckButton $!line_break_mac     ;
	has GOCharmapSel   $!charmap_selector   ;
	has RenderData_t   $!renderdata         ;
}

class SOWidgetView is repr<CStruct> is export {
	has SheetObjectView $!parent;
}

class SOWidgetViewClass is repr<CStruct> is export {
	has SheetObjectViewClass $!parent_class;
}

class SheetControl is repr<CStruct> is export {
	has GObject         $!object;
	has SheetView       $!view  ;
	has WorkbookControl $!wbc   ;
}

class SheetControlGUIClass is repr<CStruct> is export {
	has SheetControlClass $!parent_class;
}

class SheetObjectAnchor is repr<CStruct> is export {
	has GODrawingAnchor $!base      ;
	has GnmRange        $!cell_bound;
	has double          $!offset    ;
	has GnmSOAnchorMode $!mode      ;
}

class SheetObject is repr<CStruct> is export {
	has GObject           $!parent_object;
	has Sheet             $!sheet        ;
	has GList             $!realized_list;
	has SheetObjectAnchor $!anchor       ;
	has SheetObjectFlags  $!flags        ;
	has Str               $!name         ;
}

class SheetObjectView is repr<CStruct> is export {
	has GocGroup        $!base       ;
	has GnmSOResizeMode $!resize_mode;
}

class SheetPrivate is repr<CStruct> is export {
	has GnmRange   $!unhidden_region        ;
	has char       $!enable_showhide_detail ;
	has char       $!recompute_visibility   ;
	has char       $!recompute_spans        ;
	has char       $!recompute_max_col_group;
	has char       $!recompute_max_row_group;
	has char       $!resize_scrollbar       ;
	has char       $!resize                 ;
	has GnmCellPos $!reposition_objects     ;
	has char       $!filters_changed        ;
	has char       $!objects_changed        ;
}

class SheetViewClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}

class WorkbookControl is repr<CStruct> is export {
	has GODocControl $!base                    ;
	has WorkbookView $!wb_view                 ;
	has gulong       $!clipboard_changed_signal;
}

class analysis_tools_data_advanced_filter_t is repr<CStruct> is export {
	has analysis_tools_data_generic_b_t $!base            ;
	has gboolean                        $!unique_only_flag;
}

class analysis_tools_data_anova_single_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base ;
	has gnm_float                     $!alpha;
}

class analysis_tools_data_anova_two_factor_t is repr<CStruct> is export {
	has analysis_tools_error_code_t $!err        ;
	has WorkbookControl             $!wbc        ;
	has GnmValue                    $!input      ;
	has group_by_t                  $!group_by   ;
	has gboolean                    $!labels     ;
	has gnm_float                   $!alpha      ;
	has gint                        $.replication is rw;
	has gint                        $.rows        is rw;
	has gint                        $.n_c         is rw;
	has gint                        $.n_r         is rw;
}

class analysis_tools_data_auto_expression_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base    ;
	has gboolean                      $!multiple;
	has gboolean                      $!below   ;
	has GnmFunc                       $!func    ;
}

class analysis_tools_data_chi_squared_t is repr<CStruct> is export {
	has WorkbookControl $!wbc         ;
	has GnmValue        $!input       ;
	has gboolean        $!labels      ;
	has gboolean        $!independence;
	has gnm_float       $!alpha       ;
	has gint            $.n_c          is rw;
	has gint            $.n_r          is rw;
}

class analysis_tools_data_descriptive_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base              ;
	has gboolean                      $!summary_statistics;
	has gboolean                      $!confidence_level  ;
	has gboolean                      $!kth_largest       ;
	has gboolean                      $!kth_smallest      ;
	has gboolean                      $!use_ssmedian      ;
	has int                           $.k_smallest         is rw;
	has int                           $.k_largest          is rw;
	has gnm_float                     $!c_level           ;
}

class analysis_tools_data_exponential_smoothing_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base          ;
	has gnm_float                     $!damp_fact     ;
	has gnm_float                     $!g_damp_fact   ;
	has gnm_float                     $!s_damp_fact   ;
	has int                           $.s_period       is rw;
	has int                           $.std_error_flag is rw;
	has int                           $.df             is rw;
	has gboolean                      $!show_graph    ;
	has exponential_smoothing_type_t  $!es_type       ;
}

class analysis_tools_data_fourier_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base   ;
	has gboolean                      $!inverse;
}

class analysis_tools_data_frequency_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base         ;
	has gboolean                      $!predetermined;
	has GnmValue                      $!bin          ;
	has gnm_float                     $!max          ;
	has gnm_float                     $!min          ;
	has gint                          $.n             is rw;
	has gboolean                      $!percentage   ;
	has gboolean                      $!exact        ;
	has chart_freq_t                  $!chart        ;
}

class analysis_tools_data_generic_b_t is repr<CStruct> is export {
	has analysis_tools_error_code_t $!err    ;
	has WorkbookControl             $!wbc    ;
	has GnmValue                    $!range_1;
	has GnmValue                    $!range_2;
	has gboolean                    $!labels ;
	has gnm_float                   $!alpha  ;
}

class analysis_tools_data_generic_t is repr<CStruct> is export {
	has analysis_tools_error_code_t $!err     ;
	has WorkbookControl             $!wbc     ;
	has GSList                      $!input   ;
	has group_by_t                  $!group_by;
	has gboolean                    $!labels  ;
}

class analysis_tools_data_histogram_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base         ;
	has gboolean                      $!predetermined;
	has GnmValue                      $!bin          ;
	has analysis_histogram_bin_type_t $!bin_type     ;
	has gboolean                      $!max_given    ;
	has gboolean                      $!min_given    ;
	has gnm_float                     $!max          ;
	has gnm_float                     $!min          ;
	has gint                          $.n             is rw;
	has gboolean                      $!percentage   ;
	has gboolean                      $!cumulative   ;
	has gboolean                      $!only_numbers ;
	has chart_t                       $!chart        ;
}

class analysis_tools_data_kaplan_meier_t is repr<CStruct> is export {
	has analysis_tools_data_generic_b_t $!base          ;
	has GnmValue                        $!range_3       ;
	has gboolean                        $!censored      ;
	has int                             $.censor_mark    is rw;
	has int                             $.censor_mark_to is rw;
	has gboolean                        $!chart         ;
	has gboolean                        $!ticks         ;
	has gboolean                        $!std_err       ;
	has gboolean                        $!median        ;
	has gboolean                        $!logrank_test  ;
	has GSList                          $!group_list    ;
}

class analysis_tools_data_moving_average_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base          ;
	has int                           $.interval       is rw;
	has int                           $.std_error_flag is rw;
	has int                           $.df             is rw;
	has int                           $.offset         is rw;
	has gboolean                      $!show_graph    ;
	has moving_average_type_t         $!ma_type       ;
}

class analysis_tools_data_normality_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base ;
	has gnm_float                     $!alpha;
	has normality_test_type_t         $!type ;
	has gboolean                      $!graph;
}

class analysis_tools_data_one_mean_test_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base ;
	has gnm_float                     $!mean ;
	has gnm_float                     $!alpha;
}

class analysis_tools_data_ranking_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base   ;
	has gboolean                      $!av_ties;
}

class analysis_tools_data_regression_t is repr<CStruct> is export {
	has analysis_tools_data_generic_b_t $!base               ;
	has group_by_t                      $!group_by           ;
	has gboolean                        $!intercept          ;
	has gboolean                        $!multiple_regression;
	has gboolean                        $!multiple_y         ;
	has gboolean                        $!residual           ;
	has GSList                          $!indep_vars         ;
}

class analysis_tools_data_sampling_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base     ;
	has gboolean                      $!periodic ;
	has gboolean                      $!row_major;
	has guint                         $.offset    is rw;
	has guint                         $.size      is rw;
	has guint                         $.period    is rw;
	has guint                         $.number    is rw;
}

class analysis_tools_data_sign_test_t is repr<CStruct> is export {
	has analysis_tools_data_generic_t $!base  ;
	has gnm_float                     $!median;
	has gnm_float                     $!alpha ;
}

class analysis_tools_data_sign_test_two_t is repr<CStruct> is export {
	has analysis_tools_data_generic_b_t $!base  ;
	has gnm_float                       $!median;
}

class analysis_tools_data_ttests_t is repr<CStruct> is export {
	has analysis_tools_data_generic_b_t $!base     ;
	has gnm_float                       $!mean_diff;
	has gnm_float                       $!var1     ;
	has gnm_float                       $!var2     ;
}

class analysis_tools_kaplan_meier_group_t is repr<CStruct> is export {
	has char  $!name      ;
	has guint $.group_from is rw;
	has guint $.group_to   is rw;
}

class auto_expr is repr<CStruct> is export {
	has GnmFunc       $!func              ;
	has char          $!descr             ;
	has GnmValue      $!value             ;
	has gboolean      $!use_max_precision ;
	has GnmDepManaged $!dep               ;
	has gulong        $!sheet_detached_sig;
}

class bernoulli_random_tool_t is repr<CStruct> is export {
	has gnm_float $!p;
}

class beta_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
	has gnm_float $!b;
}

class binomial_random_tool_t is repr<CStruct> is export {
	has gnm_float $!p     ;
	has int       $.trials is rw;
}

class cauchy_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
}

class chisq_random_tool_t is repr<CStruct> is export {
	has gnm_float $!nu;
}

class comment is repr<CStruct> is export {
	has GnmComment $!selected;
	has GtkWidget  $!item    ;
	has int        $.timer    is rw;
	has int        $.x        is rw;
	has int        $.y        is rw;
}

class compiled_terminator is repr<CStruct> is export {
	has guchar $!min;
	has guchar $!max;
}

class cursor is repr<CStruct> is export {
	has GnmCellPos $!base_corner;
	has GnmCellPos $!move_corner;
}

class data_analysis_output_t is repr<CStruct> is export {
	has data_analysis_output_type_t $!type             ;
	has Sheet                       $!sheet            ;
	has int                         $.start_col         is rw;
	has int                         $.cols              is rw;
	has int                         $.start_row         is rw;
	has int                         $.rows              is rw;
	has int                         $.offset_col        is rw;
	has int                         $.offset_row        is rw;
	has gboolean                    $!autofit_flag     ;
	has gboolean                    $!autofit_noshrink ;
	has gboolean                    $!clear_outputrange;
	has gboolean                    $!retain_format    ;
	has gboolean                    $!retain_comments  ;
	has gboolean                    $!put_formulas     ;
	has WorkbookControl             $!wbc              ;
	has GSList                      $!sos              ;
	has gboolean                    $!omit_so          ;
	has gboolean                    $!use_gfree        ;
}

class data_shuffling_t is repr<CStruct> is export {
	has GSList                 $!changes ;
	has int                    $.a_col    is rw;
	has int                    $.b_col    is rw;
	has int                    $.a_row    is rw;
	has int                    $.b_row    is rw;
	has int                    $.cols     is rw;
	has int                    $.rows     is rw;
	has int                    $.type     is rw;
	has WorkbookControl        $!wbc     ;
	has data_analysis_output_t $!dao     ;
	has Sheet                  $!sheet   ;
	has GnmRange               $!tmp_area;
}

class dates is repr<CStruct> is export {
	has gnm_float $!minimum;
	has gnm_float $!maximum;
}

class defaults is repr<CStruct> is export {
	has int      $.col_width  is rw;
	has int      $.row_height is rw;
	has GnmStyle $!style     ;
	has GnmValue $!value     ;
}

class delayedMovement is repr<CStruct> is export {
	has int           $.timer   is rw;
	has int           $.counter is rw;
	has int           $.n       is rw;
	has gboolean      $!jump   ;
	has gboolean      $!horiz  ;
	has SCGUIMoveFunc $!handler;
}

class dim is repr<CStruct> is export {
	has int $.cols is rw;
	has int $.rows is rw;
}

class discrete_random_tool_t is repr<CStruct> is export {
	has GnmValue $!range;
}

class drag is repr<CStruct> is export {
	has int        $.button          is rw;
	has gboolean   $!created_objects;
	has gboolean   $!had_motion     ;
	has GHashTable $!ctrl_pts       ;
	has double     $!last_x         ;
	has double     $!last_y         ;
	has double     $!origin_x       ;
	has double     $!origin_y       ;
}

class edges is repr<CStruct> is export {
	has gboolean $!left  ;
	has gboolean $!right ;
	has gboolean $!top   ;
	has gboolean $!bottom;
}

class edit_line is repr<CStruct> is export {
	has GnmExprEntry  $!entry                 ;
	has GnmExprEntry  $!temp_entry            ;
	has GtkWidget     $!guru                  ;
	has gulong        $!signal_changed        ;
	has gulong        $!signal_insert         ;
	has gulong        $!signal_delete         ;
	has gulong        $!signal_cursor_pos     ;
	has gulong        $!signal_selection_bound;
	has PangoAttrList $!cell_attrs            ;
	has PangoAttrList $!markup                ;
	has PangoAttrList $!full_content          ;
	has PangoAttrList $!cur_fmt               ;
}

class edit_pos_changed is repr<CStruct> is export {
	has char $!location;
	has char $!content ;
	has char $!style   ;
}

class exponential_random_tool_t is repr<CStruct> is export {
	has gnm_float $!b;
}

class exppow_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
	has gnm_float $!b;
}

class fdist_random_tool_t is repr<CStruct> is export {
	has gnm_float $!nu1;
	has gnm_float $!nu2;
}

class fill_series_t is repr<CStruct> is export {
	has fill_series_type_t      $!type          ;
	has fill_series_date_unit_t $!date_unit     ;
	has gboolean                $!series_in_rows;
	has gnm_float               $!step_value    ;
	has gnm_float               $!stop_value    ;
	has gnm_float               $!start_value   ;
	has gboolean                $!is_step_set   ;
	has gboolean                $!is_stop_set   ;
	has gint                    $.n              is rw;
}

class first_offset is repr<CStruct> is export {
	has gint64 $.x is rw;
	has gint64 $.y is rw;
}

class gamma_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
	has gnm_float $!b;
}

class gaussian_tail_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a    ;
	has gnm_float $!sigma;
}

class geometric_random_tool_t is repr<CStruct> is export {
	has gnm_float $!p;
}

class gumbel_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
	has gnm_float $!b;
}

class im is repr<CStruct> is export {
	has GtkWidget $!item ;
	has int       $.timer is rw;
}

class iteration is repr<CStruct> is export {
	has gboolean  $!enabled   ;
	has int       $.max_number is rw;
	has gnm_float $!tolerance ;
}

class laplace_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
}

class levy_random_tool_t is repr<CStruct> is export {
	has gnm_float $!c    ;
	has gnm_float $!alpha;
}

class logarithmic_random_tool_t is repr<CStruct> is export {
	has gnm_float $!p;
}

class logistic_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
}

class lognormal_random_tool_t is repr<CStruct> is export {
	has gnm_float $!zeta ;
	has gnm_float $!sigma;
}

class negbinom_random_tool_t is repr<CStruct> is export {
	has gnm_float $!p;
	has int       $.f is rw;
}

class normal_random_tool_t is repr<CStruct> is export {
	has gnm_float $!mean ;
	has gnm_float $!stdev;
}

class pareto_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
	has gnm_float $!b;
}

class percentage is repr<CStruct> is export {
	has double $!x;
	has double $!y;
}

class poisson_random_tool_t is repr<CStruct> is export {
	has gnm_float $!lambda;
}

class protected_allow is repr<CStruct> is export {
	has gboolean $!edit_objects         ;
	has gboolean $!edit_scenarios       ;
	has gboolean $!cell_formatting      ;
	has gboolean $!column_formatting    ;
	has gboolean $!row_formatting       ;
	has gboolean $!insert_columns       ;
	has gboolean $!insert_rows          ;
	has gboolean $!insert_hyperlinks    ;
	has gboolean $!delete_columns       ;
	has gboolean $!delete_rows          ;
	has gboolean $!select_locked_cells  ;
	has gboolean $!sort_ranges          ;
	has gboolean $!edit_auto_filters    ;
	has gboolean $!edit_pivottable      ;
	has gboolean $!select_unlocked_cells;
}

class rangesel is repr<CStruct> is export {
	has gboolean   $!active     ;
	has GnmCellPos $!base_corner;
	has GnmCellPos $!move_corner;
	has GnmRange   $!displayed  ;
}

class rayleigh_random_tool_t is repr<CStruct> is export {
	has gnm_float $!sigma;
}

class rayleigh_tail_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a    ;
	has gnm_float $!sigma;
}

class sep is repr<CStruct> is export {
	has GSList   $!str       ;
	has char     $!chr       ;
	has gboolean $!duplicates;
}

class series is repr<CStruct> is export {
	has gnm_float $!minimum;
	has gnm_float $!maximum;
	has gnm_float $!step   ;
}

class simstats_t is repr<CStruct> is export {
	has gnm_float $!min       ;
	has gnm_float $!max       ;
	has gnm_float $!mean      ;
	has gnm_float $!median    ;
	has gnm_float $!mode      ;
	has gnm_float $!stddev    ;
	has gnm_float $!var       ;
	has gnm_float $!skew      ;
	has gnm_float $!kurtosis  ;
	has gnm_float $!range     ;
	has gnm_float $!confidence;
	has gnm_float $!lower     ;
	has gnm_float $!upper     ;
	has int       $.errmask    is rw;
}

class simulation_t is repr<CStruct> is export {
	has int         $.n_input_vars  is rw;
	has int         $.n_output_vars is rw;
	has int         $.n_vars        is rw;
	has int         $.first_round   is rw;
	has int         $.last_round    is rw;
	has int         $.n_iterations  is rw;
	has int         $.max_time      is rw;
	has GnmValue    $!inputs       ;
	has GnmValue    $!outputs      ;
	has GnmRangeRef $!ref_inputs   ;
	has GnmRangeRef $!ref_outputs  ;
	has GSList      $!list_inputs  ;
	has GSList      $!list_outputs ;
	has Str         $!cellnames    ;
	has gint64      $.start         is rw;
	has gint64      $.end           is rw;
	has simstats_t  $!stats        ;
}

class tdist_random_tool_t is repr<CStruct> is export {
	has gnm_float $!nu;
}

class tools_data_random_cor_t is repr<CStruct> is export {
	has WorkbookControl       $!wbc        ;
	has GnmValue              $!matrix     ;
	has random_gen_cor_type_t $!matrix_type;
	has gint                  $.count       is rw;
	has gint                  $.variables   is rw;
}

class tools_data_random_t is repr<CStruct> is export {
	has random_tool_t         $!param       ;
	has WorkbookControl       $!wbc         ;
	has gint                  $.n_vars       is rw;
	has gint                  $.count        is rw;
	has random_distribution_t $!distribution;
}

class uniform_random_tool_t is repr<CStruct> is export {
	has gnm_float $!lower_limit;
	has gnm_float $!upper_limit;
}

class weibull_random_tool_t is repr<CStruct> is export {
	has gnm_float $!a;
	has gnm_float $!b;
}
