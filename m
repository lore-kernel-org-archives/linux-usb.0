Return-Path: <SRS0=WR2x=EM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197C7C388F2
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 07:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B57B5208FE
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604646272;
	bh=Q6YHNselajLVgVIOyZfpWCktbPPS2vgpXVESf/eQE0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q2hH68J0CbfWeXXYB8zep58SqPOebjk6LpPYZTiYTvlparNIHa1KuN1h6B4IK5hMC
	 LEJC5ACUE9LEa2J8kZtUzfIvukTp4nD5M+W8sum9iyWpiFWZ+AgR1JafXrs1flM7R4
	 ztrZVbd1KeP+8mlo/jTE8YJLb2xDBBv1GKNyX/Kc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgKFHE3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Nov 2020 02:04:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:42202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgKFHE2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 02:04:28 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF8D6206F4;
        Fri,  6 Nov 2020 07:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604646268;
        bh=Q6YHNselajLVgVIOyZfpWCktbPPS2vgpXVESf/eQE0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qCwQ3zhJof5EuJa2vzpXXKSp2L9onHMaG7LljxOA4p7skJ7OqbkkWOEvZzA8Jykl5
         d/6e+2BdGUYudoEgPXldUxulIW7j1QaYwAzVuZKOkjVwKNfuDgiQqUH5cdUUtV1mMH
         y4KNra6a/S8oGA7sPqurjCwRONWVDl49I0Pb5aTk=
Date:   Fri, 6 Nov 2020 08:05:14 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Tim Li <tim.li@dji.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Question: gadget: How to realize uvc and uac composite function?
Message-ID: <20201106070514.GA2611613@kroah.com>
References: <88a893988a394591968b139dcc750a2f@MAIL-MBX-cwP02.dji.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88a893988a394591968b139dcc750a2f@MAIL-MBX-cwP02.dji.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 06, 2020 at 04:33:13AM +0000, Tim Li wrote:
> This email and any attachments thereto may contain private, confidential, and privileged material for the sole use of the intended recipient. Any review, copying, or distribution of this email (or any attachments thereto) by others is strictly prohibited. If you are not the intended recipient, please contact the sender immediately and permanently delete the original and any copies of this email and any attachments thereto.

This footer is not compatible with posting on a public Linux mailing
list, sorry.  Now deleted...
