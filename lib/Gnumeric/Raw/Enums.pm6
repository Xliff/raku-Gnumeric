constant AnalysisToolEngineT is export := guint32;
our enum AnalysisToolEngineTEnum is export <
  TOOL_ENGINE_UPDATE_DAO
  TOOL_ENGINE_UPDATE_DESCRIPTOR
  TOOL_ENGINE_PREPARE_OUTPUT_RANGE
  TOOL_ENGINE_LAST_VALIDITY_CHECK
  TOOL_ENGINE_FORMAT_OUTPUT_RANGE
  TOOL_ENGINE_PERFORM_CALC
  TOOL_ENGINE_CLEAN_UP
>;

constant AnalysisToolsErrorCodeT is export := guint32;
our enum AnalysisToolsErrorCodeTEnum is export <
  analysis_tools_noerr
  analysis_tools_reported_err
  analysis_tools_reported_err_input
  analysis_tools_missing_data
  analysis_tools_too_few_cols
  analysis_tools_too_few_rows
  analysis_tools_replication_invalid
  analysis_tools_no_records_found
  analysis_tools_invalid_field
>;

constant ChartFreqT is export := guint32;
our enum ChartFreqTEnum is export <
  NO_CHART
  BAR_CHART
  COLUMN_CHART
>;

constant ChartT is export := guint32;
our enum ChartTEnum is export <
  NO_CHART
  HISTOGRAM_CHART
  BAR_CHART
  COLUMN_CHART
>;

constant CmdObjectRaiseSelector is export := guint32;
our enum CmdObjectRaiseSelectorEnum is export <
  cmd_object_pull_to_front
  cmd_object_pull_forward
  cmd_object_push_backward
  cmd_object_push_to_back
>;

constant ColRowSelectionType is export := guint32;
our enum ColRowSelectionTypeEnum is export <
  COL_ROW_NO_SELECTION
  COL_ROW_PARTIAL_SELECTION
  COL_ROW_FULL_SELECTION
>;

constant CollectFlags is export := guint32;
our enum CollectFlagsEnum is export <
  COLLECT_IGNORE_STRINGS
  COLLECT_ZERO_STRINGS
  COLLECT_COERCE_STRINGS
  COLLECT_IGNORE_BOOLS
  COLLECT_ZEROONE_BOOLS
  COLLECT_IGNORE_ERRORS
  COLLECT_ZERO_ERRORS
  COLLECT_IGNORE_BLANKS
  COLLECT_ZERO_BLANKS
  COLLECT_IGNORE_SUBTOTAL
  COLLECT_SORT
  COLLECT_ORDER_IRRELEVANT
  COLLECT_INFO
>;

constant DataAnalysisOutputTypeT is export := guint32;
our enum DataAnalysisOutputTypeTEnum is export <
  NewSheetOutput
  NewWorkbookOutput
  RangeOutput
  InPlaceOutput
>;

constant ExponentialSmoothingTypeT is export := guint32;
our enum ExponentialSmoothingTypeTEnum is export <
  exp_smoothing_type_ses_h
  exp_smoothing_type_ses_r
  exp_smoothing_type_des
  exp_smoothing_type_ates
  exp_smoothing_type_mtes
>;

constant FillSeriesDateUnitT is export := guint32;
our enum FillSeriesDateUnitTEnum is export <
  FillSeriesUnitDay
  FillSeriesUnitWeekday
  FillSeriesUnitMonth
  FillSeriesUnitYear
>;

constant FillSeriesTypeT is export := guint32;
our enum FillSeriesTypeTEnum is export <
  FillSeriesTypeLinear
  FillSeriesTypeGrowth
  FillSeriesTypeDate
>;

constant FormatdialogpositionT is export := gint32;
our enum FormatdialogpositionTEnum is export <
  FD_CURRENT
  FD_NUMBER
  FD_ALIGNMENT
  FD_FONT
  FD_BORDER
  FD_BACKGROUND
  FD_PROTECTION
  FD_VALIDATION
  FD_INPUT_MSG
  FD_LAST
>;

constant GOAggregateBy is export := guint32;
our enum GOAggregateByEnum is export <
  GO_AGGREGATE_AUTO
  GO_AGGREGATE_BY_MIN
  GO_AGGREGATE_BY_MAX
  GO_AGGREGATE_BY_SUM
  GO_AGGREGATE_BY_PRODUCT
  GO_AGGREGATE_BY_COUNT
  GO_AGGREGATE_BY_COUNTA
  GO_AGGREGATE_BY_AVERAGE
  GO_AGGREGATE_BY_STDDEV
  GO_AGGREGATE_BY_STDDEVP
  GO_AGGREGATE_BY_VAR
  GO_AGGREGATE_BY_VARP
>;

constant GODataCacheFieldType is export := guint32;
our enum GODataCacheFieldTypeEnum is export <
  GO_DATA_CACHE_FIELD_TYPE_INDEXED_I8
  GO_DATA_CACHE_FIELD_TYPE_INDEXED_I16
  GO_DATA_CACHE_FIELD_TYPE_INDEXED_I32
  GO_DATA_CACHE_FIELD_TYPE_INLINE
  GO_DATA_CACHE_FIELD_TYPE_NONE
