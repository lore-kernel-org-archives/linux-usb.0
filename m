Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400CEC282E7
	for <linux-usb@archiver.kernel.org>; Tue, 16 Aug 2022 06:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiHPGbf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Aug 2022 02:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiHPGbQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 02:31:16 -0400
X-Greylist: delayed 961 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Aug 2022 17:47:29 PDT
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC66195800
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 17:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
        s=tartarus; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=DS/5gMmmv7BMmxt/BwBMcFkadZ8ACS3eMLOBmbS+Chw=; b=Yjq2FshkGU0EhI5ois5PlClyXT
        PCmvTOzsxynh7Dw5KA2tw+6dll6e/OkA8tbyzOStI/0eZTv40w0/6Do6MB1Uq14BFRYKw8apd6IaI
        tXVbbshI4ECR/876kMxuTPhGZl1WSSLa956GbS59masJ38XTO/MFfawEthYwMOavGU9U=;
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
        (envelope-from <kilobyte@angband.pl>)
        id 1oNkU7-00AL27-Mn; Tue, 16 Aug 2022 02:31:07 +0200
Date:   Tue, 16 Aug 2022 02:31:07 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: build failure due to drivers/usb/dwc3/dwc3-qcom.c
Message-ID: <YvrlS9ear/Ku1bKt@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!
With CONFIG_USB=n CONFIG_USB_GADGET=y I get the following fail:

ld: drivers/usb/dwc3/dwc3-qcom.o: in function `dwc3_qcom_suspend':
dwc3-qcom.c:(.text+0x3d4): undefined reference to `usb_hub_find_child'

I tried writing a patch but I don't know how much code applies to host
mode only -- and whether the device supports gadget at all.  Thus, I'm
just reporting instead.

Broken in 6895ea55c385c9afdd2aec1eef27ec24917a112f.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁
⢿⡄⠘⠷⠚⠋⠀ You're alive.  But that's just a phase.
⠈⠳⣄⠀⠀⠀⠀
