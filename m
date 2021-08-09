Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC62C4338F
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 10:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C51461076
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 10:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhHIKJY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Aug 2021 06:09:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:54376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233514AbhHIKJW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 06:09:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBB0C6105A;
        Mon,  9 Aug 2021 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628503741;
        bh=wv1MWCXTrK7pk7o2V9bRdLkYI25FXVkGxQlI+D91hqk=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=N7tqlTZHn4YyGXcvylRGw60hwRVWiDqC2ImoFmztIHnsw4A85RwAywGKLZjs0roPd
         W2a3TDy7pUaQnmqIxskCk4QXbhmxvc9Vlpm70EyCGUtDgr3YFvDNVCw9/qyS3VVRiG
         0EvUe59nzf2EEUxa0NRhKVDXcr7Xw6tdpJWVjLYIxt+pNMFBu6iFHolQTWX6hSXnlS
         nM8gvuyzxZuImKvkMHPDC6m3ICx/e71kNuQ3e68nESggURPmnCfZ1KXlLBRmu7zLtf
         ScCgBWvrv8YhaEiILOU6iaelRRc+rsLYhYvflb6rJcnMr/tCZOfiE/wYTWk5kfAKjJ
         Bv+3GH37Ufarw==
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/9] usb: dwc3: meson-g12a: add IRQ check
Date:   Mon, 09 Aug 2021 13:08:43 +0300
In-reply-to: <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
Message-ID: <87zgtrj5fq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_threaded_irq()
> (which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
> an original error code. Stop calling devm_request_threaded_irq() with the
> invalid IRQ #s.
>
> Fixes: f90db10779ad ("usb: dwc3: meson-g12a: Add support for IRQ based OTG switching")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>


-- 
balbi
