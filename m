Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1C4C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6822B20891
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556208360;
	bh=97GfkI7Z0EoemFzp01uXTD5kqptW5JDRG7piRsrcG8g=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=iMOLH47US1R9cG+d3FgYVDpq/s0BeaovDJn59JvC5AgHjhfouTXECvbCBfr3flWuA
	 72ir7sEqius6vWnQcM7XLChrmb+9cBxMW3Dqll9DTPqXo6gGK+I/n2aOk7/icWJs0C
	 D8zE1HKjytphvJc7VJUEzhk3rLNUvSf5QfHlj74g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbfDYQF6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 12:05:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33689 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfDYQF6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 12:05:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id f23so176868ljc.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QN6tBvlAtrhr/T6Juk/q7Y5HcITxKSUT+ND3nLlMAJw=;
        b=omM9EAw2SKETjOdslcHzmxZLFJpLxhJbrzLnxkqCTzA7+QkMbf1OXouYbWsdYcsBeM
         y8hhwtUkJdxnY+0plyGIlTTZ9XoXLNd4BqjrZIkRPWA/Uo9/YB4Bzo0JuXfgKVh2KmsE
         Iva6GojIqEDhvED3/wuCB+89BDBQ7IJCnPwhdNNDGXAAj948OFlRffGLHYCx7hsYvPPq
         8QXiVztmC8p6EqjhvlTvqs3D7G3sXVqMHj8WqWSIrp69FJSEet/splaCHocD/ClQll2/
         axGQ7WG114gcoUIh99j+sEgUInopY1WE9Ijcmoj6tgC1V18SAr2adhkFLM4B05ClFIu/
         uccA==
X-Gm-Message-State: APjAAAUmXt0yxcjNeroBOGZydGHE42srCuDTqY4qhVkwM13q1aKdFpwj
        FR5intbDTF/SnIKGrjTvGBQ=
X-Google-Smtp-Source: APXvYqydKULgejT3bItbjs9yzljLwEcRvR5Iz2DFiZBIrdrtTpokAqucPyRtzeBRFg0v/38q2RSJew==
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr7063155ljc.77.1556208356509;
        Thu, 25 Apr 2019 09:05:56 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id b14sm4803823ljf.53.2019.04.25.09.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 09:05:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hJgsl-0002cf-E8; Thu, 25 Apr 2019 18:05:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] USB: fix tty unthrottle races
Date:   Thu, 25 Apr 2019 18:05:35 +0200
Message-Id: <20190425160540.10036-1-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes a couple of long-standing issues in USB serial and
cdc-acm which essentially share the same implementation.

As noted by Oliver a few years back, read-urb completion can race with
unthrottle() running on another CPU and this can potentially lead to
memory corruption. This particular bug in cdc-acm was unfortunately
reintroduced a year later.

There's also a second race due to missing memory barriers which could
theoretically lead to the port staying throttled until reopened on
weakly ordered systems. A second set of memory barriers should address
that.

I would appreciate your keen eyes on this one to make sure I got the
barriers right.

I noticed there's some on-going discussion about the atomic memory
barriers that Alan's involved in, and I'll try to catch up on his
data-race work as well. I'm still a little concerned about whether the
smp_mb__before_atomic() is sufficient to prevent the compiler from
messing things up without adding READ_ONCE().

Note that none of these have stable tags as the issues have been there
for eight years or so without anyone noticing (besides Oliver).

Still feels good to clean up your own mess.

Note that the cdc-acm patches have so far only been compile tested.

Johan


Johan Hovold (5):
  USB: serial: fix unthrottle races
  USB: serial: clean up throttle handling
  USB: serial: generic: drop unnecessary goto
  USB: cdc-acm: fix unthrottle races
  USB: cdc-acm: clean up throttle handling

 drivers/usb/class/cdc-acm.c  | 63 +++++++++++++++---------------
 drivers/usb/class/cdc-acm.h  |  3 +-
 drivers/usb/serial/generic.c | 76 +++++++++++++++++++-----------------
 include/linux/usb/serial.h   |  5 +--
 4 files changed, 75 insertions(+), 72 deletions(-)

-- 
2.21.0

