Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816E7C1B08C
	for <linux-usb@archiver.kernel.org>; Thu, 15 Jul 2021 04:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 684C561370
	for <linux-usb@archiver.kernel.org>; Thu, 15 Jul 2021 04:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236591AbhGOEbp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Jul 2021 00:31:45 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:34522 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231979AbhGOEbm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jul 2021 00:31:42 -0400
X-UUID: 6a5194aa3284485ba1add1daf7b6ab64-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=FlJW4bMYIdDzSfoxFCdD9ZdvL9adkU6NtqycME8tAaU=;
        b=hZYdqdv6jWmqityXaKrWkMiyxbB36kYRbxOfsXEJrdKZriw4e988BX/3grOIgjMpW+uDOOtqIjLuKnvTJkcB9x5WlyUgUhsSUc0t1uIW+ofG/27MutZPoLMhjJZu2656XoAEIlTIBSwtt81xq1P2crgofiGaVdkfuLd1I1SNdWw=;
X-UUID: 6a5194aa3284485ba1add1daf7b6ab64-20210715
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1326285351; Thu, 15 Jul 2021 12:28:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 12:28:39 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 12:28:39 +0800
Message-ID: <1626323319.18118.17.camel@mtkswgap22>
Subject: Fix: Please help to cherry-pick patch "bdi: Do not use freezable
 workqueue" to stable tree
From:   Macpaul Lin <macpaul.lin@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-stable <stable@vger.kernel.org>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ainge Hsu <ainge.hsu@mediatek.com>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Macpaul Lin <macpaul.lin@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Jens Axboe <axboe@kernel.dk>,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Date:   Thu, 15 Jul 2021 12:28:39 +0800
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RGVhciBHcmVnLA0KDQpPdXIgY3VzdG9tZXJzIGhhdmUgZmVlZGJhY2sgc29tZSBzaW1pbGFyIGlz
c3VlcyBhcyBiZWxvdyBsaW5rIG9uIEFuZHJvaWQNCmtlcm5lbC00LjE0IGFuZCBrZXJuZWwtNC4x
OS4NCiAgTGluazogaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgta2VybmVsJm09MTM4Njk1Njk4
NTE2NDg3DQoNClRoZXkndmUgcmVwb3J0ZWQgc3lzdGVtIGJlY29tZSBhYm5vcm1hbCB3aGVuIE9U
RyBVLWRpc2sgaGFzIGJlZW4gcGx1Z2dlZA0Kb3V0IGFmdGVyIHRoZSBzeXN0ZW0gaGFzIGJlZW4g
c3VzcGVuZGVkLg0KQWZ0ZXIgZGVidWdnaW5nLCB3ZSd2ZSBmb3VuZCB0aGUgcm9vdCBjYXVzZSBp
cyB0aGUgc2FtZSBvZiB0aGUgaXNzdWUNCihsaW5rKSBoYXMgYmVlbiByZXBvcnRlZC4gV2UndmUg
YWxzbyB0ZXN0ZWQgdGhlIHBhdGNoICJiZGk6IERvIG5vdCB1c2UNCmZyZWV6YWJsZSB3b3JrcXVl
dWUiIGlzIHdvcmtlZC4NCiAgTGluazogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMTAvNC8x
NzYNCiAgY29tbWl0IGlkIGluIExpbnVzIHRyZWU6IGEyYjkwZjExMjE3NzkwZWMwOTY0YmE5Yzkz
YTRhYmIzNjk3NThjMjYNCg0KSG93ZXZlciwgd2UndmUgY2hlY2tlZCB0aGF0IHBhdGNoIHNlZW1z
IGhhc24ndCBiZWVuIGFwcGxpZWQgdG8gc3RhYmxlDQp0cmVlIChXZSd2ZSBjaGVja2VkIDQuMTQg
YW5kIDQuMTkpLiBXb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gY2hlcnJ5LXBpY2sNCnRoaXMgcGF0
Y2ggdG8gc3RhYmxlIHRyZWVzIChhbmQgdG8gQW5kcm9pZCB0cmVlcyk/DQoNClRoYW5rcyENCk1h
Y3BhdWwgTGluDQo=

