Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B0AC64991
	for <linux-usb@archiver.kernel.org>; Thu,  1 Sep 2022 14:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234898AbiIAOk7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234888AbiIAOki (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 10:40:38 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C03F04F665
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 07:40:19 -0700 (PDT)
Received: (qmail 235838 invoked by uid 1000); 1 Sep 2022 10:40:18 -0400
Date:   Thu, 1 Sep 2022 10:40:18 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <greg@kroah.com>,
        Patchwork Bot <patchwork-bot@kernel.org>
Subject: Re: [PATCH v3] usb: ohci-platform: fix usb disconnect issue after s4
Message-ID: <YxDEUnHIMiNr6Xa9@rowland.harvard.edu>
References: <20220901015446.22384-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901015446.22384-1-zhuyinbo@loongson.cn>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 01, 2022 at 09:54:46AM +0800, Yinbo Zhu wrote:
> Avoid retaining bogus hardware states during resume-from-hibernation.
> Previously we had reset the hardware as part of preparing to reinstate
> the snapshot image. But we can do better now with the new PM framework,
> since we know exactly which resume operations are from hibernation.
> 
> According to the commit 'cd1965db054e ("USB: ohci: move ohci_pci_{
> suspend,resume} to ohci-hcd.c")' and commit '6ec4beb5c701 ("USB: new
> flag for resume-from-hibernation")', the flag "hibernated" is for
> resume-from-hibernation and it should be true when usb resume from disk.
> 
> When this flag "hibernated" is set, the drivers will reset the hardware
> to get rid of any existing state and make sure resume from hibernation
> re-enumerates everything for ohci.

The patch title mentions "usb disconnect issue", but the description 
says nothing about it.  Please explain what this disconnect issue is.

Alan Stern
