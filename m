Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F27EB64DA
	for <linux-usb@archiver.kernel.org>; Wed, 19 Jul 2023 13:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjGSNa1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 19 Jul 2023 09:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjGSNa0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jul 2023 09:30:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F616113
        for <linux-usb@vger.kernel.org>; Wed, 19 Jul 2023 06:30:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B577A611F9
        for <linux-usb@vger.kernel.org>; Wed, 19 Jul 2023 13:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6251EC433C7;
        Wed, 19 Jul 2023 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689773425;
        bh=B7/5iyZ0y/e4VOwHFSGjbNgKfybtJIiXA1L10GXy4Mc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DZQcm6t0REYndsrHLGE7xptauUUk2u3tEwyp1976zsyT4N1eMfG03uj8eK+0v7dF8
         CJGxvdvokqExoVCFwV9MZUd33sQcEry9y57mUIMTJKy/0vMECtTwKct9YDX57bvJKK
         iEkCRUjXBr+5zvyJGR35bluE3r+hNqcWUmW25UwQ=
Date:   Wed, 19 Jul 2023 15:30:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: question on sturuct xhci_hcd::priv
Message-ID: <2023071907-disprove-unblessed-a303@gregkh>
References: <241c5df6-6888-0d6d-dbf7-900cfcc6b115@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <241c5df6-6888-0d6d-dbf7-900cfcc6b115@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 19, 2023 at 12:51:22PM +0200, Oliver Neukum wrote:
> Hi,
> 
> it looks to me like the priv member of struct xhci_hcd
> is used only to hold struct xhci_plat_priv. Is that sensible?
> Should struct xhci_plat_priv be integrated into struct xhci_hcd?

Sure, try it and see what happens!

greg k-h
