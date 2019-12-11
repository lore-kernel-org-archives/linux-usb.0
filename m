Return-Path: <SRS0=2rsX=2B=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360B8C43603
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 08:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C70921D7D
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576054287;
	bh=BBTLv4io73hhhqRDc1IWPUUM0wAvRcQc/bXdD/DCJ3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=X4bc9j50hFt9XaFxkYpm1pERaYn4QNNC3cRs0BMGP0sKOFIURiJD8yZJdLB77T/Sa
	 paZkjowf6MoNTHp5m05iXXCWGJGQfaA99s5fTrEg44GL9IlfBbJGv6m3MdH+51Okfj
	 PlMqECmOKTdCuZzVPlFcR2pFsaXriKDTHgB2v/+M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfLKIvZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Dec 2019 03:51:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:49274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728274AbfLKIvZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 03:51:25 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35D3B2077B;
        Wed, 11 Dec 2019 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576054284;
        bh=BBTLv4io73hhhqRDc1IWPUUM0wAvRcQc/bXdD/DCJ3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kbLGqgpU4Qo19CIrNvmOtvyNPAeUzFwipDsXzZ5WZeFtwJq2rCZbosDVj9gzHoF8+
         Bibjq3CRF5cZozFK8lfCMhPPTaIuaG8spMMCHFnuPFqHbjHpbzT7He0LvvGfpvGzrw
         lilJ/KSJzCQ0pw8pvCxjGyjzs94q3csplA+KWE4E=
Date:   Wed, 11 Dec 2019 09:51:22 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: musb: sunxi: propagate devicetree node to glue
 pdev
Message-ID: <20191211085122.GA500642@kroah.com>
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-2-b-liu@ti.com>
 <20191211080528.GA415633@kroah.com>
 <20191211084935.GS10631@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211084935.GS10631@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 09:49:35AM +0100, Johan Hovold wrote:
> On Wed, Dec 11, 2019 at 09:05:28AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Dec 10, 2019 at 10:54:53AM -0600, Bin Liu wrote:
> > > From: Mans Rullgard <mans@mansr.com>
> > > 
> > > In order for devicetree nodes to be correctly associated with attached
> > > devices, the controller node needs to be propagated to the glue device.
> > > 
> > > Signed-off-by: Mans Rullgard <mans@mansr.com>
> > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > ---
> > >  drivers/usb/musb/sunxi.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > Does this need to go to stable kernel(s)?  If so, what commit does this
> > fix fix?
> 
> No, I'd say it's a new feature.

Then why is it needed for 5.5-final and not for 5.6-rc1?

thanks,

greg k-h
