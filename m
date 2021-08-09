Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E525C432BE
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 10:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0268F61076
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 10:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234851AbhHIKHv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Aug 2021 06:07:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233165AbhHIKHv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 06:07:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 640546105A;
        Mon,  9 Aug 2021 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628503650;
        bh=NCWH1EaZcFjz+zBT9Wdt9uVmqSXYXVWETuKC/Pp4OyE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=F8LUVrWwNM9MolpbFHk9lHCvLjWgcEeAUaXi1WjRXWIzogRtUcrJx8OH3nGhkiKjf
         tZd7jk0Alwd/1jS5diju8a4VsQqSjNYPee/QLqAr72GnbvixNqxyl41M1ccGYt0Iov
         IPJaqWE2ax18I8NCFaRQ8EuCOeUg7WIrvEshp2nGor422AdD7toVx41MrtIRR6KdGn
         xYWbLdhWJzvgtYzME71GiGw55IrYrD17IMJNhlBt3NtRyMRxHTniq4GAKPwTVdN10V
         FUJau0e5De8wmUyHw5vaDI5ELkkqU4CvrNNGJe6LQi92MWopEMmY4+5kkcvcnATt8y
         MmGh9X6mUe8yQ==
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <563b7c97-4668-3fd4-310b-0a067e805635@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/9] usb: dwc3: qcom: add IRQ check
Date:   Mon, 09 Aug 2021 13:07:06 +0300
In-reply-to: <563b7c97-4668-3fd4-310b-0a067e805635@omp.ru>
Message-ID: <875ywfkk2o.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> In dwc3_qcom_acpi_register_core(), the driver neglects to check the result
> of platform_get_irq()'s call and blithely assigns the negative error codes
> to the allocated child device's IRQ resource and then passing this resource
> to platform_device_add_resources() and later causing dwc3_otg_get_irq() to
> fail anyway.  Stop calling platform_device_add_resources() with the invalid
> IRQ #s, so that there's less complexity in the IRQ error checking.
>
> Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
