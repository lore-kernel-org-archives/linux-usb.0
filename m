Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D3BECAAD8
	for <linux-usb@archiver.kernel.org>; Tue, 20 Sep 2022 16:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbiITQQY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Sep 2022 12:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiITQQW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Sep 2022 12:16:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86BB5D133;
        Tue, 20 Sep 2022 09:16:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6FC13B81EBE;
        Tue, 20 Sep 2022 16:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C43C433D7;
        Tue, 20 Sep 2022 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663690579;
        bh=BIWGlv9fTdZY9w/qXyLCPnM9+g1DdLRMHLwnKSLT+qM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xfI/yUZxQQovCR1SCHX/rh7Gllqk5Cn8/H/Vghi/HRYhyYwt5YX/qgqf18V7iZ4Cf
         s7SVTuwIL97mnxekClBLxdRzV2k1E1I2oPCuxltviMGEDmvBXBoNJnlc8K1BWlqrDt
         gllx2zzj1SJcdEfYQr2fpJSypnLaxBtE6jkR/Rlw=
Date:   Tue, 20 Sep 2022 18:16:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rondreis <linhaoguo86@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        johan@kernel.org
Subject: Re: KASAN: use-after-free Write in keyspan_close
Message-ID: <YynnT7/mnzJVn7iz@kroah.com>
References: <CAB7eexKhQeqgpMaZoT=JD2EMwn=qTw4sWzF7hdU9XDFVsz3ooA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB7eexKhQeqgpMaZoT=JD2EMwn=qTw4sWzF7hdU9XDFVsz3ooA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 20, 2022 at 10:47:37PM +0800, Rondreis wrote:
> Hello,
> 
> When fuzzing the Linux kernel driver v6.0-rc6, the following crash was
> triggered.
> 
> HEAD commit: 521a547ced6477c54b4b0cc206000406c221b4d6
> git tree: upstream
> 
> kernel config: https://pastebin.com/raw/hekxU61F
> console output: https://pastebin.com/raw/gvADdA0t
> 
> Sorry for failing to extract the reproducer. But on other versions of
> Linux, I also triggered this crash.
> 
> I would appreciate it if you have any idea how to solve this bug.

Are you hitting this with a real keyspan device, or is this a "fake"
one?

if a fake one, what type of fake data are you sending the driver?  Are
the configuration options correct, and you are giving it bad data, or
something else?

Fuzzing on invalid USB data for drivers is the next "boundry" to start
working on, so far we have only handed invalid configuration information
fairly well, so patches to work on this next layer are always
appreciated if you consider USB data to now be considered "hostile" and
not trustable.

thanks,

greg k-h
