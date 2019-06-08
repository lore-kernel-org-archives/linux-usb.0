Return-Path: <SRS0=6ExK=UH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D00C28CC5
	for <linux-usb@archiver.kernel.org>; Sat,  8 Jun 2019 13:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D80632168B
	for <linux-usb@archiver.kernel.org>; Sat,  8 Jun 2019 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560001143;
	bh=VAbEjP4WvjehZzX0A1LbZwVIoeCrRPvHqpl8Is6h9fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Y4qLheveDL9nXGQz+vWeZkko2GjCuSFKBy873CGgIYA29p0hVqMuxDrVXIjD7z96y
	 usILJCUn07MaoR+1uWUbLW1FrBOXYFlorQAYaoaN8PSBE79JftDT/nb/7QUq9GbCYP
	 v7dD3GqPlOZSeKjeCgnxNq6cIgPWq3gWw2JNrpAI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfFHNjD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 8 Jun 2019 09:39:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:56000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726861AbfFHNjD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 Jun 2019 09:39:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B004214C6;
        Sat,  8 Jun 2019 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560001142;
        bh=VAbEjP4WvjehZzX0A1LbZwVIoeCrRPvHqpl8Is6h9fM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FvoQGsdIUib7FKs/gk6CMxV1OUmgyRHAFdMpb0G0pk7RZgps1z90Tt/EpqAWcL7Cn
         D6NMgRSihHqxom/bT/3lPQcuRC+hCixSlNJDtiyMuNH6+WTekIPKD6h2+dIOZiKhBR
         d2jER0jZ6byaAQgRIWuyMBvSnhzoiBXmhZD4+qU8=
Date:   Sat, 8 Jun 2019 15:39:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc:     Thomas Winischhofer <thomas@winischhofer.net>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v2] USB: sisusbvga: Remove unneeded variable
Message-ID: <20190608133900.GA11489@kroah.com>
References: <20190607015658.GA4113@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607015658.GA4113@hari-Inspiron-1545>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 07:26:58AM +0530, Hariprasad Kelam wrote:
> fix below warning reported by coccicheck
> 
> drivers/usb/misc/sisusbvga/sisusb.c:1753:5-8: Unneeded variable: "ret".
> Return "0" on line 1877
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> -----
> changes in v2: Change return type of sisusb_set_default_mode from int to void
>                as it never fails.

Please put this information in the changelog as it explains why you are
making this change.  As it is now, the changelog does not reflect what
is really happening here.

thanks,

greg k-h
