Return-Path: <SRS0=5EKS=A7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95ECDC433E1
	for <linux-usb@archiver.kernel.org>; Mon, 20 Jul 2020 12:43:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BDD42070A
	for <linux-usb@archiver.kernel.org>; Mon, 20 Jul 2020 12:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgGTMnJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 20 Jul 2020 08:43:09 -0400
Received: from mailbackend.panix.com ([166.84.1.89]:16548 "EHLO
        mailbackend.panix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbgGTMnI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 08:43:08 -0400
Received: from xps-7390 (cpe-23-242-39-94.socal.res.rr.com [23.242.39.94])
        by mailbackend.panix.com (Postfix) with ESMTPSA id 4B9Lx71FPnzbx6;
        Mon, 20 Jul 2020 08:43:07 -0400 (EDT)
Date:   Mon, 20 Jul 2020 05:43:05 -0700 (PDT)
From:   "Kenneth R. Crudup" <kenny@panix.com>
Reply-To: "Kenneth R. Crudup" <kenny@panix.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: I get a new Thunderbolt domain UUID on every boot
In-Reply-To: <20200720100723.GW5180@lahna.fi.intel.com>
Message-ID: <alpine.DEB.2.23.453.2007200527070.3171@xps-7390>
References: <alpine.DEB.2.23.453.2007051446170.4280@xps-7390> <20200720100723.GW5180@lahna.fi.intel.com>
User-Agent: Alpine 2.23 (DEB 453 2020-06-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Thank you for getting back to me.

On Mon, 20 Jul 2020, Mika Westerberg wrote:

> It is done on purpose. The BIOS generates new UUID every boot.

I see. This leads to a couple of follow-on questions, then:

There are two "competing" Linux packages for controlling/admining TB,
"bolt" (which includes "boltctl") and "thunderbolt-tools" (which includes
"tbtadm". I used to have both installed but I think they sometimes get
in each other's way and settled on "thunderbolt-tools" as "bolt" was
leaving large numbers of UUID-related files over time.

- Do you have a preference for either?

I've noticed that I can't seem to get IOMMU protection unless I boot
with Secure Boot on in my BIOS (which I never use, as I don't sign my
own kernels). IOMMU/DMAR is on in my kernel.

- Is there any way to force this, or is this expected? I don't get the
"iommu_dma_protection" set on my controllers either.

Finally, every now and then on a reboot, my TB dock "flaps" (repeatedly
connects and disconnects) and I have to either connect/reconnect the TB3
cable, or initate a power-off. I suspect this is a BIOS bug (I also have
to set "intel_iommu=igfx_off" otherwise I get "DMA Hardware is malfunctioning"
errors on power-down (or hibernate)).

- Have you seen this before or have any ideas?

Thanks,

	-Kenny

-- 
Kenneth R. Crudup  Sr. SW Engineer, Scott County Consulting, Orange County CA
