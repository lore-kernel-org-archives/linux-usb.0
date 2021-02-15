Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAB8C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 15 Feb 2021 09:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ECAC64E00
	for <linux-usb@archiver.kernel.org>; Mon, 15 Feb 2021 09:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhBOJyD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Feb 2021 04:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhBOJyC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Feb 2021 04:54:02 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959CEC061574
        for <linux-usb@vger.kernel.org>; Mon, 15 Feb 2021 01:53:22 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 129AE1F44C46
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
To:     Paul Wise <pabs3@bonedaddy.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <YAhKAiz2U9KQWQPE@kroah.com>
 <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
 <YB6WKs/6QMWJSS2t@kroah.com>
 <ffd238f1787b8e23f974a220e94aa39eb62b2e60.camel@bonedaddy.net>
 <8f31baea8cad893f416fac972a3a64922c97bcc5.camel@bonedaddy.net>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <e80a776a-5d05-8936-82c9-21180cd87e22@collabora.com>
Date:   Mon, 15 Feb 2021 10:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8f31baea8cad893f416fac972a3a64922c97bcc5.camel@bonedaddy.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 14.02.2021 o 03:17, Paul Wise pisze:
> On Sun, 2021-02-07 at 07:28 +0800, Paul Wise wrote:
> 
>> All the standard benefits of the GitHub organisations feature and
>> collaborative maintenance in general
> 
> Since the linux-usb GitHub organisation isn't yet available for
> collaborative maintenance of Linux userspace USB gadget projects on
> GitHub, we will create a linux-usb-gadgets GitHub organisation and can
> move gadget projects to the linux-usb org when it becomes available.
> 

Any prospects of it "becoming available"?

Andrzej
