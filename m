Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D711C433F5
	for <linux-usb@archiver.kernel.org>; Sun,  9 Oct 2022 12:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiJIMRQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 9 Oct 2022 08:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJIMRP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 08:17:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70591ADAF
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 05:17:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3DD90B80D2A
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 12:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14AAC433D6;
        Sun,  9 Oct 2022 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665317830;
        bh=2l/snMEZLRWTCKQOiFRSSjqavZsAU5RCJuat6wqzSO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SdIv/x70yG90H6DPrxyuetSdIAk668o1XFvfw8g/mE8enhm2BsjpkMTIHQlbzKRrk
         2Enpc/wnWGsllYBYBQK+Pj05b02l8jh0RR0PX3hSaGbdLN9BT/Kxazk/K19WA4bNpR
         5xik1bIaq8xcTe2p0WqPJhflf+XWL1Y4nkiICrYHHWBTENH+wgGdIo7sNIptO++prP
         gSAohxdLXeqHy34+cfqgwnyoenEb6r3O+clwB4us50cOSxMP7xVo3f3bE8MyONTdi3
         OBmZRFAj9d0H94oAVEJbAE1ARgSB0dK9WuO8tcETXFNRBTPN3REQ3xHrS88F2V2B3G
         miUpRPQM+9/Sg==
Received: by pali.im (Postfix)
        id 6C7C87C1; Sun,  9 Oct 2022 14:17:07 +0200 (CEST)
Date:   Sun, 9 Oct 2022 14:17:07 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <20221009121707.4o3fjxnec3u4mktz@pali>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-4-pali@kernel.org>
 <Yy7gKiMOtYYiW/oe@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yy7gKiMOtYYiW/oe@kroah.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Saturday 24 September 2022 12:47:06 Greg Kroah-Hartman wrote:
> On Sat, Sep 24, 2022 at 12:27:14PM +0200, Pali Rohár wrote:
> > In preparation for following changes,
> 
> What do you mean by "following changes"?  That doesn't work well when
> looking in a changelog series.  Spell out what you are going to do in a
> future change, as to why this is necessary.
> 
> thanks,
> 
> greg k-h

Ok. Anything else is needed to address?
