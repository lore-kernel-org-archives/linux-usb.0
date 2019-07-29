Return-Path: <SRS0=luNN=V2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63D6C7618E
	for <linux-usb@archiver.kernel.org>; Mon, 29 Jul 2019 16:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97B2A2070B
	for <linux-usb@archiver.kernel.org>; Mon, 29 Jul 2019 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564419375;
	bh=Jb7YttoUfhXk57tI+td6fw5yT58F4sBic2hI+PXmoR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cfBG/xhl9Rn8e0SIak2VTMho9LBBNpiPO+7c/G/yLL+C0tw9JtKYamzr7N283nPnt
	 qbyOG74PArIGRC6aAj15dxTg2m6yGqDjoKXSTCWw30g0X8RBAYdOVmOMA39aRlFAwv
	 C5wnlrf2yxwCo+l7GpWTL5b4iNTdkOPjjfogam+4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbfG2Q4P (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 29 Jul 2019 12:56:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727165AbfG2Q4O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jul 2019 12:56:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FEC3206E0;
        Mon, 29 Jul 2019 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564419373;
        bh=Jb7YttoUfhXk57tI+td6fw5yT58F4sBic2hI+PXmoR4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FvEucwLp9F/97X8skoF+H8Wz10sVG1GIsV67VKgXl8I6siTOxMPv55fryyZ/wJ/XO
         cOcRut/6QT2SZSqhKdxd5kQ9W1nGAfPtBFWyf4lqspLrmAf6GObQEfzv95jQKIIiMm
         XEdddmHh458+5qHmcwmIyJHnOiDl9zs27NxITJ1M=
Date:   Mon, 29 Jul 2019 18:56:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     stable@vger.kernel.org, linux-usb@vger.kernel.org,
        fei.yang@intel.com, john.stultz@linaro.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH 4.19.y 3/3] usb: dwc3: gadget: remove req->started flag
Message-ID: <20190729165611.GA14160@kroah.com>
References: <1564407819-10746-1-git-send-email-saranya.gopal@intel.com>
 <1564407819-10746-4-git-send-email-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564407819-10746-4-git-send-email-saranya.gopal@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 29, 2019 at 07:13:39PM +0530, Saranya Gopal wrote:
> From: Felipe Balbi <felipe.balbi@linux.intel.com>
> 
> [Upstream commit 7c3d7dc89e57a1d43acea935882dd8713c9e639f]
> 
> Now that we have req->status, we don't need this extra flag
> anymore. It's safe to remove it.
> 
> Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> ---
>  drivers/usb/dwc3/core.h   | 2 --
>  drivers/usb/dwc3/gadget.c | 1 -
>  drivers/usb/dwc3/gadget.h | 2 --
>  3 files changed, 5 deletions(-)

Why is this patch needed for a stable tree?  It just cleans stuff up, it
doesn't actually change any functionality.

thanks,

greg k-h
