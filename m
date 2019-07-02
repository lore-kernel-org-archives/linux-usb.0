Return-Path: <SRS0=rQJG=U7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72657C5B57D
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jul 2019 07:34:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3954B21721
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jul 2019 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562052876;
	bh=I5mOE9z7SKYHS5DivlDPVK3C2+Ilib0m4caLFO2DRkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LfS2NI5gE8GXPUYhPCxx6DrpBhEQaAR9m6eYzpGllVnbU9NITN5nGFAUh7GrYU13A
	 KDinG8PncNlB94UDJkuQzDowhy3BYZn812biA5bPK3A/m2bZHBSnr4IljU9dygIBTL
	 L300pj0R+j74tjDiKstbw31GpJFSb+j+yl+TbmzY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfGBHef (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Jul 2019 03:34:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfGBHef (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 03:34:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E120206A2;
        Tue,  2 Jul 2019 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562052874;
        bh=I5mOE9z7SKYHS5DivlDPVK3C2+Ilib0m4caLFO2DRkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cf0ZlK7R56digzpSGkc8d/s6Ma9J00rvVDinkRNwWrzbitn7004dLNziS91glrQmC
         +IJtKK4ftJw4z5ex+N2Ko2LBCTX96fyQOzcfq9ukFV0wScNb2tvfevgF2qUtxTXGGC
         r7g0MaW6b3baDpvfBMdgfpvRs1Y3jFrjyP6lBwR8=
Date:   Tue, 2 Jul 2019 09:34:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        usb-storage@lists.one-eyed-alien.net, oneukum@suse.com
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
Message-ID: <20190702073432.GA9265@kroah.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
 <20190701085248.GA28681@kroah.com>
 <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
 <20190702044249.GA694@kroah.com>
 <f6ed2505-5da9-c217-a052-a19d197c5c8e@nvidia.com>
 <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 02:56:25PM +0800, JC Kuo wrote:
> -----------------------------------------------------------------------------------
> This email message is for the sole use of the intended recipient(s) and may contain
> confidential information.  Any unauthorized review, use, disclosure or distribution
> is prohibited.  If you are not the intended recipient, please contact the sender by
> reply email and destroy all copies of the original message.
> -----------------------------------------------------------------------------------

Footers like this are not allowed on public mailing lists, and forbid me
to respond to...
