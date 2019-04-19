Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA3DC282E0
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EABF720449
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555698915;
	bh=2RKv36AOf3MjqfAhIhleu0QSX4gmBZ4LhKBVaEOPSYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cUOpwUHJsd9N6YsEbwDMDVEuz/yLNhFXNJQ96V1ks82NpEBhyJgMXpiapNMKpLm5x
	 2r0HCD9rby4m3Mtn/BE8G+Wg2io1trU6bMl2ukLptIvUyw1vAO4+X++27Y+TPeD250
	 uqWlUb3gbibDFTTR7oUUVvbIHvku1DzTtTWNw4lI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfDSSd6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:33:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727572AbfDSS3Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 14:29:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DA4121920;
        Fri, 19 Apr 2019 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555673065;
        bh=2RKv36AOf3MjqfAhIhleu0QSX4gmBZ4LhKBVaEOPSYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TAwvnDMgRsobwhA45M3EE2Sorm6DoudaBi/TZPbsQUOVTHEjXKp9sxq5Iz+9GZHjd
         8eMZvMY8J+UQfoMV1EgSEuE+BIOeJ6JEz6+haAJj8q74B2YVsLDJvTqMFiXlEg1OZ6
         D5jvF4EmWRg08CtSutjERUziToOu/mJCSKKotJRQ=
Date:   Fri, 19 Apr 2019 13:24:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Felipe Balbi <balbi@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] usb: dwc3: Allow building USB_DWC3_QCOM without EXTCON
Message-ID: <20190419112423.GC14886@kroah.com>
References: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 19, 2019 at 11:59:08AM +0200, Marc Gonzalez wrote:
> Keep EXTCON support optional, since some platforms do not need it.
> 
> Fixes: 3def4031b3e3 ("usb: dwc3: add EXTCON dependency for qcom")
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>  drivers/usb/dwc3/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 2b1494460d0c..6bd1a28c535f 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -115,7 +115,8 @@ config USB_DWC3_ST
>  
>  config USB_DWC3_QCOM
>  	tristate "Qualcomm Platform"
> -	depends on EXTCON && (ARCH_QCOM || COMPILE_TEST)
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on EXTCON || !EXTCON

Why is this last line needed?  Does it really do anything?

thanks,

greg k-h
