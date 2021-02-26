Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CDAC433E0
	for <linux-usb@archiver.kernel.org>; Fri, 26 Feb 2021 19:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C015864E28
	for <linux-usb@archiver.kernel.org>; Fri, 26 Feb 2021 19:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZTgS convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Feb 2021 14:36:18 -0500
Received: from mail.msweet.org ([173.255.209.91]:53066 "EHLO mail.msweet.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhBZTgR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Feb 2021 14:36:17 -0500
X-Greylist: delayed 645 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Feb 2021 14:36:17 EST
Received: from [100.102.51.44] (unknown [67.69.69.155])
        by mail.msweet.org (Postfix) with ESMTPSA id A0E0D80628;
        Fri, 26 Feb 2021 19:24:51 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (1.0)
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb GitHub organisation?
From:   Mike Sweet <msweet@msweet.org>
In-Reply-To: <e6e918148b817e88efff77d3366cde057924fb45.camel@bonedaddy.net>
Date:   Fri, 26 Feb 2021 14:24:50 -0500
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Porter <mporter@kernel.crashing.org>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
Message-Id: <DEA8D27F-3313-4457-A2F8-66B09CF392A7@msweet.org>
References: <e6e918148b817e88efff77d3366cde057924fb45.camel@bonedaddy.net>
To:     Paul Wise <pabs3@bonedaddy.net>
X-Mailer: iPhone Mail (18D52)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Paul, please add me (GitHub user michaelrsweet) - I’m gearing up to work on the USB gadget documentation, with a goal of having it all up-to-date with many examples. Implementing IPP-USB has been an interesting challenge and I feel like I should do something to make the next developer’s life easier...

Sent from my iPhone

> On Feb 25, 2021, at 8:28 AM, Paul Wise <pabs3@bonedaddy.net> wrote:
> 
> ﻿On Sun, 2021-02-14 at 10:17 +0800, Paul Wise wrote:
> 
>> Since the linux-usb GitHub organisation isn't yet available for
>> collaborative maintenance of Linux userspace USB gadget projects on
>> GitHub, we will create a linux-usb-gadgets GitHub organisation and can
>> move gadget projects to the linux-usb org when it becomes available.
> 
> I have now created the linux-usb-gadgets GitHub organisation and
> invited everyone who owns or committed to one of the relevant GitHub
> repositories or otherwise might be interested in participating. If you
> are one of the repository owners, please transfer it to the new org. If
> there is anyone else interested in joining the org, please let us know.
> 
> https://github.com/linux-usb-gadgets
> 
> -- 
> bye,
> pabs
> 
> https://bonedaddy.net/pabs3/

