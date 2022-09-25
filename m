Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A221C04A95
	for <linux-usb@archiver.kernel.org>; Sun, 25 Sep 2022 08:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiIYIHk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 25 Sep 2022 04:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiIYIHj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Sep 2022 04:07:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047D2B03;
        Sun, 25 Sep 2022 01:07:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2695B80CB8;
        Sun, 25 Sep 2022 08:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151BFC433D6;
        Sun, 25 Sep 2022 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664093255;
        bh=4+HQ/HtpR+I029bH05/L0sM1XIbsA+lesCpihxplKls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FzsqHrLri5e++0iiUeI2ZDEBPGKPRKp5RduATYb8R77P/7Wx/ImupqllVwB7NCCE9
         Nc2ZhxB074SG7JfXh5+ddA7avrfDlNmXB7g9xJc9wsmfhxxf95ak+WW3EOMK4mBOAE
         EhYUmfb2ETRT/UEUD/MQoGptBMhv0ObCu5liw9gE=
Date:   Sun, 25 Sep 2022 10:07:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fix: add XHCI_SPURIOUS_SUCCESS to ASM1042 despite
 being a V0.96 controller
Message-ID: <YzAMRPjywl0f4uSY@kroah.com>
References: <em0b7a6682-2da4-4480-8801-1107ea9756dd@aea403bc.com>
 <Yy7ENBX2Zo3vNgB1@kroah.com>
 <em98cdb3f1-82c0-4fd3-92af-9c3d062b3d0c@35bdcead.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <em98cdb3f1-82c0-4fd3-92af-9c3d062b3d0c@35bdcead.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 25, 2022 at 07:50:48AM +0000, Jens Glathe wrote:
> Hi there,
> 
> I'm a bit at a loss here. This is a three-line change, and I get loads of
> warnings regarding "please, no spaces at beginning of lines".

Yes, that's not allowed, kernel development uses tabs, not spaces.  Fix
that up and resend and all should be good.

thanks,

greg k-h
