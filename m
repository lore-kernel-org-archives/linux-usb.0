Return-Path: <SRS0=crsa=4L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B7EC35671
	for <linux-usb@archiver.kernel.org>; Sun, 23 Feb 2020 10:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AE6D208C4
	for <linux-usb@archiver.kernel.org>; Sun, 23 Feb 2020 10:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgBWKGp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 23 Feb 2020 05:06:45 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55489 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWKGp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 05:06:45 -0500
X-Originating-IP: 81.6.44.130
Received: from [172.22.0.20] (unknown [81.6.44.130])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2A02840004;
        Sun, 23 Feb 2020 10:06:42 +0000 (UTC)
Subject: Re: [PATCH] ch341: Replace memory allocations with stack storage
To:     Greg KH <greg@kroah.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
References: <bdf7db0e0e133f55ac81d39ce9564653e0b5d9ed.1582312740.git.public@hansmi.ch>
 <20200223100211.GC120495@kroah.com>
From:   Michael Hanselmann <public@hansmi.ch>
X-Hello-World:  This header intentionally left blank
Message-ID: <0e524197-673e-5c07-950a-d2aaea73c964@msgid.hansmi.ch>
Date:   Sun, 23 Feb 2020 11:06:42 +0100
MIME-Version: 1.0
In-Reply-To: <20200223100211.GC120495@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.02.20 11:02, Greg KH wrote:
> You should have gotten a runtime error with this change if you tested
> it.  Did that not happen somehow?
> 
> As Johan said, all USB data has to be dynamically allocated.
I just tried again and now I'm getting one: "transfer buffer is on
stack". Clearly something went wrong when I tried the change--in all
likelyhook my test environment was using an old build.

I'm sorry for not noticing/testing properly before sending.

Michael
