Return-Path: <SRS0=73Qb=5L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD46C43331
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 09:30:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADFC620775
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585215015;
	bh=60lcdGb16jJ64IIPZJoQsTKr+yRg3s78XxEMljIO42M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=npxSbwTNsJ8KDP6JsafWkKu048egK8kR1w/PSw3cyf1Kqw9EDq/z16yj9XO27a/to
	 co/pmjalXBY3K/M5POBkqUwuUlli27nWcNW2YcPOY0i4v4djq4L6yzIR5r2Iv8wdDF
	 uLAa/EBn4pz3Fn/bwVsG1QdFTawH4NV9WHqZc8mw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgCZJaO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Mar 2020 05:30:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgCZJaO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 05:30:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 122E620714;
        Thu, 26 Mar 2020 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585215012;
        bh=60lcdGb16jJ64IIPZJoQsTKr+yRg3s78XxEMljIO42M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0VCF5p+m238sj6t8TIZ0HJKWN8FN9sBBNhlL14xjo6Lq6iJoOxeiK0/bChyHjBX2H
         eA2b96tcB2a4loVKqSCMpOgnUWxibvV12fBxmT/qu5cXgUstyhGlgnnH/d12zdnXIU
         ihT2p9AHW5etHRvqywWqu5XvNxkGE4qTP5XnpHVg=
Date:   Thu, 26 Mar 2020 10:30:10 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sriharsha Allenki <sallenki@codeaurora.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        mgautam@codeaurora.org, jackp@codeaurora.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix use after free issue as part of
 queue failure
Message-ID: <20200326093010.GB994882@kroah.com>
References: <20200326060033.14550-1-sallenki@codeaurora.org>
 <20200326081601.GB979574@kroah.com>
 <aaa5c90b-dd6c-d025-3027-201f0e8c2f8e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaa5c90b-dd6c-d025-3027-201f0e8c2f8e@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 02:14:23PM +0530, Sriharsha Allenki wrote:
> Hi Greg,
> 
> On 3/26/2020 1:46 PM, Greg KH wrote:
> > On Thu, Mar 26, 2020 at 11:30:33AM +0530, Sriharsha Allenki wrote:
> >> In AIO case, the request is freed up if ep_queue fails.
> >> However, io_data->req still has the reference to this freed
> >> request. In the case of this failure if there is aio_cancel
> >> call on this io_data it will lead to an invalid dequeue
> >> operation and a potential use after free issue.
> >> Fix this by setting the io_data->req to NULL when the request
> >> is freed as part of queue failure.
> >>
> >> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> >> ---
> >>  drivers/usb/gadget/function/f_fs.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> >> index 571917677d35..767f30b86645 100644
> >> --- a/drivers/usb/gadget/function/f_fs.c
> >> +++ b/drivers/usb/gadget/function/f_fs.c
> >> @@ -1120,6 +1120,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
> >>  
> >>  		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
> >>  		if (unlikely(ret)) {
> >> +			io_data->req = NULL;
> >>  			usb_ep_free_request(ep->ep, req);
> >>  			goto error_lock;
> >>  		}
> >> -- 
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
> > What commit does this fix?  Should it go to stable kernels, and if so,
> > how far back?
> The commit 2e4c7553cd6f ("usb: gadget: f_fs: add aio support") introduced
> the problem. It is good to have in stable kernels and it needs to go all
> theway back to linux-3.15.y.
> 
> Hope this information helps.

Great, please resend this with the proper Fixes: and cc: stable... tag
on it so that it gets picked up properly.

thanks,

greg k-h
