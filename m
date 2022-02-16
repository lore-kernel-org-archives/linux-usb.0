Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3263DC433F5
	for <linux-usb@archiver.kernel.org>; Wed, 16 Feb 2022 10:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiBPKlC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Feb 2022 05:41:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiBPKlB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 05:41:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCF92BA291
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 02:40:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D4EE0B81E6A
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 10:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00664C340E8;
        Wed, 16 Feb 2022 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645008047;
        bh=lfluWBVYKSqFRvt2chRotIgVABEx5pWNMhTy16G7eH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Exqw5wmaOiKmxDRvXfuDVoj0vDHtlKJx3Xg50QwQrcy3q9+eA4Mk1mxl1qSEWQaDd
         GQNy+vKJSbmJzdXBNk/MGdnaXH3tss4Ac9+ztXg/Q6dV8an2tpeXANDhFX0FoeOJ/b
         zsYZuWS+JxKye419SE5t3qKkbed9h821bhEqoojs=
Date:   Wed, 16 Feb 2022 11:40:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci: make 'usec' parameter of
 xhci_handshake() *unsigned*
Message-ID: <YgzUrP06/tdiquXg@kroah.com>
References: <e8e27f4c-489e-08c2-7495-7bfe07bf6f97@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8e27f4c-489e-08c2-7495-7bfe07bf6f97@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 15, 2022 at 11:09:21PM +0300, Sergey Shtylyov wrote:
> The negative timeouts hardly make sense, and the 'usec' parameter of
> xhci_handshake() gets assigned to a 'u64' typed local variable in
> readl_poll_timeout_atomic() anyways...

Then why not just make it a u64 instead of a unsigned int?

thanks,

greg k-h
