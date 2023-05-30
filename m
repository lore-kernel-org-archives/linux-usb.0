Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03874C77B7A
	for <linux-usb@archiver.kernel.org>; Tue, 30 May 2023 00:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjE3ArC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 29 May 2023 20:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjE3ArC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 20:47:02 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E955BDC
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 17:46:59 -0700 (PDT)
Received: (qmail 389283 invoked by uid 1000); 29 May 2023 20:46:59 -0400
Date:   Mon, 29 May 2023 20:46:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     gregkh@linuxfoundation.org, colin.i.king@gmail.com,
        xuetao09@huawei.com, quic_eserrao@quicinc.com,
        water.zhangjiantao@huawei.com, peter.chen@freescale.com,
        balbi@ti.com, francesco@dolcini.it, alistair@alistair23.me,
        stephan@gerhold.net, bagasdotme@gmail.com, luca@z3ntu.xyz,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4 1/3] Revert "Revert "usb: gadget: udc: core: Invoke
 usb_gadget_connect only when started""
Message-ID: <012c8b5b-0697-4965-bed8-fbed4c8910c9@rowland.harvard.edu>
References: <20230529234816.3720623-1-badhri@google.com>
 <6547e73e-81e4-4a29-babf-13f852f1eb8b@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6547e73e-81e4-4a29-babf-13f852f1eb8b@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 29, 2023 at 08:42:18PM -0400, Alan Stern wrote:
> On Mon, May 29, 2023 at 11:48:14PM +0000, Badhri Jagan Sridharan wrote:
> > This reverts commit f22e9b67f19ccc73de1ae04375d4b30684e261f8.

This is not the format we use for referring to commits.

> > 
> > The regression reported in
> > https://lore.kernel.org/all/ZF4bMptC3Lf2Hnee@gerhold.net/ is being
> > fixed in
> > commit 7d7863db7cc0 ("usb: gadget: udc: core: Offload usb_udc_vbus_handler processing").

That is the correct format.

> What commit is that?  It doesn't exist yet, at least, not in the 
> mainline kernel.
> 
> > Hence reverting the revert.
> > 
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> 
> No!  Do not do this.  If you do, there will again be a version of the 
> kernel that has the bug that caused the revert in the first place.  Even 
> if it's only temporary, it could still affect people who are (for 
> example) trying to run bisections.
> 
> Instead, reorder the patches.  First fix the underlying problem that 
> led to the deadlocks.  Once that's in good shape then you can safely 
> make this change.

I forgot to mention...  When you do eventually resubmit this, do NOT use 
the commit message above.  It says absolutely nothing about what the 
patch actually does or why it is needed.

It's okay to mention that this reinstates something that had to be 
reverted.  But you also need to include the information that was in the 
original commit.

Alan Stern