>;

constant GODataSlicerFieldType is export := gint32;
our enum GODataSlicerFieldTypeEnum is export <
  GDS_FIELD_TYPE_UNSET
  GDS_FIELD_TYPE_PAGE
  GDS_FIELD_TYPE_ROW
  GDS_FIELD_TYPE_COL
  GDS_FIELD_TYPE_DATA
  GDS_FIELD_TYPE_MAX
>;

constant GOValBucketType is export := guint32;
our enum GOValBucketTypeEnum is export <
  GO_VAL_BUCKET_NONE
  GO_VAL_BUCKET_SECOND
  GO_VAL_BUCKET_MINUTE
  GO_VAL_BUCKET_HOUR
  GO_VAL_BUCKET_DAY_OF_YEAR
  GO_VAL_BUCKET_WEEKDAY
  GO_VAL_BUCKET_MONTH
  GO_VAL_BUCKET_CALENDAR_QUARTER
  GO_VAL_BUCKET_YEAR
  GO_VAL_BUCKET_SERIES_LINEAR
  GO_VAL_BUCKET_SERIES_LOG
>;

constant GnmCellFlags is export := guint32;
our enum GnmCellFlagsEnum is export <
  GNM_CELL_IN_SHEET_LIST
  GNM_CELL_IS_MERGED
  GNM_CELL_HAS_NEW_EXPR
>;

constant GnmConsolidateMode is export := guint32;
our enum GnmConsolidateModeEnum is export <
  CONSOLIDATE_ROW_LABELS
  CONSOLIDATE_COL_LABELS
  CONSOLIDATE_COPY_LABELS
  CONSOLIDATE_PUT_VALUES
>;

constant GnmDependentFlags is export := guint32;
our enum GnmDependentFlagsEnum is export <
  DEPENDENT_NO_FLAG
  DEPENDENT_CELL
  DEPENDENT_DYNAMIC_DEP
  DEPENDENT_NAME
  DEPENDENT_MANAGED
  DEPENDENT_TYPE_MASK
  DEPENDENT_IS_LINKED
  DEPENDENT_NEEDS_RECALC
  DEPENDENT_BEING_CALCULATED
  DEPENDENT_BEING_ITERATED
  DEPENDENT_GOES_INTERSHEET
  DEPENDENT_GOES_INTERBOOK
  DEPENDENT_USES_NAME
  DEPENDENT_HAS_3D
  DEPENDENT_HAS_DYNAMIC_DEPS
  DEPENDENT_IGNORE_ARGS
  DEPENDENT_LINK_FLAGS
  DEPENDENT_FLAGGED
  DEPENDENT_CAN_RELOCATE
>;

constant GnmDialogDestroyOptions is export := guint32;
our enum GnmDialogDestroyOptionsEnum is export <
  GNM_DIALOG_DESTROY_SHEET_ADDED
  GNM_DIALOG_DESTROY_SHEET_REMOVED
  GNM_DIALOG_DESTROY_SHEET_RENAMED
  GNM_DIALOG_DESTROY_SHEETS_REORDERED
  GNM_DIALOG_DESTROY_CURRENT_SHEET_REMOVED
  GNM_DIALOG_DESTROY_CURRENT_SHEET_RENAMED
>;

constant GnmExprEntryFlags is export := guint32;
our enum GnmExprEntryFlagsEnum is export <
  GNM_EE_SINGLE_RANGE
  GNM_EE_FORCE_ABS_REF
  GNM_EE_FORCE_REL_REF
  GNM_EE_DEFAULT_ABS_REF
  GNM_EE_FULL_COL
  GNM_EE_FULL_ROW
  GNM_EE_SHEET_OPTIONAL
  GNM_EE_FORMULA_ONLY
  GNM_EE_CONSTANT_ALLOWED
  GNM_EE_MASK
>;

constant GnmExprEvalFlags is export := guint32;
our enum GnmExprEvalFlagsEnum is export <
  GNM_EXPR_EVAL_SCALAR_NON_EMPTY
  GNM_EXPR_EVAL_PERMIT_NON_SCALAR
  GNM_EXPR_EVAL_PERMIT_EMPTY
  GNM_EXPR_EVAL_WANT_REF
>;

constant GnmExprOp is export := guint32;
our enum GnmExprOpEnum is export <
  GNM_EXPR_OP_PAREN
  GNM_EXPR_OP_EQUAL
  GNM_EXPR_OP_GT
  GNM_EXPR_OP_LT
  GNM_EXPR_OP_GTE
  GNM_EXPR_OP_LTE
  GNM_EXPR_OP_NOT_EQUAL
  GNM_EXPR_OP_ADD
  GNM_EXPR_OP_SUB
  GNM_EXPR_OP_MULT
  GNM_EXPR_OP_DIV
  GNM_EXPR_OP_EXP
  GNM_EXPR_OP_CAT
  GNM_EXPR_OP_FUNCALL
  GNM_EXPR_OP_NAME
  GNM_EXPR_OP_CONSTANT
  GNM_EXPR_OP_CELLREF
  GNM_EXPR_OP_UNARY_NEG
  GNM_EXPR_OP_UNARY_PLUS
  GNM_EXPR_OP_PERCENTAGE
  GNM_EXPR_OP_ARRAY_CORNER
  GNM_EXPR_OP_ARRAY_ELEM
  GNM_EXPR_OP_SET
  GNM_EXPR_OP_RANGE_CTOR
  GNM_EXPR_OP_INTERSECT
