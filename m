Return-Path: <SRS0=5Qiu=SY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EB2C282E3
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 02:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 014342075A
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 02:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfDVCoz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 22:44:55 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:42264 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbfDVCoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 22:44:54 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id C2E2D14DA9368;
        Sun, 21 Apr 2019 19:44:53 -0700 (PDT)
Date:   Sun, 21 Apr 2019 19:44:53 -0700 (PDT)
Message-Id: <20190421.194453.2169045719820345607.davem@davemloft.net>
To:     crag0715@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        hayeswang@realtek.com, mario_limonciello@dell.com,
        crag.wang@dell.com, sjg@chromium.org, seanpaul@chromium.org,
        grundler@chromium.org, david.chen7@dell.com, f.fainelli@gmail.com,
        jslaby@suse.cz, gustavo@embeddedor.com,
        charles.hyde@dell.corp-partner.google.com, bigeasy@linutronix.de,
        zhongjiang@huawei.com
Subject: Re: [PATCH v2 1/1] r8152: sync sa_family with the media type of
 network device
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190422022307.19616-1-crag0715@gmail.com>
References: <20190422022307.19616-1-crag0715@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 21 Apr 2019 19:44:54 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190422024453.Jni_WH_l0x9f9YD50CFEBu7sCtrAVapG68ufrOyJup0@z>


Networking driver patches not sent to netdev@vger.kernel.org are very unlikely
to be integrated.

Thank you.
