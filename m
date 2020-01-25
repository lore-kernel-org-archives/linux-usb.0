Return-Path: <SRS0=lYTf=3O=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFDDC2D0DB
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jan 2020 16:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C09C2071A
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jan 2020 16:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgAYQKh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 25 Jan 2020 11:10:37 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44069 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726327AbgAYQKg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jan 2020 11:10:36 -0500
Received: (qmail 20338 invoked by uid 500); 25 Jan 2020 11:10:35 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jan 2020 11:10:35 -0500
Date:   Sat, 25 Jan 2020 11:10:35 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Tim Schumacher <timschumi@gmx.de>
cc:     linux-usb@vger.kernel.org, <stable@vger.kernel.org>
Subject: Re: [PATCH] USB: uas: Add the no-UAS quirk for JMicron JMS561U
In-Reply-To: <20200125064838.2511-1-timschumi@gmx.de>
Message-ID: <Pine.LNX.4.44L0.2001251107370.20113-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 25 Jan 2020, Tim Schumacher wrote:

> The JMicron JMS561U (notably used in the Sabrent SATA-to-USB
> bridge) appears to have UAS-related issues when copying large
> amounts of data, causing it to stall.
> 
> Disabling the advertised UAS (either through a command-line
> quirk or through this patch) mitigates those issues.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Tim Schumacher <timschumi@gmx.de>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1b23741036ee..eaec7d4973b7 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -97,6 +97,13 @@ UNUSUAL_DEV(0x357d, 0x7788, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> 
> +/* Reported-by: Tim Schumacher <timschumi@gmx.de> */
> +UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
> +		"JMicron",
> +		"JMS561U",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
>  UNUSUAL_DEV(0x4971, 0x1012, 0x0000, 0x9999,
>  		"Hitachi",

This entry was added in the wrong place; entries should be sorted by 
Vendor ID and Product ID, as described at the start of the file.  
Please move it to the proper location and resubmit.

Alan Stern

