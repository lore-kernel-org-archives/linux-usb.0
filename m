Return-Path: <SRS0=J28a=DU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F06C43457
	for <linux-usb@archiver.kernel.org>; Tue, 13 Oct 2020 05:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAF5A20872
	for <linux-usb@archiver.kernel.org>; Tue, 13 Oct 2020 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602566607;
	bh=mF2RifGU2HSc4P/ZFcylpjGU2XmajPAcMoyaCoBT+Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xB7u3MGrDjo1lRxjZ2LI2zVLqgeu1kuYD0LqLMk1kkEefPdUO1FZfoJfZOXhvKxb/
	 4m9ZoBidsCN0nv1fX1QAQ69GE0Y71iZGgd4G3NmeD3Yq4QPzFZw6THLNjfcAtuE1cD
	 Pur4ZfThOWdfp1hr5t+t9lazM9sxQksUn70nUuD8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732396AbgJMFXY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Oct 2020 01:23:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:57828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732320AbgJMFXX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Oct 2020 01:23:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79D3B20872;
        Tue, 13 Oct 2020 05:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602566602;
        bh=mF2RifGU2HSc4P/ZFcylpjGU2XmajPAcMoyaCoBT+Wc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e9kK/ui5/Enhbg56lwOVq75YPQ+z6cRS5+dGwHy/I8KKIOv8yqBenjSsK+fhI54Sh
         0gY30ET/ihQcoV/RVngbdq3RZiDFMSIHJAaAYIfuyTfj8w97F9kmNQeWmAeBYy+kSC
         ldyuEd0/7209U68U2bmKs2tm4CUi7ioPitagkDhY=
Date:   Tue, 13 Oct 2020 07:23:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
        linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about
 find_tt() not returning error
Message-ID: <20201013052317.GB330398@kroah.com>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com>
 <alpine.DEB.2.21.2010121550300.6487@felia>
 <20201012145710.GA631710@rowland.harvard.edu>
 <alpine.DEB.2.21.2010121659040.6487@felia>
 <20201012151816.GA1559916@kroah.com>
 <alpine.DEB.2.21.2010122022250.17866@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010122022250.17866@felia>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 12, 2020 at 08:25:30PM +0200, Lukas Bulwahn wrote:
> 
> 
> On Mon, 12 Oct 2020, Greg Kroah-Hartman wrote:
> 
> > On Mon, Oct 12, 2020 at 05:10:21PM +0200, Lukas Bulwahn wrote:
> > > And for the static analysis finding, we need to find a way to ignore this 
> > > finding without simply ignoring all findings or new findings that just 
> > > look very similar to the original finding, but which are valid.
> > 
> > Then I suggest you fix the tool that "flagged" this, surely this is not
> > the only thing it detected with a test like this, right?
> > 
> > What tool reported this?
> >
> 
> Sudip and I are following on clang analyzer findings.
> 
> On linux-next, there is new build target 'make clang-analyzer' that 
> outputs a bunch of warnings, just as you would expect from such static 
> analysis tools.

Why not fix the things that it finds that are actually issues?  If there
are no actual issues found, then perhaps you should use a better tool?  :)

thanks,

greg k-h
