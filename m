Return-Path: <SRS0=pmyG=EJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22464C388F7
	for <linux-usb@archiver.kernel.org>; Tue,  3 Nov 2020 21:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8E43223C7
	for <linux-usb@archiver.kernel.org>; Tue,  3 Nov 2020 21:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387573AbgKCVCH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 Nov 2020 16:02:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:35726 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387562AbgKCVCG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 16:02:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6B2C8ACD9;
        Tue,  3 Nov 2020 21:02:05 +0000 (UTC)
Date:   Tue, 3 Nov 2020 12:40:14 -0800
From:   Davidlohr Bueso <dave@stgolabs.net>
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Davidlohr Bueso <dbueso@suse.de>
Subject: Re: [PATCH] usb/mos7720: process deferred urbs in a workqueue
Message-ID: <20201103204014.3ue37owcras6cx7p@linux-p48b.lan>
References: <20201102211450.5722-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201102211450.5722-1-dave@stgolabs.net>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 02 Nov 2020, Bueso wrote:

>There is
>also no need anymore for atomic allocations.

Bleh this is a brain fart - obviously not true as usb_submit_urb() is
called under mos_parport->listlock. I'll send a v2 unless you have
any objections.

Thanks,
Davidlohr
