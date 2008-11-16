; =============================================================================
;
; Gallery - a web based photo album viewer and editor
; Copyright (C) 2000-2008 Bharat Mediratta
;
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or (at
; your option) any later version.
;
; This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
;
; =============================================================================
;
; To use this file, you must first install php-mode.el from
;     http://sourceforge.net/projects/php-mode
;
; This file sets the indentation style for PHP code to match
; the coding standard for the Gallery project, which can be
; found here:
;    http://codex.gallery2.org/Gallery3:Coding_Standards
;

; Bind file suffixes to php-mode
;
(setq auto-mode-alist
      (append '(
		("\\.php$" . php-mode)
		("\\.class$" . php-mode)
		("\\.inc$" . php-mode)
		)
	      auto-mode-alist))

; Autoload any necessary major modes
;
(autoload 'php-mode "php-mode" "PHP editing mode." t)

;;
; Set up my PHP code convention compliant style.  This is very
; similar to java-style that comes with GNUEmacs 20.4
;
(defconst php-gallery-style
  '(
    (c-basic-offset . 2)
    (my-c-continuation-offset . 2)
    (c-comment-only-line-offset . (0 . 0))
    (c-offsets-alist . ((inline-open . 0)
			(topmost-intro         . 0)
			(topmost-intro-cont    . +)
			(statement-block-intro . +)
			(knr-argdecl-intro     . 5)
			(substatement-open     . +)
			(label                 . 0)
			(arglist-intro         . +)
			(arglist-cont          . 0)
			(arglist-close         . c-lineup-arglist)
			(statement-case-open   . +)
			(statement-cont        . +)
			(access-label          . 0)
			(defun-block-intro     . +)
			(defun-close           . 0)
			(arglist-cont-nonempty . c-lineup-arglist-intro-after-paren)
			))
    ; (c-echo-syntactic-information-p . t)     ; turn this on to get debug info
    )
  "PHP Style for the Gallery Project")

;;
;
; Create a hook that adds the style to the list and
; sets a few useful variables.
;
(defun my-php-mode-hook ()
  (c-add-style "php-gallery" php-gallery-style t)
  (turn-on-auto-fill)
  (setq fill-column 98)
  (setq comment-column 50)
  (setq comment-style 'box-multi)
  (setq indent-tabs-mode nil)
  (define-key c-mode-map "\C-m" 'newline-and-indent)
  )
(add-hook 'php-mode-hook 'my-php-mode-hook)
