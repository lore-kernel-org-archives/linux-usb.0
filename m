Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7372FC43332
	for <linux-usb@archiver.kernel.org>; Mon, 21 Dec 2020 18:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FE6222C9C
	for <linux-usb@archiver.kernel.org>; Mon, 21 Dec 2020 18:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgLUSHV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgLUSHU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Dec 2020 13:07:20 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAA4C061257
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:06:40 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id h205so25823780lfd.5
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6GOIuyVrU+RFGPTfL16iF1lbuFwHWSwNBXld0jU71tg=;
        b=OuCyfDsLA66E6tSeeNV5W3tIR6FpEBwwEByxbYdc99ny29D4QNuO0Ufm8iCqEuBuVL
         myXsOOxx+QJ1ZvZ0nwN8DBfGu/TFzcML6SAIJI3veH+uT+mmz4MXxTVGj8HLDw0FT0Mc
         nJi77ZQmqyc6e/DDY/SfAxeQFxnHZ1OdM4YttHhhqDEy52VIvv6h0ycyjYslxHRPcLPQ
         Ec1MLJdv16AI/0IWB9mPTM3TbxJCOKF9rcBDCPfuttNhI8K5xotFUnMuTEfHSZDNgbUd
         yVQ6ALlQYFriVjUN0puMieHWDP3H1T0rA3+JCxN89jBXvs20xpiyAWBaSv/tvNwAK+sJ
         MK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6GOIuyVrU+RFGPTfL16iF1lbuFwHWSwNBXld0jU71tg=;
        b=pwH/WpGfro30Outhir/p09yn9jqcPE0ETUqvUgDDbAVPdqjRXToSoidv7Wtp9+mDj4
         kN+zT/98TcsNGeKF6sDM5tt6q0U1lev6e3MWxaJ/EZ6ZHfnyg7O7pBK6RLw+xNI0PcY2
         tXn2sAYsF2/mBuKXBDN6FN7UZlZlk5DdH3VMc/MY7UnbCRkuNM0YKTZS6T1k4aejNs5j
         jApP3lBaVV8nEaDA8idae0Uac6jkfdTE3i3CAo5aybygEYOJQOxXFE4G71vHxUcvwnAx
         3icwetGE4F6Unn4WzSK93aL0JcyHcf3y/GFu/lCZJvzh1/HsZptkSjMDGBlOJ/YYCDOU
         YZ0A==
X-Gm-Message-State: AOAM533HtLZxeYxuse4XwghBB+7+1D86lKL9gi2NlzS4nZngq2BY+YtR
        KApyxDQzyq+NzYtZ69GSmfnUFT8VKcHnKguL
X-Google-Smtp-Source: ABdhPJybWoCfB9R0VudqEA60QYpK/iTjLTVj+luqFWZXhwEIkDl/80PfJixK5doWCdTu8JGitnNjlA==
X-Received: by 2002:a17:906:2755:: with SMTP id a21mr10777094ejd.374.1608572140837;
        Mon, 21 Dec 2020 09:35:40 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id dd18sm9338408ejb.53.2020.12.21.09.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 09:35:40 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] usb: gadget: audio fixes and clean ups
Date:   Mon, 21 Dec 2020 18:35:27 +0100
Message-Id: <20201221173531.215169-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset is a collection of fixes and clean ups found while
working on the uac2 gadget. Details are provided in each change.

The series depends on this fix [0] by Jack Pham to apply cleanly

[0]: https://lore.kernel.org/linux-usb/20201029175949.6052-1-jackp@codeaurora.org/

Jerome Brunet (4):
  usb: gadget: f_uac2: reset wMaxPacketSize
  usb: gadget: u_audio: factorize ssize to alsa fmt conversion
  usb: gadget: u_audio: remove struct uac_req
  usb: gadget: u_audio: clean up locking

 drivers/usb/gadget/function/f_uac2.c  |  69 ++++++++++++---
 drivers/usb/gadget/function/u_audio.c | 122 +++++++++++---------------
 2 files changed, 105 insertions(+), 86 deletions(-)

-- 
2.29.2

