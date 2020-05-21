Return-Path: <SRS0=4PAV=7D=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E36C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 21 May 2020 19:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D0820823
	for <linux-usb@archiver.kernel.org>; Thu, 21 May 2020 19:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbgEUTuq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 May 2020 15:50:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:41414 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729845AbgEUTuq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 May 2020 15:50:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7A21AAEB1;
        Thu, 21 May 2020 19:50:47 +0000 (UTC)
Message-ID: <1590090636.6470.12.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg KH <greg@kroah.com>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
Date:   Thu, 21 May 2020 21:50:36 +0200
In-Reply-To: <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
         <20200521073323.GA2579717@kroah.com>
         <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 21.05.2020, 19:01 +0900 schrieb Tetsuo Handa:
> 


Hi,

interesting. Do you have a test case for these patches working?

> 	wait_event(desc->wait,
> 			/*
> 			 * needs both flags. We cannot do with one
> 			 * because resetting it would cause a race
> 			 * with write() yet we need to signal
> 			 * a disconnect
> 			 */
> 			!test_bit(WDM_IN_USE, &desc->flags) ||
> 			test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> but wdm_write() is not calling wake_up(&desc->wait) after
> clear_bit(WDM_IN_USE, &desc->flags) when usb_submit_urb() failed.

Yes, because desc->wlock is held. There can be nobody sleeping here.

> > And is this a bugfix?  For what?  Does it need to go to stable kernels?
> 
> Potential bugfix. syzbot is reporting two bugs that hung at wdm_flush(),
> but I think that this patch won't fix these bugs. Therefore, I don't think
> this patch needs to go to stable kernels.

Do you have links for them?

	Regards
		Oliver

