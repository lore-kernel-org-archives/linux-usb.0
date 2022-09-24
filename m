Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50A9C6FA86
	for <linux-usb@archiver.kernel.org>; Sat, 24 Sep 2022 10:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbiIXK3Z (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 24 Sep 2022 06:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiIXK3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9406911ED6C
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54FDBB81025
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C6AC433D6;
        Sat, 24 Sep 2022 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015359;
        bh=sbJtV/NXAnAMO1b2ZU+mWi9a55H/J/HjAfL93a7tht8=;
        h=From:To:Cc:Subject:Date:From;
        b=ah26RC+BDnNO7AP8L168ldfsqbSTvsEWTWfTOyoFfwnQQR/2gPydcOFDTDmqUHzYV
         CxvcrsP9EfQLWKHLEhV2BEFWffeAr8IXnp5AzdX/Wpr1Jxdqw2eWcDOYGxI5UdUrL8
         0ZxYsj0IaH0/ObRp9ZDGnrLPvF6A1Iq/ZvdxQsyAmhHwDWu/qfz3588ArAya9XcE+O
         aR5+im+yHVrsbCYnNWg5sCfj8aj5JCSaCfVGwogcdZf3J5uvJ/Rew5aBzGoRJ10zZY
         /oz/tPmF5eQszgUk35vuQW4kWp1kIawfnX7R3To9wATYlEile8RZk43ElZdLdnvL3d
         wU/TyBJIfxVyQ==
Received: by pali.im (Postfix)
        id 9EAE68A2; Sat, 24 Sep 2022 12:29:15 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 0/7] ftdi_sio driver improvements
Date:   Sat, 24 Sep 2022 12:27:11 +0200
Message-Id: <20220924102718.2984-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes since v2:
- Use u32 for div_value
- Add line break after the colons in switch
- Avoid ternary operators where possilble
- Use baud rate 9600 instead of 0 when unspecified
- Fix commit messages

Pali Rohár (7):
  USB: serial: ftdi_sio: Fix divisor overflow
  USB: serial: ftdi_sio: Add missing baud rate validation
  USB: serial: ftdi_sio: Extract SIO divisor code to function
  USB: serial: ftdi_sio: Do not reset baud rate to 9600 Baud on error
  USB: serial: ftdi_sio: Fix baud rate rounding for ASYNC_SPD_CUST
  USB: serial: ftdi_sio: Fix custom_divisor for TIOCGSERIAL and c_*speed
    for TCGETS2
  USB: serial: ftdi_sio: Fill c_*speed fields with real baud rate

 drivers/usb/serial/ftdi_sio.c | 215 +++++++++++++++++++++++++++++-----
 1 file changed, 185 insertions(+), 30 deletions(-)

-- 
2.20.1

