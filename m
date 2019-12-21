Return-Path: <SRS0=hlyZ=2L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A09C2D0C0
	for <linux-usb@archiver.kernel.org>; Sat, 21 Dec 2019 15:28:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 177E421D7D
	for <linux-usb@archiver.kernel.org>; Sat, 21 Dec 2019 15:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfLUP2A (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 21 Dec 2019 10:28:00 -0500
Received: from netrider.rowland.org ([192.131.102.5]:53249 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727090AbfLUP2A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Dec 2019 10:28:00 -0500
Received: (qmail 30523 invoked by uid 500); 21 Dec 2019 10:27:59 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Dec 2019 10:27:59 -0500
Date:   Sat, 21 Dec 2019 10:27:58 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Lubomir Rintel <lkundrak@v3.sk>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] USB: EHCI: ehci-mv: make HSIC work
In-Reply-To: <20191221065008.266445-1-lkundrak@v3.sk>
Message-ID: <Pine.LNX.4.44L0.1912211027220.30361-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 21 Dec 2019, Lubomir Rintel wrote:

> please have a look at the three patches chained to this message. They
> are independent of each other and can be applied iny any order.
> 
> My main objective was to make HSIC work on MMP3. The PHY patch is
> loosely related to that (there's no MMP3 HSIC PHY driver, but the NOP
> is sufficient). The last one is a cosmetic thing.
> 
> Compared to first submission, the patches are now submitted as series
> and the wording of the third one's commit message has been changed.

All three patches are okay with me.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

