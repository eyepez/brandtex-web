/*
Name: 			Tables / Editable - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	1.3.0
*/

(function( $ ) {

	'use strict';

	var EditableTable = {

		options: {
			addButton: '#addToTable',
			table: '#datatable-editable',
			dialog: {
				wrapper: '#dialog',
				cancelButton: '#dialogCancel',
				confirmButton: '#dialogConfirm',
			}
		},

		initialize: function() {
			this
				.setVars()
				.build()
				.events();
		},

		setVars: function() {
			this.$table				= $( this.options.table );
			this.$addButton			= $( this.options.addButton );

			// dialog
			this.dialog				= {};
			this.dialog.$wrapper	= $( this.options.dialog.wrapper );
			this.dialog.$cancel		= $( this.options.dialog.cancelButton );
			this.dialog.$confirm	= $( this.options.dialog.confirmButton );

			return this;
		},

		build: function() {
			this.datatable = this.$table.DataTable({
				aoColumns: [
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					{ "bSortable": false }
				]
			});

			window.dt = this.datatable;

			return this;
		},

		events: function() {
			var _self = this;

			this.$table
				.on('click', 'a.save-row', function( e ) {
					e.preventDefault();

					_self.rowSave( $(this).closest( 'tr' ) );
				})
				.on('click', 'a.cancel-row', function( e ) {
					e.preventDefault();

					_self.rowCancel( $(this).closest( 'tr' ) );
				})
				.on('click', 'a.edit-row', function( e ) {
					e.preventDefault();

					_self.rowEdit( $(this).closest( 'tr' ) );
				})
				.on( 'click', 'a.remove-row', function( e ) {
					e.preventDefault();

					var $row = $(this).closest( 'tr' );

					$.magnificPopup.open({
						items: {
							src: '#dialog',
							type: 'inline'
						},
						preloader: false,
						modal: true,
						callbacks: {
							change: function() {
								_self.dialog.$confirm.on( 'click', function( e ) {
									e.preventDefault();

									_self.rowRemove( $row );
									$.magnificPopup.close();
								});
							},
							close: function() {
								_self.dialog.$confirm.off( 'click' );
							}
						}
					});
				});

			this.$addButton.on( 'click', function(e) {
				e.preventDefault();

				_self.rowAdd();
			});

			this.dialog.$cancel.on( 'click', function( e ) {
				e.preventDefault();
				$.magnificPopup.close();
			});

			return this;
		},

		// ==========================================================================================
		// ROW FUNCTIONS
		// ==========================================================================================
		rowAdd: function() {
			this.$addButton.attr({ 'disabled': 'disabled' });

			var actions,
				data,
				$row;

			actions = [
				'<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>',
				'<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
				'<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
				'<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>'
			].join(' ');

			data = this.datatable.row.add([ '', '', '', actions ]);
			$row = this.datatable.row( data[0] ).nodes().to$();

			$row
				.addClass( 'adding' )
				.find( 'td:last' )
				.addClass( 'actions' );

			this.rowEdit( $row );

			this.datatable.order([0,'asc']).draw(); // always show fields
		},

		rowCancel: function( $row ) {
			var _self = this,
				$actions,
				i,
				data;

			if ( $row.hasClass('adding') ) {
				this.rowRemove( $row );
			} else {

				data = this.datatable.row( $row.get(0) ).data();
				this.datatable.row( $row.get(0) ).data( data );

				$actions = $row.find('td.actions');
				if ( $actions.get(0) ) {
					this.rowSetActionsDefault( $row );
				}

				this.datatable.draw();
			}
		},

		rowEdit: function( $row ) {
			var _self = this,
				data;

			data = this.datatable.row( $row.get(0) ).data();

			$row.children( 'td' ).each(function( i ) {
				var $this = $( this );

				if ( $this.hasClass('actions') ) {
					_self.rowSetActionsEditing( $row );
				} else {
					$this.html( '<input type="text" class="form-control input-block" value="' + data[i] + '"/>' );
				}
			});
		},

		rowSave: function( $row ) {
			var _self     = this,
				$actions,
				values    = [];

			if ( $row.hasClass( 'adding' ) ) {
				this.$addButton.removeAttr( 'disabled' );
				$row.removeClass( 'adding' );
			}

			values = $row.find('td').map(function() {
				var $this = $(this);

				if ( $this.hasClass('actions') ) {
					_self.rowSetActionsDefault( $row );
					return _self.datatable.cell( this ).data();
				} else {
					return $.trim( $this.find('input').val() );
				}
			});

			this.datatable.row( $row.get(0) ).data( values );

			$actions = $row.find('td.actions');
			if ( $actions.get(0) ) {
				this.rowSetActionsDefault( $row );
			}

			this.datatable.draw();
		},

		rowRemove: function( $row ) {
			if ( $row.hasClass('adding') ) {
				this.$addButton.removeAttr( 'disabled' );
			}

			this.datatable.row( $row.get(0) ).remove().draw();
		},

		rowSetActionsEditing: function( $row ) {
			$row.find( '.on-editing' ).removeClass( 'hidden' );
			$row.find( '.on-default' ).addClass( 'hidden' );
		},

		rowSetActionsDefault: function( $row ) {
			$row.find( '.on-editing' ).addClass( 'hidden' );
			$row.find( '.on-default' ).removeClass( 'hidden' );
		}

	};

	$(function() {
		EditableTable.initialize();
	});

}).apply( this, [ jQuery ]);


