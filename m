Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105A4C433DB
	for <linux-usb@archiver.kernel.org>; Thu, 11 Feb 2021 13:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B010264E9A
	for <linux-usb@archiver.kernel.org>; Thu, 11 Feb 2021 13:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhBKNzf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Feb 2021 08:55:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:38616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232051AbhBKNw4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Feb 2021 08:52:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 607B364E87;
        Thu, 11 Feb 2021 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613051534;
        bh=mx/ir5owcxGhvKP8aEP+Z9CweTjM4sRvImnbrqzIaKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qII+HWhi8xgJ5IlTlO56BXxBwssvfap7hnge/KofbknZ8sD853Wf6dt42Kh5qcB+m
         2fnvunOTGfX2pp/dTMOmkTGu2jqDCWmRgLOkmARhed8XpRn5PFpR6SlbOPocZXl/83
         5tN0jKTpT7SpM1Yd+zEHYM4941nTSYiVB0BjjGK8=
Date:   Thu, 11 Feb 2021 14:52:12 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Amey Narkhede' <ameynarkhede03@gmail.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] staging: gdm724x: Fix DMA from stack
Message-ID: <YCU2jAameAtJ28+G@kroah.com>
References: <20210211053819.34858-1-ameynarkhede03@gmail.com>
 <500e7317567548b48604ed9972062da2@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <500e7317567548b48604ed9972062da2@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 11, 2021 at 01:28:41PM +0000, David Laight wrote:
> > Stack allocated buffers cannot be used for DMA
> > on all architectures so allocate hci_packet buffer
> > using kmalloc.
> 
> I wonder if the usb stack ought/could support a short bounce
> buffer within the memory is already has to allocate?

No.
