Return-Path: <SRS0=1t+K=YK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826A8CA58F0
	for <linux-usb@archiver.kernel.org>; Thu, 17 Oct 2019 22:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51CCD21D80
	for <linux-usb@archiver.kernel.org>; Thu, 17 Oct 2019 22:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441676AbfJQWbt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Oct 2019 18:31:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51075 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732705AbfJQWbt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 18:31:49 -0400
Received: (qmail 4223 invoked by uid 500); 17 Oct 2019 18:31:48 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Oct 2019 18:31:48 -0400
Date:   Thu, 17 Oct 2019 18:31:48 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Benedikt Schemmer <ben@besd.de>
cc:     linux-usb@vger.kernel.org
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
In-Reply-To: <36985a59-18fd-88c9-0f1e-0b356ba041e8@besd.de>
Message-ID: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 17 Oct 2019, Benedikt Schemmer wrote:

> Hi all,
> 
> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
> with the 5.3 series up to 5.3.6

Can you use git bisect to track the problem down to a particular commit?

Alan Stern

