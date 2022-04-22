Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082E2C433EF
	for <linux-usb@archiver.kernel.org>; Fri, 22 Apr 2022 08:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbiDVIo0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 22 Apr 2022 04:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiDVIoY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 04:44:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FDF52E65
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 01:41:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37AA962018
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 08:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22675C385AA;
        Fri, 22 Apr 2022 08:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650616890;
        bh=g0pfcFdBjt+yGrAjJeiTcojE5qwWIPQDRHf09HeUPNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GAbGy/LNWjSVdmgqQ/LtgAlwA5f70c2lP1MGGSCFWYLpM9sBufte3Lt482wNk0Uvo
         3JcsNIIU4qybhuknkh8Ou1zG/u89RoyLxY0cP7Rj56o2QtEcBAH3POC4TqHSAjYrCA
         Bg97SG6nKjRwUT6Z6ydSF+a8RV8lTCZ7IwujnMBo=
Date:   Fri, 22 Apr 2022 10:41:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v6 5/5] usb: gadget: add trace event of configfs write
 attributes operation
Message-ID: <YmJqN+kK6vDOkP4U@kroah.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649294865-4388-6-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649294865-4388-6-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 07, 2022 at 09:27:45AM +0800, Linyu Yuan wrote:
> Add API trace_usb_configfs_write_attr() to trace user change gadget or
> function attributes.

Why?  Again, userspace is doing this already, why do we need to trace
what it is doing back to userspace again?

> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: no change
> v3: add API in trace.c
> v4: fix memory leak
> v5: no change
> v6: fix checkpatch warning
> 
>  drivers/usb/gadget/configfs.c                  | 24 ++++++++++++++++++++++++
>  drivers/usb/gadget/function/f_acm.c            |  1 +
>  drivers/usb/gadget/function/f_hid.c            |  4 ++++
>  drivers/usb/gadget/function/f_loopback.c       |  4 ++++
>  drivers/usb/gadget/function/f_mass_storage.c   | 16 ++++++++++++++++
>  drivers/usb/gadget/function/f_midi.c           |  6 ++++++
>  drivers/usb/gadget/function/f_printer.c        |  4 ++++
>  drivers/usb/gadget/function/f_serial.c         |  1 +
>  drivers/usb/gadget/function/f_sourcesink.c     | 16 ++++++++++++++++
>  drivers/usb/gadget/function/f_uac1.c           |  6 ++++++
>  drivers/usb/gadget/function/f_uac1_legacy.c    |  4 ++++
>  drivers/usb/gadget/function/f_uac2.c           |  8 ++++++++
>  drivers/usb/gadget/function/u_ether_configfs.h | 10 ++++++++++
>  drivers/usb/gadget/function/uvc_configfs.c     | 18 ++++++++++++++++++
>  drivers/usb/gadget/trace.c                     | 26 ++++++++++++++++++++++++++
>  include/linux/usb/composite.h                  |  3 +++
>  include/linux/usb/gadget_configfs.h            |  2 ++
>  17 files changed, 153 insertions(+)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index a304d29..a9ea331 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -146,6 +146,8 @@ static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
>  {							\
>  	u8 val;						\
>  	int ret;					\
> +							\
> +	trace_usb_configfs_write_attr(item, #_name, page);	\
>  	ret = kstrtou8(page, 0, &val);			\
>  	if (ret)					\
>  		return ret;				\
> @@ -159,6 +161,8 @@ static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
>  {							\
>  	u16 val;					\
>  	int ret;					\
> +							\
> +	trace_usb_configfs_write_attr(item, #_name, page);	\
>  	ret = kstrtou16(page, 0, &val);			\
>  	if (ret)					\
>  		return ret;				\
> @@ -198,6 +202,8 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
>  	u16 bcdDevice;
>  	int ret;
>  
> +	trace_usb_configfs_write_attr(item, "bcdDevice", page);

Where did "bcdDevice" come from?  Shouldn't this all just come from
configfs instead of having to add it to each individual function?

And again, why?

thanks,

greg k-h
