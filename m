Return-Path: <SRS0=eJ6H=CV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF76C43461
	for <linux-usb@archiver.kernel.org>; Sat, 12 Sep 2020 12:40:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35FA7214D8
	for <linux-usb@archiver.kernel.org>; Sat, 12 Sep 2020 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599914426;
	bh=rHSWa3VSxKeSbN9vwv2HTQH2xcgokPuVAbvIKU/gjIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xHjcbgCfG6VtM2loujLiB2n2rKVdDB4vMiGdk0j0d2+EKqVcgwWYZK2dhSu5hHnfa
	 F62WwJgSB23ZSVIvu4wdMcX/LTRrUoCV3yNroW063ikPVBwEvKzfK4kjDK54l4E7GH
	 hcpslpBNXvJrDGOV5CFb//XT5pBv5ST5mXCwNa5A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgILMkY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 12 Sep 2020 08:40:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgILMkX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 12 Sep 2020 08:40:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBBA5208E4;
        Sat, 12 Sep 2020 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599914422;
        bh=rHSWa3VSxKeSbN9vwv2HTQH2xcgokPuVAbvIKU/gjIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rZcKlDNo2dda6HGV9AHcvlk0G7x44sdhn5qF+8etoSvcFAAxzsnqa7HHah+uSMqz8
         KI8vfm4cLRIloSChABKUhMTtYMhR1ImG7dZtn1U2wi8RTEEIe1nt9jTJ2Y7TidO/5O
         O2wzIUFLYUvBvsLAfpYPHtMLdHYFLgt576fR/yiA=
Date:   Sat, 12 Sep 2020 14:40:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: make linux-usb list remarks consistent
Message-ID: <20200912124025.GA174230@kroah.com>
References: <20200912121346.2796-1-lukas.bulwahn@gmail.com>
 <alpine.DEB.2.21.2009121416500.3770@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2009121416500.3770@felia>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 12, 2020 at 02:19:02PM +0200, Lukas Bulwahn wrote:
> 
> 
> On Sat, 12 Sep 2020, Lukas Bulwahn wrote:
> 
> > This patch submission will also show me if linux-usb is moderated or not.
> > I have not subscribed to linux-usb and if it shows up quickly in the
> > archive, the list is probably not moderated, and hence, validating the
> > patch.
> > 
> 
> The patch showed up in the archives within seconds:
> 
> https://lore.kernel.org/linux-usb/20200912121346.2796-1-lukas.bulwahn@gmail.com/
> 
> So, the linux-usb list is most likely not moderated. Patch validated.

Yes, it is not moderated, and never has been, no idea where that idea came from.

thanks,

greg k-h
