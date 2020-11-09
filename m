Return-Path: <SRS0=6kCz=EP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD03EC2D0A3
	for <linux-usb@archiver.kernel.org>; Mon,  9 Nov 2020 06:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88BDB2065D
	for <linux-usb@archiver.kernel.org>; Mon,  9 Nov 2020 06:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604903778;
	bh=1ZZ5MhRjrfEPQ9Kh1Ors22JcsW13nuOTNKbr4N1+9D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tJDzOF2VTmXb9+LyicRkDi1Dz3wVtQTipOSLMyEwcYY5ngzP1BXWcVeCsbY+vwq4s
	 y30OzH7AKe+3p2Gm3KgOiASC+gmL6neHAaIURPKMr2J+WHDk3sA+p3Q2Ip/6drppz3
	 sLTL5935yfaTYB3t9yiuOGl3HjWMLFm8fLawVuJg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbgKIGgN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Nov 2020 01:36:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:34748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727077AbgKIGgN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 01:36:13 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C92B520684;
        Mon,  9 Nov 2020 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604903772;
        bh=1ZZ5MhRjrfEPQ9Kh1Ors22JcsW13nuOTNKbr4N1+9D0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DjLCQ5w2DJInuY78aKnPMfMrnPfv2ELH7zVIefxUthgdTFY2McCt1grOYypKnIby3
         ALSHQXFYnXxtl7NLg2C6JY5z8Gw0bvHKPMx34KDep/WxvrxrU3VoInhKr5XcccuV8r
         F/DzLVw8v1ed+SzXEyG3Z9e4/990sNTd0gWVnPws=
Date:   Mon, 9 Nov 2020 07:36:07 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Tim Li <tim.li@dji.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Question: gadget: How to realize uvc and uac composite function?
Message-ID: <20201109063607.GA49716@kroah.com>
References: <883ccf2fb0a34c7d8466db09b3f26e72@MAIL-MBX-cwP02.dji.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <883ccf2fb0a34c7d8466db09b3f26e72@MAIL-MBX-cwP02.dji.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 09, 2020 at 02:03:11AM +0000, Tim Li wrote:
> This email and any attachments thereto may contain private, confidential, and privileged material for the sole use of the intended recipient. Any review, copying, or distribution of this email (or any attachments thereto) by others is strictly prohibited. If you are not the intended recipient, please contact the sender immediately and permanently delete the original and any copies of this email and any attachments thereto.

Now deleted.
