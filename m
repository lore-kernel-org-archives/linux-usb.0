Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6789C43461
	for <linux-usb@archiver.kernel.org>; Sat, 24 Apr 2021 16:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8F1C61481
	for <linux-usb@archiver.kernel.org>; Sat, 24 Apr 2021 16:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhDXQL2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 24 Apr 2021 12:11:28 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38935 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232339AbhDXQL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Apr 2021 12:11:26 -0400
Received: (qmail 314030 invoked by uid 1000); 24 Apr 2021 12:10:47 -0400
Date:   Sat, 24 Apr 2021 12:10:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com,
        sfr@canb.auug.org.au, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] usb: Restore the reference to ch9.h
Message-ID: <20210424161047.GD312740@rowland.harvard.edu>
References: <20210424154823.2489144-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424154823.2489144-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 24, 2021 at 12:48:23PM -0300, Fabio Estevam wrote:
> Keep the textual reference to ch9.h as it was prior to commit
> caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location").
> 
> As ch9.h does not have any comments anymore, just remove the kernel-doc
> entries entirely.
> 
> Fixes: caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location")
> Reported-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> This one applies against usb-next.
> 
>  Documentation/driver-api/usb/usb.rst | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
> index 543e70434da2..251cab7cacd7 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -109,16 +109,10 @@ well as to make sure they aren't relying on some HCD-specific behavior.
>  USB-Standard Types
>  ==================
>  
> -In ``drivers/usb/common/common.c`` and ``drivers/usb/common/debug.c`` you
> -will find the USB data types defined in chapter 9 of the USB specification.
> -These data types are used throughout USB, and in APIs including this host
> -side API, gadget APIs, usb character devices and debugfs interfaces.
> -
> -.. kernel-doc:: drivers/usb/common/common.c
> -   :export:
> -
> -.. kernel-doc:: drivers/usb/common/debug.c
> -   :export:
> +In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
> +chapter 9 of the USB specification. These data types are used throughout
> +USB, and in APIs including this host side API, gadget APIs, usb character
> +devices and debugfs interfaces.

I don't understand why you aren't giving a full description of the 
situation here.  You should say something more like this (edit to your 
taste):

In ``<uapi/linux/usb/ch9.h>`` you will find the USB data types 
defined in chapter 9 of the USB specification. These data types are used 
throughout USB, and in APIs including this host side API, gadget APIs, 
usb character devices and debugfs interfaces. That file is itself 
#include'd by ``<linux/usb/ch9.h>``, which also contains declarations of 
a few utility routines for manipulating these data types; the 
implementations are in ``drivers/usb/common/common.c``.

.. kernel-doc:: drivers/usb/common/common.c
   :export:

In addition, some functions useful for creating debugging output are 
defined in ``drivers/usb/common/debug.c``.

Alan Stern
