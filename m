Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF2EC433FE
	for <linux-usb@archiver.kernel.org>; Fri,  7 Oct 2022 07:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiJGHAC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 7 Oct 2022 03:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiJGG74 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Oct 2022 02:59:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2563E13F37;
        Thu,  6 Oct 2022 23:59:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0075B8220F;
        Fri,  7 Oct 2022 06:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AF1C433D7;
        Fri,  7 Oct 2022 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665125985;
        bh=9wr1e5ewYQYmphDre30sBLxkhXdzYS0rjyoiWTszXfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fHOxCmU4bzvM0RPKnb1a0rOzbqjKAt6vKXGFHbdVgSbv/xC409V5mCr3FLJQdad/2
         4tpwGM90CWWXQNmX31PUyt3tP9pe7NNoain7pXpoqLhxw9EKD8SByBfp7v+KfKbSNQ
         ht78ftOkGQc13sw5KdcUmw3uEvuE1uNNmwORriAY=
Date:   Fri, 7 Oct 2022 09:00:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Justin Chen <justinpopo6@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@ti.com, linux-phy@lists.infradead.org,
        f.fainelli@gmail.com, alcooperx@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, justin.chen@broadcom.com
Subject: Re: [PATCH] MAINTAINERS: Update maintainers for broadcom USB
Message-ID: <Yz/Oik0uXXo0uGk6@kroah.com>
References: <1665098469-19008-1-git-send-email-justinpopo6@gmail.com>
 <Yz/G0jQxc4c2gzhl@kroah.com>
 <CAJx26kUTzBeNkV_=gEeUYaatBwugT1uFH_b_ggq-fXaJDRBMqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJx26kUTzBeNkV_=gEeUYaatBwugT1uFH_b_ggq-fXaJDRBMqQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 06, 2022 at 11:46:45PM -0700, Justin Chen wrote:
> On Thu, Oct 6, 2022 at 11:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 06, 2022 at 04:21:09PM -0700, justinpopo6@gmail.com wrote:
> > > From: Justin Chen <justinpopo6@gmail.com>
> > >
> > > Al Cooper is no longer the downstream maintainer for broadcom USB.
> > > I will be taking his place as downstream and as an additional
> > > upstream maintainer.
> >
> > What do you mean by "downstream" here?
> >
> Downstream as in internal to Broadcom. Apologies for the confusion.

Ok, but then why are these all gmail.com addresses?  Why not use your
proper work addresses instead so that we can at least validate that the
patches are coming from a broadcom.com domain?

Also, you should reword the changelog text :)

thanks,

greg k-h
