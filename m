Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB41C4338F
	for <linux-usb@archiver.kernel.org>; Thu, 12 Aug 2021 05:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47D0260FED
	for <linux-usb@archiver.kernel.org>; Thu, 12 Aug 2021 05:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhHLFjS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 12 Aug 2021 01:39:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234445AbhHLFjR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Aug 2021 01:39:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E498B60F00;
        Thu, 12 Aug 2021 05:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628746733;
        bh=hejqc7dh5wrbDEZ+s9vicbuSdxijhsRpuex7Fb6PQSE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=F+mWnUneaUut6gGPFPd8wHXigUQfNKMtl1jp3HI8vqiwVSvrvq5GcfiaJUZkXoyYe
         NTLq4+SsfogM2xoBiykCd8aTKxTSl+taissXskYnQv6uoJRDtE1qkdxlTXOpT0f9JL
         YuP6pSDMZjZMNT163YKI04A5NEjNQ6+tapvbz9XZJtqgi6UIxMXCetAkUsjyCs4X4v
         WnOkf6y8DtL+ZUjHW5hWaxGoVmNA6hcO8VPVlMktBabrYp3f/EDYn+/ElXjGR4s6aV
         MMa5m7t9EgIgaxRjgzkuEyvxko3H7m7TZMK6rkZloP/7lG6l1OPZn9jaMf3gnWVVYz
         mC3sgNtKT4FVA==
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <b0a86089-8b8b-122e-fd6d-73e8c2304964@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 7/9] usb: phy: fsl-usb: add IRQ check
Date:   Thu, 12 Aug 2021 08:38:35 +0300
In-reply-to: <b0a86089-8b8b-122e-fd6d-73e8c2304964@omp.ru>
Message-ID: <871r6z1aty.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling request_irq() with the invalid IRQ #s.
>
> Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
