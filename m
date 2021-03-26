Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6596C433C1
	for <linux-usb@archiver.kernel.org>; Fri, 26 Mar 2021 13:42:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C4D061A0D
	for <linux-usb@archiver.kernel.org>; Fri, 26 Mar 2021 13:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhCZNmB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Mar 2021 09:42:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230083AbhCZNlx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 09:41:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21F5061A13;
        Fri, 26 Mar 2021 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616766112;
        bh=7lST/Kiw6GGs2KSScFinlKhaTOz83CCIcH6EaBVLQ8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eMy51KpMZv9FRTtsfHaujYgkLterkwa7VtRuKQhFm3QJ2KJv2qOQDst9xOm5GlUbQ
         KyOKFcvgjUaa+NacH0gOoY/gtEs5oo7RzfzoYXF9fzTPOGZ9r0F1Xrb1HegeaWC6Jx
         8yy9welg63PhbA4VmPaWQe/osNO8V73MolKPCO0o=
Date:   Fri, 26 Mar 2021 14:41:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jay Fang <f.fangjian@huawei.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        tangzihao1@hisilicon.com, huangdaode@huawei.com
Subject: Re: [PATCH V2] USB: gadget: f_fs: Use memdup_user() as a cleanup
Message-ID: <YF3kntEVAKGom1is@kroah.com>
References: <1616644100-8214-1-git-send-email-f.fangjian@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616644100-8214-1-git-send-email-f.fangjian@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 25, 2021 at 11:48:20AM +0800, Jay Fang wrote:
> From: Zihao Tang <tangzihao1@hisilicon.com>
> 
> Fix coccicheck warning which recommends to use memdup_user():
> 
> drivers/usb/gadget/function/f_fs.c:3829:8-15: WARNING opportunity for memdup_user
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 801a8b6..90a24d4 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3826,14 +3826,9 @@ static char *ffs_prepare_buffer(const char __user *buf, size_t len)
>  	if (!len)
>  		return NULL;
>  
> -	data = kmalloc(len, GFP_KERNEL);
> -	if (!data)
> -		return ERR_PTR(-ENOMEM);
> -
> -	if (copy_from_user(data, buf, len)) {
> -		kfree(data);
> -		return ERR_PTR(-EFAULT);
> -	}
> +	data = memdup_user(buf, len);
> +	if (IS_ERR(data))
> +		return data;
>  
>  	pr_vdebug("Buffer from user space:\n");
>  	ffs_dump_mem("", data, len);
> -- 
> 2.7.4
> 

Does not apply to my tree at all :(
