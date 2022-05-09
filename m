Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4C6C433EF
	for <linux-usb@archiver.kernel.org>; Mon,  9 May 2022 12:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbiEIMwB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 May 2022 08:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234884AbiEIMwA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 08:52:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AF62A374C
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 05:48:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9709061381
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 12:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CA4C385AB;
        Mon,  9 May 2022 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652100486;
        bh=IZZeOeTtaC1GMYef/o3FJgyucWuTJ+ZYcjVNnN/7DwQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VVoCBcoi/mLfiYW1V/aBIwrh2ZqcJKGL2FyZtHLJIhixHXW+ECWhNXRhCX0UPJUQU
         CAfW7BtsUw5rGRp3VPw/hOVSRfuYpIp1nAwvRZ1ylwAT1OSjkNJFQMBM/64573kS/B
         TgZa98wib2j6kvOA2S7noHvK7tqXKnBsL2QegKL4=
Date:   Mon, 9 May 2022 14:48:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 1/4] usb: gadget: f_mass_storage: fix warning of
 -Werror=unused-but-set-variable
Message-ID: <YnkNgqNBlYkKJNtg@kroah.com>
References: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
 <1652097288-19909-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652097288-19909-2-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 07:54:45PM +0800, Linyu Yuan wrote:
> When add gcc W=1 compile flag, it report following error,
> In function 'invalidate_sub':
> error: variable 'rc' set but not used [-Werror=unused-but-set-variable],
> 
> Add a __maybe_unused property.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v3: new add
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 3a77bca..a688538 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -926,7 +926,7 @@ static void invalidate_sub(struct fsg_lun *curlun)
>  {
>  	struct file	*filp = curlun->filp;
>  	struct inode	*inode = file_inode(filp);
> -	unsigned long	rc;
> +	unsigned long	__maybe_unused rc;

That is almost never the correct solution here, sorry.  Fix this up
properly.

And W=1 really is not a valid thing to care about, right?

thanks,

>  	rc = invalidate_mapping_pages(inode->i_mapping, 0, -1);

Why not properly handle the error?

thanks,

greg k-h