>;

constant GnmExprParseFlags is export := guint32;
our enum GnmExprParseFlagsEnum is export <
  GNM_EXPR_PARSE_DEFAULT
  GNM_EXPR_PARSE_FORCE_ABSOLUTE_REFERENCES
  GNM_EXPR_PARSE_FORCE_RELATIVE_REFERENCES
  GNM_EXPR_PARSE_FORCE_EXPLICIT_SHEET_REFERENCES
  GNM_EXPR_PARSE_PERMIT_MULTIPLE_EXPRESSIONS
  GNM_EXPR_PARSE_UNKNOWN_NAMES_ARE_STRINGS
  GNM_EXPR_PARSE_UNKNOWN_NAMES_ARE_INVALID
>;

constant GnmFTFreqDirection is export := guint32;
our enum GnmFTFreqDirectionEnum is export <
  FREQ_DIRECTION_NONE
  FREQ_DIRECTION_HORIZONTAL
  FREQ_DIRECTION_VERTICAL
>;

constant GnmFileOpenStyle is export := guint32;
our enum GnmFileOpenStyleEnum is export <
  GNM_FILE_OPEN_STYLE_OPEN
  GNM_FILE_OPEN_STYLE_IMPORT
>;

constant GnmFileSaveAsStyle is export := guint32;
our enum GnmFileSaveAsStyleEnum is export <
  GNM_FILE_SAVE_AS_STYLE_SAVE
  GNM_FILE_SAVE_AS_STYLE_EXPORT
  GNM_FILE_SAVE_AS_STYLE_EXPORT_RANGE
>;

constant GnmFilterOp is export := gint32;
our enum GnmFilterOpEnum is export <
  GNM_FILTER_UNUSED
  GNM_FILTER_OP_EQUAL
  GNM_FILTER_OP_GT
  GNM_FILTER_OP_LT
  GNM_FILTER_OP_GTE
  GNM_FILTER_OP_LTE
  GNM_FILTER_OP_NOT_EQUAL
  GNM_FILTER_OP_BLANKS
  GNM_FILTER_OP_NON_BLANKS
  GNM_FILTER_OP_TOP_N
  GNM_FILTER_OP_BOTTOM_N
  GNM_FILTER_OP_TOP_N_PERCENT
  GNM_FILTER_OP_BOTTOM_N_PERCENT
  GNM_FILTER_OP_TOP_N_PERCENT_N
  GNM_FILTER_OP_BOTTOM_N_PERCENT_N
  GNM_FILTER_OP_BOTTOM_MASK
  GNM_FILTER_OP_REL_N_MASK
  GNM_FILTER_OP_PERCENT_MASK
  GNM_FILTER_OP_GT_AVERAGE
  GNM_FILTER_OP_LT_AVERAGE
  GNM_FILTER_OP_WITHIN_STDDEV
  GNM_FILTER_OP_OUTSIDE_STDDEV
  GNM_FILTER_OP_MATCH
  GNM_FILTER_OP_NO_MATCH
  GNM_FILTER_OP_TYPE_OP
  GNM_FILTER_OP_TYPE_BLANKS
  GNM_FILTER_OP_TYPE_BUCKETS
  GNM_FILTER_OP_TYPE_AVERAGE
  GNM_FILTER_OP_TYPE_STDDEV
  GNM_FILTER_OP_TYPE_MATCH
  GNM_FILTER_OP_TYPE_MASK
>;

constant GnmFormatImportFlags is export := guint32;
our enum GnmFormatImportFlagsEnum is export <
  GNM_FORMAT_IMPORT_NULL_INVALID
  GNM_FORMAT_IMPORT_PATCHUP_INCOMPLETE
>;

constant GnmFuncFlags is export := guint32;
our enum GnmFuncFlagsEnum is export <
  GNM_FUNC_SIMPLE
  GNM_FUNC_VOLATILE
  GNM_FUNC_RETURNS_NON_SCALAR
  GNM_FUNC_IS_PLACEHOLDER
  GNM_FUNC_IS_WORKBOOK_LOCAL
  GNM_FUNC_INTERNAL
  GNM_FUNC_AUTO_UNKNOWN
  GNM_FUNC_AUTO_MONETARY
  GNM_FUNC_AUTO_DATE
  GNM_FUNC_AUTO_TIME
  GNM_FUNC_AUTO_PERCENT
  GNM_FUNC_AUTO_FIRST
  GNM_FUNC_AUTO_SECOND
  GNM_FUNC_AUTO_UNITLESS
  GNM_FUNC_AUTO_MASK
>;

