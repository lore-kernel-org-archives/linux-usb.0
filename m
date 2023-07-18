Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CEFEB64DC
	for <linux-usb@archiver.kernel.org>; Tue, 18 Jul 2023 12:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjGRM1d (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Jul 2023 08:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjGRM1d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 08:27:33 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C00C1701
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 05:27:26 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87D8740019;
        Tue, 18 Jul 2023 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1689683245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f6xThtoI74+33Y4055B7f1d7kS0rFeuCMzbcqIuEbDo=;
        b=EOF3082Xa0HR7RXXd9pSTh4w4sm808TojoyNjFqjvZfq8dN8mN+Mu812PngvcDmV1NI6rD
        wL8j2wC3K3EzU1auXyGb0q3rpymZ8LpEU/0Mk1fWjoKA26oUg7d7tqhQDV34YRV6eQ2s9P
        AGBGRONDUOs4EfoW2nYptwIZH5oC+YKEe0/1uQOKxhFCMUCLeyEmzAyaXXfXyATPcyGUIF
        PaO8KIhnhW9G8DrTQPxiyNXZFTv0wgaMHnGn/7nhaVa/a7wUKrcdjNRvU+Lw5IkawaS8K1
        Jzg7pUJ6gyTgWErKTIyV5BhECfb0kSBFDvkqZ3JFDjFF0qsxLZYOeOjeapmJRw==
Date:   Tue, 18 Jul 2023 14:27:22 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, balbi@ti.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH 1/3] usb: chipidea: add USB PHY event
Message-ID: <20230718142722.53cc9135@booty>
In-Reply-To: <20230627110353.1879477-1-xu.yang_2@nxp.com>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Xu,

On Tue, 27 Jun 2023 19:03:51 +0800
Xu Yang <xu.yang_2@nxp.com> wrote:

> Add USB PHY event for below situation:
> - usb role changed
> - vbus connect
> - vbus disconnect
> - gadget driver is enumerated
> 
> USB PHY driver can get the last event after above situation occurs
> and deal with different situations.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

I tested this patchset on top of v6.5-rc2 and USB detection
is still broken on the Colibri iMX6ULL. With or without the patches
the behavior is the same: USB devices are detected only during boot,
and anything connected after boot is never detected.

Is there anything I can test for you do understand what's going wrong
here?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
