Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3489CC001DE
	for <linux-usb@archiver.kernel.org>; Fri, 11 Aug 2023 01:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbjHKBvQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Aug 2023 21:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjHKBvO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 21:51:14 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E88622D57
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 18:51:12 -0700 (PDT)
Received: (qmail 263409 invoked by uid 1000); 10 Aug 2023 21:51:11 -0400
Date:   Thu, 10 Aug 2023 21:51:11 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alexandru Gagniuc <alexandru.gagniuc@hp.com>
Cc:     bjorn@mork.no, davem@davemloft.net, edumazet@google.com,
        eniac-xw.zhang@hp.com, hayeswang@realtek.com, jflf_kernel@gmx.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com, stable@vger.kernel.org, svenva@chromium.org
Subject: Re: [PATCH v2] r8152: Suspend USB device before shutdown when WoL is
 enabled
Message-ID: <cce11aea-166e-4d4b-84c0-a7fafb666aba@rowland.harvard.edu>
References: <78e3aade-2a88-42f4-9991-8e245f3eb9b9@rowland.harvard.edu>
 <20230810225109.13973-1-alexandru.gagniuc@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810225109.13973-1-alexandru.gagniuc@hp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 10, 2023 at 10:51:09PM +0000, Alexandru Gagniuc wrote:
> On Thu, Aug 10, 2023 at 01:34:39PM -0400, Alan Stern wrote:
> > I was thinking that the host controller driver's shutdown method might 
> > turn off power to all of the ports.
> > 
> > For example, in the ehci-hcd driver, ehci_shutdown() calls 
> > ehci_silence_controller(), which calls ehci_turn_off_all_ports().  I 
> > don't know if xhci-hcd does anything similar.
> 
> EHCI is a different beast. I don't think EHCI (USB2.0) has the U3 link state.

USB-2 doesn't have link states, but it does have the notion of a 
downstream port being suspended, which is effectively the same as U3.

> The equivalent for would be xhci_shutdown(). It makes a call to
> usb_disable_xhci_ports() for XHCI_SPURIOUS_REBOOT quirk. As I have not
> encountered it, I don't know how it will affect the link state of other ports.
> The quirk appears to switch ports to EHCI mode, rather than turn off power.

All right.  The important point is that the patch works for your 
situation.  I was just trying to find out how much thought you had given 
to the possibilities other people might face, if their systems aren't 
quite the same as yours.

Alan Stern