constant GnmFuncHelpType is export := guint32;
our enum GnmFuncHelpTypeEnum is export <
  GNM_FUNC_HELP_END
  GNM_FUNC_HELP_NAME
  GNM_FUNC_HELP_ARG
  GNM_FUNC_HELP_DESCRIPTION
  GNM_FUNC_HELP_NOTE
  GNM_FUNC_HELP_EXAMPLES
  GNM_FUNC_HELP_SEEALSO
  GNM_FUNC_HELP_EXTREF
  GNM_FUNC_HELP_EXCEL
  GNM_FUNC_HELP_ODF
>;

constant GnmFuncImplStatus is export := guint32;
our enum GnmFuncImplStatusEnum is export <
  GNM_FUNC_IMPL_STATUS_EXISTS
  GNM_FUNC_IMPL_STATUS_UNIMPLEMENTED
  GNM_FUNC_IMPL_STATUS_SUBSET
  GNM_FUNC_IMPL_STATUS_COMPLETE
  GNM_FUNC_IMPL_STATUS_SUPERSET
  GNM_FUNC_IMPL_STATUS_SUBSET_WITH_EXTENSIONS
  GNM_FUNC_IMPL_STATUS_UNDER_DEVELOPMENT
  GNM_FUNC_IMPL_STATUS_UNIQUE_TO_GNUMERIC
>;

constant GnmFuncTestStatus is export := guint32;
our enum GnmFuncTestStatusEnum is export <
  GNM_FUNC_TEST_STATUS_UNKNOWN
  GNM_FUNC_TEST_STATUS_NO_TESTSUITE
  GNM_FUNC_TEST_STATUS_BASIC
  GNM_FUNC_TEST_STATUS_EXHAUSTIVE
  GNM_FUNC_TEST_STATUS_UNDER_DEVELOPMENT
>;

constant GnmFuncType is export := guint32;
our enum GnmFuncTypeEnum is export <
  GNM_FUNC_TYPE_ARGS
  GNM_FUNC_TYPE_NODES
  GNM_FUNC_TYPE_STUB
>;

constant GnmGoalSeekStatus is export := guint32;
our enum GnmGoalSeekStatusEnum is export <
  GOAL_SEEK_OK
  GOAL_SEEK_ERROR
>;

constant GnmHAlign is export := guint32;
our enum GnmHAlignEnum is export <
  GNM_HALIGN_GENERAL
  GNM_HALIGN_LEFT
  GNM_HALIGN_RIGHT
  GNM_HALIGN_CENTER
  GNM_HALIGN_FILL
  GNM_HALIGN_JUSTIFY
  GNM_HALIGN_CENTER_ACROSS_SELECTION
  GNM_HALIGN_DISTRIBUTED
>;

constant GnmItemCursorStyle is export := guint32;
our enum GnmItemCursorStyleEnum is export <
  GNM_ITEM_CURSOR_SELECTION
  GNM_ITEM_CURSOR_ANTED
  GNM_ITEM_CURSOR_AUTOFILL
  GNM_ITEM_CURSOR_DRAG
  GNM_ITEM_CURSOR_EXPR_RANGE
>;

constant GnmPageBreakType is export := guint32;
our enum GnmPageBreakTypeEnum is export <
  GNM_PAGE_BREAK_NONE
  GNM_PAGE_BREAK_MANUAL
  GNM_PAGE_BREAK_AUTO
  GNM_PAGE_BREAK_DATA_SLICE
>;

constant GnmPaneSlideFlags is export := guint32;
our enum GnmPaneSlideFlagsEnum is export <
  GNM_PANE_SLIDE_X
  GNM_PANE_SLIDE_Y
  GNM_PANE_SLIDE_EXTERIOR_ONLY
  GNM_PANE_SLIDE_AT_COLROW_BOUND
>;

constant GnmPrintCommentPlacementType is export := guint32;
our enum GnmPrintCommentPlacementTypeEnum is export <
  GNM_PRINT_COMMENTS_NONE
  GNM_PRINT_COMMENTS_IN_PLACE
  GNM_PRINT_COMMENTS_AT_END
>;

constant GnmPrintErrorsType is export := guint32;
our enum GnmPrintErrorsTypeEnum is export <
  GNM_PRINT_ERRORS_AS_DISPLAYED
  GNM_PRINT_ERRORS_AS_BLANK
  GNM_PRINT_ERRORS_AS_DASHES
  GNM_PRINT_ERRORS_AS_NA
>;

constant GnmPrintHFRenderType is export := guint32;
our enum GnmPrintHFRenderTypeEnum is export <
  HF_RENDER_PRINT
>;

constant GnmSOAnchorMode is export := guint32;
our enum GnmSOAnchorModeEnum is export <
  GNM_SO_ANCHOR_TWO_CELLS
  GNM_SO_ANCHOR_ONE_CELL
  GNM_SO_ANCHOR_ABSOLUTE
>;

constant GnmSOResizeMode is export := guint32;
our enum GnmSOResizeModeEnum is export <
  GNM_SO_RESIZE_MANUAL
  GNM_SO_RESIZE_AUTO
  GNM_SO_RESIZE_NONE
