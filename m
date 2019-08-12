Return-Path: <SRS0=3CwD=WI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C75C31E40
	for <linux-usb@archiver.kernel.org>; Mon, 12 Aug 2019 08:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 393B5206C2
	for <linux-usb@archiver.kernel.org>; Mon, 12 Aug 2019 08:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfHLITw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Aug 2019 04:19:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:44334 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727079AbfHLITw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Aug 2019 04:19:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9B5AFAE34;
        Mon, 12 Aug 2019 08:19:51 +0000 (UTC)
Message-ID: <1565597989.14671.3.camel@suse.com>
Subject: Re: [PATCH] xhci: wait CNR when doing xhci resume
From:   Oliver Neukum <oneukum@suse.com>
To:     Rick Tseng <rtseng@nvidia.com>, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 12 Aug 2019 10:19:49 +0200
In-Reply-To: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
References: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 12.08.2019, 15:24 +0800 schrieb Rick Tseng:
> From: Rick <rtseng@nvidia.com>
> 
> NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
> Thus we need to wait CNR bit to clear when xhci resmue as xhci init.

Should any controller have CNR set? Why is this specific to a vendor?

	Regards
		Oliver

