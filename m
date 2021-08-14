Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF0C4338F
	for <linux-usb@archiver.kernel.org>; Sat, 14 Aug 2021 11:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0A9603E7
	for <linux-usb@archiver.kernel.org>; Sat, 14 Aug 2021 11:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238053AbhHNL3Q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 14 Aug 2021 07:29:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:34412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237914AbhHNL3P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Aug 2021 07:29:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B54C760E93;
        Sat, 14 Aug 2021 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628940527;
        bh=hdyfiyeO1QjKNM+FvHEQGphriAD3LZRcH9f9tz6v6fg=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=JnsTG7aC0k9taXiYG6SXnZA0CYfZmkZUzz1x58/hvrRehsdCXvRjJr8wSPMHvOgLa
         RU+7a0hlFXsqO4z5GSi2s64jWvJZzaZSQGHOgYzWvLGg88sZj2v5DjGskTRzUPB8Z8
         fDrKwDnl5SAX0tCWP9SjrNDxoihk70eVDWJx6l9sZNbTr/kboqP5K4VRRBgZr8wNdL
         0NVL0nUHlPkA/hf426slH0EFJr7AQDybPCE0K4y3MEnO4StoTQ+H7LBDp8FPygvqw+
         yJub0tE5eS3sD0aCDgZSC3MOmunKaXYsT6L74oN3Bt3U6Oq8HTO9U8SzO8D5Ud6KWb
         1kRUXM1XLpSVA==
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
 <8280d6a4-8e9a-7cfe-1aa9-db586dc9afdf@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/2] usb: phy: tahvo: add IRQ check
Date:   Sat, 14 Aug 2021 14:28:27 +0300
In-reply-to: <8280d6a4-8e9a-7cfe-1aa9-db586dc9afdf@omp.ru>
Message-ID: <878s14jmdv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_threaded_irq() (which
> takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an
> original error code.  Stop calling request_threaded_irq() with the invalid
> IRQ #s.
>
> Fixes: 9ba96ae5074c ("usb: omap1: Tahvo USB transceiver driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