>;

constant GnmSearchReplaceError is export := guint32;
our enum GnmSearchReplaceErrorEnum is export <
  GNM_SRE_FAIL
  GNM_SRE_SKIP
  GNM_SRE_QUERY
  GNM_SRE_ERROR
  GNM_SRE_STRING
>;

constant GnmSearchReplaceLocus is export := guint32;
our enum GnmSearchReplaceLocusEnum is export <
  GNM_SRL_CONTENTS
  GNM_SRL_VALUE
  GNM_SRL_COMMENT
>;

constant GnmSearchReplaceQuery is export := guint32;
our enum GnmSearchReplaceQueryEnum is export <
  GNM_SRQ_FAIL
  GNM_SRQ_QUERY
  GNM_SRQ_QUERY_COMMENT
>;

constant GnmSearchReplaceScope is export := guint32;
our enum GnmSearchReplaceScopeEnum is export <
  GNM_SRS_WORKBOOK
  GNM_SRS_SHEET
  GNM_SRS_RANGE
>;

constant GnmSelectionMode is export := guint32;
our enum GnmSelectionModeEnum is export <
  GNM_SELECTION_MODE_ADD
  GNM_SELECTION_MODE_REMOVE
  GNM_SELECTION_MODE_TOGGLE
>;

constant GnmSheetSlicerLayout is export := guint32;
our enum GnmSheetSlicerLayoutEnum is export <
  GSS_LAYOUT_XL_OUTLINE
  GSS_LAYOUT_XL_COMPACT
  GSS_LAYOUT_XL_TABULAR
  GSS_LAYOUT_MAX
>;

constant GnmSheetType is export := guint32;
our enum GnmSheetTypeEnum is export <
  GNM_SHEET_DATA
  GNM_SHEET_OBJECT
  GNM_SHEET_XLM
>;

constant GnmSheetViewMode is export := guint32;
our enum GnmSheetViewModeEnum is export <
  GNM_SHEET_VIEW_NORMAL_MODE
  GNM_SHEET_VIEW_PAGE_BREAK_MODE
  GNM_SHEET_VIEW_LAYOUT_MODE
>;

constant GnmSheetVisibility is export := guint32;
our enum GnmSheetVisibilityEnum is export <
  GNM_SHEET_VISIBILITY_VISIBLE
  GNM_SHEET_VISIBILITY_HIDDEN
  GNM_SHEET_VISIBILITY_VERY_HIDDEN
>;

constant GnmSolverConstraintType is export := guint32;
our enum GnmSolverConstraintTypeEnum is export <
  GNM_SOLVER_LE
  GNM_SOLVER_GE
  GNM_SOLVER_EQ
  GNM_SOLVER_INTEGER
  GNM_SOLVER_BOOLEAN
>;

constant GnmSolverModelType is export := guint32;
our enum GnmSolverModelTypeEnum is export <
  GNM_SOLVER_LP
  GNM_SOLVER_QP
  GNM_SOLVER_NLP
>;

constant GnmSolverProblemType is export := guint32;
our enum GnmSolverProblemTypeEnum is export <
  GNM_SOLVER_MINIMIZE
  GNM_SOLVER_MAXIMIZE
>;

constant GnmSolverResultQuality is export := guint32;
our enum GnmSolverResultQualityEnum is export <
  GNM_SOLVER_RESULT_NONE
  GNM_SOLVER_RESULT_FEASIBLE
  GNM_SOLVER_RESULT_OPTIMAL
  GNM_SOLVER_RESULT_INFEASIBLE
  GNM_SOLVER_RESULT_UNBOUNDED
>;

constant GnmSolverStatus is export := guint32;
our enum GnmSolverStatusEnum is export <
  GNM_SOLVER_STATUS_READY
  GNM_SOLVER_STATUS_PREPARING
  GNM_SOLVER_STATUS_PREPARED
  GNM_SOLVER_STATUS_RUNNING
  GNM_SOLVER_STATUS_DONE
  GNM_SOLVER_STATUS_ERROR
  GNM_SOLVER_STATUS_CANCELLED
>;

constant GnmSpanCalcFlags is export := guint32;
our enum GnmSpanCalcFlagsEnum is export <
  GNM_SPANCALC_SIMPLE
  GNM_SPANCALC_RESIZE
  GNM_SPANCALC_RE_RENDER
  GNM_SPANCALC_RENDER
  GNM_SPANCALC_ROW_HEIGHT
>;

constant GnmStdError is export := guint32;
our enum GnmStdErrorEnum is export <
  GNM_ERROR_NULL
  GNM_ERROR_DIV0
  GNM_ERROR_VALUE
  GNM_ERROR_REF
  GNM_ERROR_NAME
  GNM_ERROR_NUM
  GNM_ERROR_NA
  GNM_ERROR_UNKNOWN
>;

constant GnmStfFormatMode is export := guint32;
our enum GnmStfFormatModeEnum is export <
  GNM_STF_FORMAT_AUTO
  GNM_STF_FORMAT_RAW
  GNM_STF_FORMAT_PRESERVE
>;

