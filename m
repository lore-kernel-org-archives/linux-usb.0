Return-Path: <SRS0=fS7H=YY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30554CA9ECB
	for <linux-usb@archiver.kernel.org>; Thu, 31 Oct 2019 14:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A55F20873
	for <linux-usb@archiver.kernel.org>; Thu, 31 Oct 2019 14:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfJaOZh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 31 Oct 2019 10:25:37 -0400
Received: from gloria.sntech.de ([185.11.138.130]:38412 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727720AbfJaOZh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Oct 2019 10:25:37 -0400
Received: from dhcp-64-28.ens-lyon.fr ([140.77.64.28] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1iQBOJ-0005ps-7A; Thu, 31 Oct 2019 15:25:35 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, robin.murphy@arm.com
Subject: Re: [PATCH 2/5] dt-bindings: clean up rockchip grf binding document
Date:   Thu, 31 Oct 2019 15:25:34 +0100
Message-ID: <1871898.EhJZENLof5@phil>
In-Reply-To: <20191028182254.30739-3-pgwipeout@gmail.com>
References: <20191028182254.30739-1-pgwipeout@gmail.com> <20191028182254.30739-3-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, 28. Oktober 2019, 19:22:51 CET schrieb Peter Geis:
> Fixup some typos and inconsistencies in the grf binding.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>

applied for 5.5

Thanks
Heiko