function editarTabla(idDataTable,metodo,tableEdit,inicioRango,finRango,total,esObjecto){
	
	
	var EditableTable = {

			options: {
				addButton: '#addToTable',
				table: '#'+idDataTable,
				dialog: {
					wrapper: '#dialog',
					cancelButton: '#dialogCancel',
					confirmButton: '#dialogConfirm',
				}
			},

			initialize: function() {
				this
					.setVars()
                    .build()
					.events();
			},

			setVars: function() {
				this.$table				= $( this.options.table );
				this.$addButton			= $( this.options.addButton );

				// dialog
				this.dialog				= {};
				this.dialog.$wrapper	= $( this.options.dialog.wrapper );
				this.dialog.$cancel		= $( this.options.dialog.cancelButton );
				this.dialog.$confirm	= $( this.options.dialog.confirmButton );

				return this;
			},

			build: function() {
				this.datatable=tableEdit;
//				this.datatable = this.$table.DataTable({
//					aoColumns: [
//						null,
//						null,
//						null,
//						null,
//						{ "bSortable": false }
//					]
//				});
//
				window.dt = this.datatable;
//
				return this;
			},

			events: function() {
				var _self = this;

				this.$table
					.on('click', 'a.save-row', function( e ) {
						e.preventDefault();

						_self.rowSave( $(this).closest( 'tr' ) );
					})
					.on('click', 'a.cancel-row', function( e ) {
						e.preventDefault();

						_self.rowCancel( $(this).closest( 'tr' ) );
					})
					.on('click', 'a.edit-row', function( e ) {
						e.preventDefault();

						_self.rowEdit( $(this).closest( 'tr' ) );
					});

				this.$addButton.on( 'click', function(e) {
					e.preventDefault();

					_self.rowAdd();
				});

				this.dialog.$cancel.on( 'click', function( e ) {
//					e.preventDefault();
//					$.magnificPopup.close();
				});

				return this;
			},

			// ==========================================================================================
			// ROW FUNCTIONS
			// ==========================================================================================
			rowAdd: function() {
				this.$addButton.attr({ 'disabled': 'disabled' });

				var actions,
					data,
					$row;

				actions = [
					'&nbsp;&nbsp;&nbsp;<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>',
					'&nbsp;&nbsp;&nbsp;<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
					'&nbsp;&nbsp;&nbsp;<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
					'&nbsp;&nbsp;&nbsp;<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>'
				].join(' ');

				data = this.datatable.row.add([ '', '', '', actions ]);
				$row = this.datatable.row( data[0] ).nodes().to$();

				$row
					.addClass( 'adding' )
					.find( 'td:last' )
					.addClass( 'actions' );

				this.rowEdit( $row );

				this.datatable.order([0,'asc']).draw(); // always show fields
			},

			rowCancel: function( $row ) {
				var _self = this,
					$actions,
					i,
					data;

				if ( $row.hasClass('adding') ) {
					this.rowRemove( $row );
				} else {

					data = this.datatable.row( $row.get(0) ).data();
					this.datatable.row( $row.get(0) ).data( data );

					$actions = $row.find('td.actions');
					if ( $actions.get(0) ) {
						this.rowSetActionsDefault( $row );
					}

					this.datatable.draw();
				}
			},

			rowEdit: function( $row ) {
				var _self = this,
					data,filaData=[];

				data = this.datatable.row( $row.get(0) ).data();
				filaData=$row.children( 'td' );
				
				$row.children( 'td' ).each(function( i ) {
					var $this = $( this );

					if ( i==total) {
//						if ( $this.hasClass('actions') ) {
						_self.rowSetActionsEditing( $row );
					} else if( i>inicioRango && i<finRango) {
						$this.html( '<input type="text" class="form-control input-block" value="' + filaData[i].textContent + '"/>' );
//						$this.html( '<input type="text" class="form-control input-block" value="' + data[i] + '"/>' );
					}
				});
			},

			rowSave: function( $row ) {
				var _self     = this,
					$actions,
					values  = [], filaData=[];

				if ( $row.hasClass( 'adding' ) ) {
					this.$addButton.removeAttr( 'disabled' );
					$row.removeClass( 'adding' );
				}
				
				var numRow=0;
				filaData=$row.children( 'td' );
                var valoresEditar=[];
				values = $row.find('td').map(function() {
					
					var valor1=filaData[numRow].innerHTML;
					var $this = $(this);

					if (numRow == total) {
//						if ( $this.hasClass('actions') ) {
						_self.rowSetActionsDefault( $row );
						numRow++;
						valoresEditar.push(valor1);
//						_self.datatable.cell( this ).data();
						return valor1;//
						
					} else if( numRow>inicioRango && numRow<finRango) {
						numRow++;
//						
						var valor2=$.trim( $this.find('input').val());
						$this.html(valor2);
						valoresEditar.push(valor2);
						return valor2;
						
					}else{
						numRow++;
						valoresEditar.push(valor1);
						return _self.datatable.cell( this ).data();
					}
					
				});
				
				console.log(values);
/////
				  $.ajax({
			          url: "./"+metodo,
			          type: "POST",
			          dataType: "json",
			          data : {
			        	  valores:JSON.stringify(values)
			          }
			      }).done(function(paramJson) {
			    	  
			    	  if(paramJson.estadoRespuesta=="OK"){
			    		  callNotification('success', 'Datos Actualizados correctamente','Terminado');
			    		  
			    	  }else{
			    		  callNotification('error', paramJson.mensajeRespuesta,'Error');
			    	  }
			    	  
			    	 if(esObjecto){
			    	  var objValor=JSON.parse(paramJson.parametros.oDocumento);
			    	  _self.datatable.row( $row.get(0) ).data( objValor );
			    	 }else{
			    	 _self.datatable.row( $row.get(0) ).data( values );
			    	 }
//
//						$actions = $row.find('td.actions');
//						if ( $actions.get(0) ) {
							_self.rowSetActionsDefault( $row );
//						}

						_self.datatable.draw();
				  
			      }).fail(function( jqXHR, textStatus, errorThrown ) {
			          alert( "error"+errorThrown +", "+jqXHR+","+textStatus);
			     });
					
			},

//			rowRemove: function( $row ) {
//				if ( $row.hasClass('adding') ) {
//					this.$addButton.removeAttr( 'disabled' );
//				}
//
//				this.datatable.row( $row.get(0) ).remove().draw();
//			},

			rowSetActionsEditing: function( $row ) {
				$row.find( '.on-editing' ).removeClass( 'hidden' );
				$row.find( '.on-default' ).addClass( 'hidden' );
			},

			rowSetActionsDefault: function( $row ) {
				$row.find( '.on-editing' ).addClass( 'hidden' );
				$row.find( '.on-default' ).removeClass( 'hidden' );
			}

		};
	
	EditableTable.initialize();
}