constant GnmStfTransliterateMode is export := guint32;
our enum GnmStfTransliterateModeEnum is export <
  GNM_STF_TRANSLITERATE_MODE_TRANS
  GNM_STF_TRANSLITERATE_MODE_ESCAPE
>;

constant GnmStyleBorderLocation is export := guint32;
our enum GnmStyleBorderLocationEnum is export <
  GNM_STYLE_BORDER_TOP
  GNM_STYLE_BORDER_BOTTOM
  GNM_STYLE_BORDER_LEFT
  GNM_STYLE_BORDER_RIGHT
  GNM_STYLE_BORDER_REV_DIAG
  GNM_STYLE_BORDER_DIAG
  GNM_STYLE_BORDER_HORIZ
  GNM_STYLE_BORDER_VERT
  GNM_STYLE_BORDER_EDGE_MAX
>;

constant GnmStyleBorderOrientation is export := guint32;
our enum GnmStyleBorderOrientationEnum is export <
  GNM_STYLE_BORDER_HORIZONTAL
  GNM_STYLE_BORDER_VERTICAL
  GNM_STYLE_BORDER_DIAGONAL
>;

constant GnmStyleBorderType is export := guint32;
our enum GnmStyleBorderTypeEnum is export <
  GNM_STYLE_BORDER_NONE
  GNM_STYLE_BORDER_THIN
  GNM_STYLE_BORDER_MEDIUM
  GNM_STYLE_BORDER_DASHED
  GNM_STYLE_BORDER_DOTTED
  GNM_STYLE_BORDER_THICK
  GNM_STYLE_BORDER_DOUBLE
  GNM_STYLE_BORDER_HAIR
  GNM_STYLE_BORDER_MEDIUM_DASH
  GNM_STYLE_BORDER_DASH_DOT
  GNM_STYLE_BORDER_MEDIUM_DASH_DOT
  GNM_STYLE_BORDER_DASH_DOT_DOT
  GNM_STYLE_BORDER_MEDIUM_DASH_DOT_DOT
  GNM_STYLE_BORDER_SLANTED_DASH_DOT
  GNM_STYLE_BORDER_INCONSISTENT
  GNM_STYLE_BORDER_MAX
>;

constant GnmStyleCondOp is export := guint32;
our enum GnmStyleCondOpEnum is export <
  GNM_STYLE_COND_BETWEEN
  GNM_STYLE_COND_NOT_BETWEEN
  GNM_STYLE_COND_EQUAL
  GNM_STYLE_COND_NOT_EQUAL
  GNM_STYLE_COND_GT
  GNM_STYLE_COND_LT
  GNM_STYLE_COND_GTE
  GNM_STYLE_COND_LTE
  GNM_STYLE_COND_CUSTOM
  GNM_STYLE_COND_CONTAINS_STR
  GNM_STYLE_COND_NOT_CONTAINS_STR
  GNM_STYLE_COND_BEGINS_WITH_STR
  GNM_STYLE_COND_NOT_BEGINS_WITH_STR
  GNM_STYLE_COND_ENDS_WITH_STR
  GNM_STYLE_COND_NOT_ENDS_WITH_STR
  GNM_STYLE_COND_CONTAINS_ERR
  GNM_STYLE_COND_NOT_CONTAINS_ERR
  GNM_STYLE_COND_CONTAINS_BLANKS
  GNM_STYLE_COND_NOT_CONTAINS_BLANKS
>;

constant GnmStyleElement is export := guint32;
our enum GnmStyleElementEnum is export <
  MSTYLE_COLOR_BACK
  MSTYLE_COLOR_PATTERN
  MSTYLE_BORDER_TOP
  MSTYLE_BORDER_BOTTOM
  MSTYLE_BORDER_LEFT
  MSTYLE_BORDER_RIGHT
  MSTYLE_BORDER_REV_DIAGONAL
  MSTYLE_BORDER_DIAGONAL
  MSTYLE_PATTERN
  MSTYLE_ELEMENT_MAX_BLANK
  MSTYLE_FONT_COLOR
  MSTYLE_FONT_NAME
  MSTYLE_FONT_BOLD
  MSTYLE_FONT_ITALIC
  MSTYLE_FONT_UNDERLINE
  MSTYLE_FONT_STRIKETHROUGH
  MSTYLE_FONT_SCRIPT
  MSTYLE_FONT_SIZE
  MSTYLE_FORMAT
  MSTYLE_ALIGN_V
  MSTYLE_ALIGN_H
  MSTYLE_INDENT
  MSTYLE_ROTATION
  MSTYLE_TEXT_DIR
  MSTYLE_WRAP_TEXT
  MSTYLE_SHRINK_TO_FIT
  MSTYLE_CONTENTS_LOCKED
  MSTYLE_CONTENTS_HIDDEN
  MSTYLE_VALIDATION
  MSTYLE_HLINK
  MSTYLE_INPUT_MSG
  MSTYLE_CONDITIONS
  MSTYLE_ELEMENT_MAX
>;

