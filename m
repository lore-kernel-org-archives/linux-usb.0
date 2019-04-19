Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BE0C282DF
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE68A20449
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555698964;
	bh=FqZjSibbLgXaWbcOOpyKRKaPLapFp7NP1Z2cg72xA/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QNJmwZNcfppwG2LOnL7yiyzmfo+YPNeP9NYGPZAnpXZtrbNKN8jJM3dS3CCJtn7X0
	 D59XuK1OucJXDAh26bjbZShSIlD/MGlIpPdqoymxsFeoQZdLoM7ijYe6/VV3phcqMR
	 Ef3IdpBwV60CVs41K5vVQFPRbUpEWb7tv0hTxcqM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfDSS3O (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:29:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:53862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbfDSS3O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 14:29:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BDFE21919;
        Fri, 19 Apr 2019 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555673732;
        bh=FqZjSibbLgXaWbcOOpyKRKaPLapFp7NP1Z2cg72xA/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DLJIxVz6AEVC8CtYCbggFzerWejChFYZCs6nPIB6POBCTAfITamdLUWV++NxIGPg3
         Ax8V+MuwkV/6w8u5/xfmL1ehV94jfTUKYm/b+GKmQbQXyAnlp5l/2wShAIxWwk3Moi
         Hmv3lPxZLc/WZSnnyOSNDnvaLnf2RdPk36+1LLuY=
Date:   Fri, 19 Apr 2019 13:35:29 +0200
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
Message-ID: <20190419113529.GA16007@kroah.com>
References: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
 <20190419112423.GC14886@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190419112423.GC14886@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 19, 2019 at 01:24:23PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 19, 2019 at 11:59:08AM +0200, Marc Gonzalez wrote:
> > Keep EXTCON support optional, since some platforms do not need it.
> > 
> > Fixes: 3def4031b3e3 ("usb: dwc3: add EXTCON dependency for qcom")
> > Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > ---
> >  drivers/usb/dwc3/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 2b1494460d0c..6bd1a28c535f 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -115,7 +115,8 @@ config USB_DWC3_ST
> >  
> >  config USB_DWC3_QCOM
> >  	tristate "Qualcomm Platform"
> > -	depends on EXTCON && (ARCH_QCOM || COMPILE_TEST)
> > +	depends on ARCH_QCOM || COMPILE_TEST
> > +	depends on EXTCON || !EXTCON
> 
> Why is this last line needed?  Does it really do anything?

As explained to me on irc, this line is fine.

Learn something new every day :)

greg k-h
