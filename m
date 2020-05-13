Return-Path: <SRS0=wfA1=63=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651DCA90AF
	for <linux-usb@archiver.kernel.org>; Wed, 13 May 2020 11:00:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FEFE206F5
	for <linux-usb@archiver.kernel.org>; Wed, 13 May 2020 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589367611;
	bh=8UoOtSBXsj1alevd9I/c1ubGRG368xjhahXJuTBmqrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=050cA7FwZVSJybZwwqRk/NlFQOtY78DpfdcDAVutisxSGeKI7uCKUuWV7q7schRz/
	 5O8FoeX1g0P8uzgVKsdxnIRLQGh3SqS6wzT1Y1lg5IKJPGv/B1X/mP7QSrK+V22bHA
	 +8mheWYHKOUlwHlIkEEtISjGVrcVdNssO8RgJslc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgEMLAL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 13 May 2020 07:00:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:38168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbgEMLAK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 07:00:10 -0400
Received: from localhost (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAED520659;
        Wed, 13 May 2020 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589367610;
        bh=8UoOtSBXsj1alevd9I/c1ubGRG368xjhahXJuTBmqrc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fxrgq3jGm4fY5Ku/poibJjOUOnkPiQrVFskb5CHMCPyFMjIyxQ4P7ZiZvBaYsWmDI
         9r0vYIQL+IvRSOq8Qr0hT5h4SlHw6WhV96g4o+5igh5n8Ss+4zB38A5lPa9ePDuWGj
         8RVdsNj9hOrsJoveugu1RFtU0vbNzwwSDLuhmA4g=
Date:   Wed, 13 May 2020 16:30:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] phy: phy-cadence-salvo: add phy .init API
Message-ID: <20200513110006.GD14092@vkoul-mobl>
References: <20200507052120.27497-1-peter.chen@nxp.com>
 <20200513025709.GB29070@a0393678ub>
 <20200513105141.GB3698@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513105141.GB3698@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13-05-20, 10:51, Peter Chen wrote:
> On 20-05-13 08:27:09, Kishon Vijay Abraham I wrote:
> > Hi Peter,
> > 
> > On Thu, May 07, 2020 at 01:21:20PM +0800, Peter Chen wrote:
> > > .init is used for PHY's initialization, and .power_on/power_off are only
> > > used for clock on and off.
> > > 
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > 
> > This patch doesn't apply cleanly. Can you kindly check phy -next is
> > proper since I expected this to merge cleanly?
> > 
> 
> Hi Kishon,
> 
> I don't see my first salvo PHY at your phy -next tree
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/log/?h=next
> 
> But I do see it is on linux-next tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=50d35aa8c15f7210fe76de64b1940100b588bcae
> 
> What happened?

Phy tree has moved to git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

-- 
~Vinod