constant GnmTextDir is export := gint32;
our enum GnmTextDirEnum is export <
  GNM_TEXT_DIR_RTL
  GNM_TEXT_DIR_CONTEXT
  GNM_TEXT_DIR_LTR
>;

constant GnmUnderline is export := guint32;
our enum GnmUnderlineEnum is export <
  UNDERLINE_NONE
  UNDERLINE_SINGLE
  UNDERLINE_DOUBLE
  UNDERLINE_SINGLE_LOW
  UNDERLINE_DOUBLE_LOW
>;

constant GnmUpdateType is export := guint32;
our enum GnmUpdateTypeEnum is export <
  GNM_UPDATE_CONTINUOUS
  GNM_UPDATE_DISCONTINUOUS
  GNM_UPDATE_DELAYED
>;

constant GnmVAlign is export := guint32;
our enum GnmVAlignEnum is export <
  GNM_VALIGN_TOP
  GNM_VALIGN_BOTTOM
  GNM_VALIGN_CENTER
  GNM_VALIGN_JUSTIFY
  GNM_VALIGN_DISTRIBUTED
>;

constant GnmValDiff is export := guint32;
our enum GnmValDiffEnum is export <
  IS_EQUAL
  IS_LESS
  IS_GREATER
  TYPE_MISMATCH
>;

constant GnmValueType is export := guint32;
our enum GnmValueTypeEnum is export <
  VALUE_EMPTY
  VALUE_BOOLEAN
  VALUE_FLOAT
  VALUE_ERROR
  VALUE_STRING
  VALUE_CELLRANGE
  VALUE_ARRAY
>;

constant GnumericXMLVersion is export := gint32;
our enum GnumericXMLVersionEnum is export <
  GNM_XML_UNKNOWN
  GNM_XML_V1
  GNM_XML_V2
  GNM_XML_V3
  GNM_XML_V4
  GNM_XML_V5
  GNM_XML_V6
  GNM_XML_V7
  GNM_XML_V8
  GNM_XML_V9
  GNM_XML_V10
  GNM_XML_V11
  GNM_XML_V12
  GNM_XML_V13
  GNM_XML_V14
  GNM_XML_LATEST
>;

constant GroupByT is export := guint32;
our enum GroupByTEnum is export <
  GROUPED_BY_ROW
  GROUPED_BY_COL
  GROUPED_BY_AREA
  GROUPED_BY_BIN
>;

constant MovingAverageTypeT is export := guint32;
our enum MovingAverageTypeTEnum is export <
  moving_average_type_sma
  moving_average_type_cma
  moving_average_type_wma
  moving_average_type_spencer_ma
  moving_average_type_central_sma
>;

constant NormalityTestTypeT is export := guint32;
our enum NormalityTestTypeTEnum is export <
  normality_test_type_andersondarling
  normality_test_type_cramervonmises
  normality_test_type_lilliefors
  normality_test_type_shapirofrancia
>;

constant ParseErrorID is export := guint32;
our enum ParseErrorIDEnum is export <
  PERR_NONE
  PERR_MISSING_PAREN_OPEN
  PERR_MISSING_PAREN_CLOSE
  PERR_MISSING_CLOSING_QUOTE
  PERR_INVALID_EXPRESSION
  PERR_INVALID_ARRAY_SEPARATOR
  PERR_UNKNOWN_WORKBOOK
  PERR_UNKNOWN_SHEET
  PERR_UNKNOWN_NAME
  PERR_UNEXPECTED_TOKEN
  PERR_OUT_OF_RANGE
  PERR_SHEET_IS_REQUIRED
  PERR_SINGLE_RANGE
  PERR_3D_NAME
  PERR_MULTIPLE_EXPRESSIONS
  PERR_INVALID_EMPTY
  PERR_ASYMETRIC_ARRAY
  PERR_SET_CONTENT_MUST_BE_RANGE
>;

constant PrintRange is export := gint32;
our enum PrintRangeEnum is export <
  GNM_PRINT_SAVED_INFO
  GNM_PRINT_ACTIVE_SHEET
  GNM_PRINT_ALL_SHEETS
  GNM_PRINT_ALL_SHEETS_INCLUDING_HIDDEN
  GNM_PRINT_SHEET_RANGE
  GNM_PRINT_SHEET_SELECTION
  GNM_PRINT_IGNORE_PRINTAREA
  GNM_PRINT_SHEET_SELECTION_IGNORE_PRINTAREA
>;

constant RandomDistributionT is export := guint32;
our enum RandomDistributionTEnum is export <
  DiscreteDistribution
  UniformDistribution
  NormalDistribution
  BernoulliDistribution
  BetaDistribution
  BinomialDistribution
  PoissonDistribution
  CauchyDistribution
  ChisqDistribution
  GammaDistribution
  WeibullDistribution
  FdistDistribution
  GeometricDistribution
  Gumbel1Distribution
  Gumbel2Distribution
  LaplaceDistribution
  TdistDistribution
  LogarithmicDistribution
  LogisticDistribution
  ParetoDistribution
  LognormalDistribution
  RayleighDistribution
  LevyDistribution
  ExponentialPowerDistribution
  RayleighTailDistribution
  LandauDistribution
  GaussianTailDistribution
  UniformIntDistribution
  NegativeBinomialDistribution
  ExponentialDistribution
