Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BD8C433FE
	for <linux-usb@archiver.kernel.org>; Fri, 21 Oct 2022 04:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJUEk7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJUEk5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 00:40:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56771DDDEB
        for <linux-usb@vger.kernel.org>; Thu, 20 Oct 2022 21:40:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B52EB82A08
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CA3C433D7;
        Fri, 21 Oct 2022 04:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666327254;
        bh=0eiYWmDu6nuDRvo9XGqtuKnParAVTDfBMQaO7UlTG7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V4eu3tfHjpB7PIZTQYrHY/P01rLea2AGPNnPWID3sKPaigeZJrh3WDz3/xsic25Y4
         obmv+pbGOk/+g8+BWJsQ5d+P1CwoR1N3Ug4bH4WpHrQxkxEXcUET9g7wDRNv8K3f3W
         lCjzfyRn9drV2cc277Ra/qN8HaO7duoKDLa26ovo=
Date:   Fri, 21 Oct 2022 06:41:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chuck Evans <crtigermoth@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Hp A10 has broken [AMD] FCH USB XHCI controller, UAS errors,
 please blacklist
Message-ID: <Y1IjByxvuX3Nx0Et@kroah.com>
References: <CAGedn0=nwQwmzTJqY8KXVQ_AGCGE9Dm8vjgoX_7JAKyaoCUzdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGedn0=nwQwmzTJqY8KXVQ_AGCGE9Dm8vjgoX_7JAKyaoCUzdQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 20, 2022 at 05:39:04PM -0400, Chuck Evans wrote:
> Hp A10 has broken
> "[AMD] FCH USB XHCI controller (rev 03)"
> Uas driver throws constant errors on writes.
> I have a Plugable brand sata dock with its own power that wrote 300000
> files to an SSD without error on a ryzen system, but won't write 10
> files on an HP A10 without a reset from UAS.
> 
> I have tested several A10 systems and several other USB SATA adapters
> and a WD Black game drive SSD and all have the same problem.
> 
> Also queue_length cannot be changed, the USB driver makes that setting
> read only, normally it is writable.
> 
> Please fix this and blacklist the AMD controller for UAS.

Can you provide us some mroe information?  Like what device exactly this
is (output of lsusb), and what options you tried?  Can you make a patch
to fix this?

thanks,

greg k-h
