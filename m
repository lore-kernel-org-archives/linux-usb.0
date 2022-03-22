Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709ACC433F5
	for <linux-usb@archiver.kernel.org>; Tue, 22 Mar 2022 18:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbiCVSEb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Mar 2022 14:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbiCVSEa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 14:04:30 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DBD9814027
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 11:03:01 -0700 (PDT)
Received: (qmail 132790 invoked by uid 1000); 22 Mar 2022 14:03:00 -0400
Date:   Tue, 22 Mar 2022 14:03:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Petr Janecek <janecek@ucw.cz>
Cc:     alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: Apogee ONEv2 keeps resetting
Message-ID: <YjoPVAxeKtY6aV1s@rowland.harvard.edu>
References: <3f4d1bce-7459-9ea4-be73-9b51f569e526@ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f4d1bce-7459-9ea4-be73-9b51f569e526@ucw.cz>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 20, 2022 at 02:15:40AM +0100, Petr Janecek wrote:
> Hi,
>    I'm trying to use Apogee ONEv2.  From usb dumps under
> macos or windows it seems like a usb Class Audio 2.0
> device, but in linux, it keeps resetting every two seconds
> or so.  It keeps resetting even when the snd-usb-audio
> driver is disabled, so the problem is probably at a lower
> level.

Can you post the log output on a system where snd-usb-audio is disabled?

>   The messages below are from v5.16.16, but it behaves
> the same no matter what I plug it into.
> 
> [  253.708616] usb 3-8: new high-speed USB device number 6 using xhci_hcd
> [  253.899363] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> bcdDevice= 1.05
> [  253.899370] usb 3-8: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [  253.899373] usb 3-8: Product: ONEv2
> [  253.899375] usb 3-8: Manufacturer: Apogee
> [  253.899377] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> [  253.960901] mc: Linux media interface: v0.10

Any idea where that line came from?

You should try capturing a usbmon trace showing what happens when the 
device is plugged in and then resets.  Preferably on a system where 
snd-usb-audio is disabled.

One other thing you might try: Disable runtime PM for USB ("echo -1 
>/sys/module/usbcore/parameters/autosuspend" before plugging in the 
device).

Alan Stern
