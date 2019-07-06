Return-Path: <SRS0=/GjO=VD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F314C5B578
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 04:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D4632089C
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 04:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562388392;
	bh=UKJM2s2m0IkCm43Q79uIYzN9JNIBrNFCcF8A3ZxKZBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=i+vmwflFkAScgb4OvZSR6lhFWYxLhJ8SGqGA3hc2RPj1UGLQ3/68siHZEs/CG9Chu
	 RuhHcMHMBZmrwKjn6Vnc6KN1SKH7Gsy5F0lo7KubfZVpxHnlNGGBOSPmOGTKgPWsml
	 +Pfl5Faw6djtxFJcRF8BwBmVI0mVrsFYQay+LRvc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfGFEqb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 6 Jul 2019 00:46:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:56758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfGFEqb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Jul 2019 00:46:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19FB92089C;
        Sat,  6 Jul 2019 04:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562388390;
        bh=UKJM2s2m0IkCm43Q79uIYzN9JNIBrNFCcF8A3ZxKZBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ns11N48ylwBVAt6EIdbPGBSzxhNAuS91L+huu5o4Qqee3Hwza14TLY4G7hefrS/bz
         vSV1PkD37W7xxacAJ+Z6bmskggnScxl59CsymjNirxeObt9TzY79v4Sb5AMR5kZeWg
         SIlSmRqvBrb1p5uZ0iZ4RgFM257fek9cdtXyzVTk=
Date:   Sat, 6 Jul 2019 06:46:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yunhua li <yunhual@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Per USB device interrupt handler for xhci
Message-ID: <20190706044627.GA21685@kroah.com>
References: <CAMqbrUg3bz=i8nh4W2-NWOsnQdqcaB3nvZnMJQ1sGXuD0ogk7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMqbrUg3bz=i8nh4W2-NWOsnQdqcaB3nvZnMJQ1sGXuD0ogk7Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 05, 2019 at 07:50:28PM -0700, yunhua li wrote:
> Hi  all
> 
> xhci_msi_irq is the interrupt handler for xhci, the controller it self
> is a PCI device, on my system it is a Intel chip. I have multiple USB
> device connect to this USB host controller,  xhci_msi_irq is interrupt
> handler for the PCI device(USB Host controller).
> Is it possible to have multiple IRQ, and different IRQ for different
> USB device?

Nope.  That is not how USB works.  Please read the xhci spec if you are
curious as to why.

greg k-h
