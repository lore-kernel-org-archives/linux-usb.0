Return-Path: <SRS0=meUh=6O=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDC5C47247
	for <linux-usb@archiver.kernel.org>; Thu, 30 Apr 2020 17:08:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DD0A206C0
	for <linux-usb@archiver.kernel.org>; Thu, 30 Apr 2020 17:08:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aeam.us header.i=@aeam.us header.b="FtxQ7YuV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yJnEIrWB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgD3RIr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 30 Apr 2020 13:08:47 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47155 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725844AbgD3RIq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 13:08:46 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 8B6085C00EA
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 13:08:45 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Thu, 30 Apr 2020 13:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=RynbyX+oVtOY6jz0hhziHw+7GgQkv+5yv9UuwD0t5TA=; b=FtxQ7YuV
        Vm6eADx5dINnEFWHlbBkv4trI3cs9YWlIcpo6XVqI04lx6BZBR8NhIREposJu6Qu
        E73zK20rfclu2M0CcmTtd6Vah/pCRxhBYBx8JTg4wNlfQ9oz4r/DZl7IVbO58qTJ
        +8HlQEG7Y+UQOFPWL2RQob2ptNaaCjgWkrsq13sFk2nXLMRy8wy2GbQhRuszLzhl
        fu09p5BYpry1iFNb+RirxrHohbmNQYsl0vECmQMQ8xuwn0PvUO6xBT6qphcx9aCN
        qKfa3ATwByq2x904C8qYPVl8PNSwg+tkSu7yL1/LrlJ6PiJdyxzc7m6aTRppN949
        q/XLz7tCLmN71w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=RynbyX+oVtOY6jz0hhziHw+7GgQkv
        +5yv9UuwD0t5TA=; b=yJnEIrWB7KEEs6XzJ1VM0BH2vkefryFgmxnV+VKx+CsPq
        Xj6cuWbi5+xZurGLnDCR2ELv89RuujLpwz9XZnI1lSJYEA4y5Och1Kduc0WEEFJq
        BKRJh04NpzRpBdKVqShj3Sc32rKPB2fHVJeRxm5IWulgZ1oUqvk5S0JF8HsW9mIQ
        PmEbVzXVZqFbV1OH20RKKi38rkEnr8KZ8/mObhjRBH8MEJwubBhmmaic46/h2E8+
        Klon8qcoqypaEckCXojCEiBdXFew6bH2Eicn6hLZWn4dibzC1oxC2VA0J7AvbUfZ
        h+Pd5q7NMUfqCMCoBfbdGWXL3XeANV926fGHOpgrw==
X-ME-Sender: <xms:HQarXkEookdbfmzsQkYC9ZXD5RVW-p9y2-Vl3hxWrx44fq30myVHQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieehgddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeeufefgleegleffkeegueegjeekleetfefgueehudfgieetke
    eiheejffefueekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:HQarXnbpbvwfpALwrqOiCoD8MDzwDmClBZzg4PyLAqc2NW1roTGiMQ>
    <xmx:HQarXuDGmyHJrBIfObLgX5BRZzsnWIjlT-lU5RHeRr3Fe3EP_QJbBw>
    <xmx:HQarXnno6Wh7DLAKXeX4MgS4lhBJYx2Sr4B_jQMyYFkaT0OXtMKzBw>
    <xmx:HQarXvvzuufw3ynvQXnMQdrPKXwUQmvooEeUi4R5iOJmbcLp-aeM6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3B01266007E; Thu, 30 Apr 2020 13:08:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
Date:   Thu, 30 Apr 2020 12:08:13 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Documentation for Raw USB ConfigFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, I'm having issues finding good documentation for raw USB configfs. It has reached the point I need to look at developing a new driver, but I'd like my unique endpoint to coexist with a CDC ECM endpoint or similar.

Is there a high level description of this? I can refer to the code but it will be quite slow.

Cheers!

P.S. to be clear I've gotten a lot of good info from https://www.kernel.org/doc/html/latest/usb/index.html.
