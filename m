Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AF5C6FD19
	for <linux-usb@archiver.kernel.org>; Fri, 10 Mar 2023 09:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbjCJJzU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 10 Mar 2023 04:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbjCJJzR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 04:55:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C5A104911
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 01:55:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5DDA8B821FA
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 09:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A8DC4339B;
        Fri, 10 Mar 2023 09:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678442110;
        bh=p96ayqLfkZkPv0cnPEFyVaVzGp+Y52iuPHw6u4pbdKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2rHVLhT8rK3nPBsOspn4VvqanZc+b9+nY8BCA3DQQKaRo0ZBNNEbItHqzMzVy1z8I
         ndvRJJ1Qo2tO0zirp6sj+Sq/G3chjffviqBC2whQ6cbjeOEHHSHvS8l/2PpdVd+sXq
         Kr0MjgSR6e7+PJZNjc/llRhZoJ/oCbtWA8WvYttU=
Date:   Fri, 10 Mar 2023 10:55:06 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Message-ID: <ZAr+eiTrUN/LV3YN@kroah.com>
References: <c52296b791b4c7ba6661226e2e5dfaa678663c78.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c52296b791b4c7ba6661226e2e5dfaa678663c78.camel@infinera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 10, 2023 at 09:44:26AM +0000, Joakim Tjernlund wrote:
> The old RNDIS/NCM configs does not work against modern Windows. I wonder if there
> should/could be updated to working state ?

Please never use RNDIS on modern systems unless you fully trust the
"other side" of the connection as it is not a secure protocol by any
means.

NCM should "just work" instead.  What exactly is failing, and what
specifically do you mean by "modern Windows"?

thanks,

greg k-h