>;

constant RandomGenCorTypeT is export := guint32;
our enum RandomGenCorTypeTEnum is export <
  random_gen_cor_type_cov
  random_gen_cor_type_cholesky
>;

constant SheetClearFlags is export := guint32;
our enum SheetClearFlagsEnum is export <
  CLEAR_VALUES
  CLEAR_FORMATS
  CLEAR_COMMENTS
  CLEAR_NOCHECKARRAY
  CLEAR_NORESPAN
  CLEAR_RECALC_DEPS
  CLEAR_MERGES
  CLEAR_OBJECTS
  CLEAR_FILTERED_ONLY
>;

constant SheetObjectFlags is export := guint32;
our enum SheetObjectFlagsEnum is export <
  SHEET_OBJECT_IS_VISIBLE
  SHEET_OBJECT_PRINT
  SHEET_OBJECT_CAN_PRESS
  SHEET_OBJECT_CAN_RESIZE
  SHEET_OBJECT_CAN_EDIT
  SHEET_OBJECT_MOVE_WITH_CELLS
  SHEET_OBJECT_SIZE_WITH_CELLS
  SHEET_OBJECT_OBSCURED
>;

constant SigntestType is export := guint32;
our enum SigntestTypeEnum is export <
  SIGNTEST
  SIGNTEST_WILCOXON
>;

constant SimErrmaskT is export := guint32;
our enum SimErrmaskTEnum is export <
  MedianErr
  ModeErr
  StddevErr
  VarErr
  SkewErr
  KurtosisErr
>;

constant SoStyledT is export := guint32;
our enum SoStyledTEnum is export <
  SO_STYLED_STYLE_ONLY
  SO_STYLED_LINE
  SO_STYLED_TEXT
>;

constant StfDialogPage is export := guint32;
our enum StfDialogPageEnum is export <
  DPG_MAIN
  DPG_CSV
  DPG_FIXED
  DPG_FORMAT
>;

constant StfparsetypeT is export := guint32;
our enum StfparsetypeTEnum is export <
  PARSE_TYPE_NOTSET
  PARSE_TYPE_CSV
  PARSE_TYPE_FIXED
>;

constant StftrimtypeT is export := guint32;
our enum StftrimtypeTEnum is export <
  TRIM_TYPE_NEVER
  TRIM_TYPE_LEFT
  TRIM_TYPE_RIGHT
>;

constant TtestType is export := guint32;
our enum TtestTypeEnum is export <
  TTEST_PAIRED
  TTEST_UNPAIRED_EQUALVARIANCES
  TTEST_UNPAIRED_UNEQUALVARIANCES
  TTEST_ZTEST
>;

constant ValidationOp is export := gint32;
our enum ValidationOpEnum is export <
  GNM_VALIDATION_OP_NONE
  GNM_VALIDATION_OP_BETWEEN
  GNM_VALIDATION_OP_NOT_BETWEEN
  GNM_VALIDATION_OP_EQUAL
  GNM_VALIDATION_OP_NOT_EQUAL
  GNM_VALIDATION_OP_GT
  GNM_VALIDATION_OP_LT
  GNM_VALIDATION_OP_GTE
  GNM_VALIDATION_OP_LTE
>;

constant ValidationStatus is export := guint32;
our enum ValidationStatusEnum is export <
  GNM_VALIDATION_STATUS_VALID
  GNM_VALIDATION_STATUS_INVALID_DISCARD
  GNM_VALIDATION_STATUS_INVALID_EDIT
>;

constant ValidationStyle is export := guint32;
our enum ValidationStyleEnum is export <
  GNM_VALIDATION_STYLE_NONE
  GNM_VALIDATION_STYLE_STOP
  GNM_VALIDATION_STYLE_WARNING
  GNM_VALIDATION_STYLE_INFO
  GNM_VALIDATION_STYLE_PARSE_ERROR
>;

constant ValidationType is export := guint32;
our enum ValidationTypeEnum is export <
  GNM_VALIDATION_TYPE_ANY
  GNM_VALIDATION_TYPE_AS_INT
  GNM_VALIDATION_TYPE_AS_NUMBER
  GNM_VALIDATION_TYPE_IN_LIST
  GNM_VALIDATION_TYPE_AS_DATE
  GNM_VALIDATION_TYPE_AS_TIME
  GNM_VALIDATION_TYPE_TEXT_LENGTH
  GNM_VALIDATION_TYPE_CUSTOM
>;

constant WBCEditResult is export := guint32;
our enum WBCEditResultEnum is export <
  WBC_EDIT_REJECT
  WBC_EDIT_ACCEPT
  WBC_EDIT_ACCEPT_WO_AC
  WBC_EDIT_ACCEPT_RANGE
  WBC_EDIT_ACCEPT_ARRAY
>;

constant WbControlNavigatorT is export := guint32;
our enum WbControlNavigatorTEnum is export <
  navigator_top
  navigator_bottom
  navigator_last
  navigator_first
>;

