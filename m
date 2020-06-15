Return-Path: <SRS0=aBLZ=74=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D84C433DF
	for <linux-usb@archiver.kernel.org>; Mon, 15 Jun 2020 14:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2E55206B7
	for <linux-usb@archiver.kernel.org>; Mon, 15 Jun 2020 14:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730397AbgFOOhD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Jun 2020 10:37:03 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58539 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728326AbgFOOhD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jun 2020 10:37:03 -0400
Received: (qmail 18489 invoked by uid 1000); 15 Jun 2020 10:37:01 -0400
Date:   Mon, 15 Jun 2020 10:37:01 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Andrew P. Lentvorski" <bsder@allcaps.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Implementing WCID for a bulk function ... can't create String
 descriptor of 0xEE
Message-ID: <20200615143701.GA17127@rowland.harvard.edu>
References: <205ac1dc-2e8b-e83a-85f0-5a8e796f4b16@allcaps.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <205ac1dc-2e8b-e83a-85f0-5a8e796f4b16@allcaps.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 15, 2020 at 01:46:08AM -0700, Andrew P. Lentvorski wrote:
> I've got a bulk transport kernel module composite function.  Nothing
> fancy, just opens the two pipes to a character device just like f_hid.c.
>  It works fine, as far as I can tell.
> 
> Now, I'm trying to implement WCID so that Windows will automatically
> recognize it and attach it to the WinUSB drivers.
> 
> However, I simply cannot figure out how to create a string with an index
> of 0xEE and data of "MSFT100" so that Windows will pick up the device
> and then request the extra features.
> 
> Alternatively, I'm happy to adjust my bcdUSB to flag USB 2.01 or USB 2.1
> and use the BOS system.  However, as there appear to be very few
> examples of that in the Linux codebase (none that I can see--but I'm not
> on latest), I suspect that would be just swapping something that might
> be possible but I'm just missing the path vs something that has a path
> that is wholly untrod.
> 
> WCID References:
> https://github.com/pbatard/libwdi/wiki/WCID-Devices
> https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/microsoft-defined-usb-descriptors
> 
> Any help, advice or pointers would be appreciated.

While I'm certainly not an expert in this area, here's a suggestion: Look 
through the .h and .c files for the composite framework, searching for 
things related to use_os_string, b_vendor_code, bMS_VendorCode, and so 
on.

The subject is a little tricky, because the composite framework is all 
about building a single gadget driver from multiple function drivers.  A 
gadget can have only one string descriptor with index 0xEE (ignoring 
language issues), so somehow the requirements of the various function 
drivers have to be reconciled.

Alan Stern
