Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9A3C433B4
	for <linux-usb@archiver.kernel.org>; Wed,  7 Apr 2021 15:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9788B61262
	for <linux-usb@archiver.kernel.org>; Wed,  7 Apr 2021 15:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbhDGPYY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 7 Apr 2021 11:24:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235931AbhDGPYW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Apr 2021 11:24:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DED461222;
        Wed,  7 Apr 2021 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617809052;
        bh=FOLnPm0gyvercnQZWHqAsrTdWfesr7WCJd/03jlZDP0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HBZ61EHoEkc6TwKrYz7lDcxylcZhpdccxufrAAslZY6nEaWN0o+7Ge2iCwZ/+jXUl
         M2yNNZSEjnH+ASsVayjKWeDzdKZOEt/to9Rf6By60Or3UBn8ZbskBfAZBrr4a7H8hj
         VmroWNhhPYw9QrE5FDQBiLiJfS0ywHTrKoB7OBdc=
Date:   Wed, 7 Apr 2021 17:24:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: io_edgeport: drop unused definitions
Message-ID: <YG3OmhCxtDGI/KmP@kroah.com>
References: <20210407104629.1212-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407104629.1212-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 07, 2021 at 12:46:29PM +0200, Johan Hovold wrote:
> Drop unused definitions relating to a never mainlined custom
> proc-interface and some likewise unused string descriptor definitions.

Oh wow that's some old code.  Sorry for leaving that in there, my fault
:(

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
