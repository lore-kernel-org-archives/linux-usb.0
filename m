Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C445C433FE
	for <linux-usb@archiver.kernel.org>; Tue, 12 Apr 2022 02:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242785AbiDLCQ5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 11 Apr 2022 22:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiDLCQz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 22:16:55 -0400
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 57F8013F70;
        Mon, 11 Apr 2022 19:14:38 -0700 (PDT)
Received: by ajax-webmail-mail-app3 (Coremail) ; Tue, 12 Apr 2022 10:14:34
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.1.189]
Date:   Tue, 12 Apr 2022 10:14:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   "Lin Ma" <linma@zju.edu.cn>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        mdharm-usb@one-eyed-alien.net, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: storage: karma: fix rio_karma_init return
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <YlQ67AgfvMXkUWEZ@rowland.harvard.edu>
References: <20220411060246.9887-1-linma@zju.edu.cn>
 <YlQ67AgfvMXkUWEZ@rowland.harvard.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7fe78961.7c1e.1801b8d1dbd.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: cC_KCgDnHtSK4FRig4TuAQ--.35697W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwQRElNG3GSkJgAEsv
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW5Jw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gQWxhbgoKPiAKPiBBY2tlZC1ieTogQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2
YXJkLmVkdT4KPiAKCkdvdGNoYSwgc29ycnkgYWdhaW4gZm9yIHRoZSBpbmNvbnZlbmllbmNlLgpU
aGUgbmV3IG9uZTogaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtdXNiJm09MTY0OTcyOTU5OTA3
MDQ5Jnc9MgoKUmVnYXJkcwpMaW4gTWE=
