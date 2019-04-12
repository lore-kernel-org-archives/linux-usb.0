Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBA3C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 12:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B257B2082E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 12:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="YBkpX/P5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfDLMgp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:36:45 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53979 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbfDLMgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 08:36:44 -0400
Received: by mail-wm1-f65.google.com with SMTP id q16so11035283wmj.3
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XjjkFruDsH5BYQSaWX+oEpOL4blf0Yltxz9NZtZphkA=;
        b=YBkpX/P5s7YFsOu4AR5CWQC3NIh6KtLHjWQsVXTICMxUkEoYanZ/7ut8fpogZJq+cV
         8d3s/iF/3Ltbrxfyf1eGFKcCnX4BazlFOfk4qiraEj/M4rFknFS7iGq99nTzoOBW+ChD
         /K8AHsBslAzHrr4P0Jd8b5IsFl8FLC9LEshct/QRSnhEESRKcXHE/OGM/9eESuF13a43
         ESPoKrcbzPEViKyxXzGC+ybQTnUANYd1iFlwTO+8Y2u2oyYPIFUL48Gluy4WYemLeoi0
         oGC4OCuetyVOC2MqBB3A3qfVceoSeApsI9dAfvqFbs0+/XE3vQASuhEBrZZf8edLABkF
         aO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XjjkFruDsH5BYQSaWX+oEpOL4blf0Yltxz9NZtZphkA=;
        b=gNnw+RuDRg8WQvnbkhS20RmjMQzIPT5trJYhqMoKfy0mFa6qjjBeOysTxX1MSsjf1C
         q4JLeqXYEb8nAfyLYC7KZj8mQ/ixzqUaX/tYa9h9oon++neg7v70+9fLAsoOa4jEQV9c
         FuAZwuvHGBxInDc6PUq7wPNdaTA4a8KR4nk8GalA1JRcpLcSe0Ii6Tsgc2UvDDkStGiC
         nknYymoUyU6qg7gy9ICNBmPHGINI9kj8UqX4Sq6p7amGU++7R/VipmlLJBCi+HXKxnOt
         0kjwaiGjDrRuTKut+I/0R0Xks4GKnsvpfukPBklPzGbX95dGuzm6k7sSQ3Me7rFFiAPb
         evWg==
X-Gm-Message-State: APjAAAVg8Znj3Qp7n7yOER+kJt49E3Gcu8ZhSpCIyhoAHIwGPKLYwcBy
        35UoqH7M9a5Gfn+1NLhlzqGJPRyVbqs=
X-Google-Smtp-Source: APXvYqzkBfvOn88/4jK4XYC/MeVSWGcf943H4zya74H2OGLPnuZBtxEhVx+HjAzB/PeeIw8lrhCuAw==
X-Received: by 2002:a1c:99d5:: with SMTP id b204mr10621493wme.95.1555072603479;
        Fri, 12 Apr 2019 05:36:43 -0700 (PDT)
Received: from localhost.localdomain (aputeaux-684-1-35-248.w90-86.abo.wanadoo.fr. [90.86.90.248])
        by smtp.gmail.com with ESMTPSA id v190sm12384030wme.18.2019.04.12.05.36.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 05:36:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/6] ARM: davinci: ohci-da8xx: model the vbus GPIO as a fixed regulator
Date:   Fri, 12 Apr 2019 14:36:34 +0200
Message-Id: <20190412123640.11437-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Historically the power supply management in this driver has been handled
in two separate places in parallel. Device-tree users simply defined an
appropriate regulator, while two boards with no DT support (da830-evm and
omapl138-hawk) passed functions defined in their respective board files
over platform data. These functions simply used legacy GPIO calls to
watch the oc GPIO for interrupts and disable the vbus GPIO when the irq
fires.

Commit d193abf1c913 ("usb: ohci-da8xx: add vbus and overcurrent gpios")
updated these GPIO calls to the modern API and moved them inside the
driver.

This however is not the optimal solution for the vbus GPIO as it
duplicates code. Instead we should model the GPIO as a fixed regulator
that can be controlled with a GPIO.

This series adds fixed regulators for all users of vbus GPIO, adds
overcurrent protection using the existing vbus regulator in the USB
driver and removes the vbus GPIO calls once they're no longer used.

Tested on da830-evm with the module both built-in and loadable.

v1 -> v2:
- add patch 1/6 that fixes an existing problem with missing array
  sentinels in GPIO lookups
- add patch 2/6 that removes an unnecessary use count variable from the
  driver
- reorder the changes: add support for overcurrent protection using the
  existing vbus regulator first, then setup fixed regulators in board
  files and finally remove the vbus GPIO from the ohci driver

v2 -> v3:
- change the device id of the fixed regulator to 0 since it's the first
  one
- drop the interrupt-context handler and only use the thread
- drop Alan's Ack from patch 3/6 as it's changed significantly
- rebase on top of v5.1-rc4

v3 -> v4:
- in patch 2/6: switch to using a simple if/else

v4 -> v5:
- remove stray newline in patch 3/6
- remove one level of indentation in patch 6/6

Bartosz Golaszewski (6):
  ARM: davinci: add missing sentinels to GPIO lookup tables
  usb: ohci-da8xx: let the regulator framework keep track of use count
  usb: ohci-da8xx: disable the regulator if the overcurrent irq fired
  ARM: davinci: omapl138-hawk: add a fixed regulator for ohci-da8xx
  ARM: davinci: da830-evm: add a fixed regulator for ohci-da8xx
  usb: ohci-da8xx: drop the vbus GPIO

 arch/arm/mach-davinci/board-da830-evm.c     | 51 +++++++++++++++++++--
 arch/arm/mach-davinci/board-da850-evm.c     |  1 +
 arch/arm/mach-davinci/board-dm355-evm.c     |  1 +
 arch/arm/mach-davinci/board-dm644x-evm.c    |  1 +
 arch/arm/mach-davinci/board-omapl138-hawk.c | 50 ++++++++++++++++++--
 drivers/usb/host/ohci-da8xx.c               | 42 ++++++-----------
 6 files changed, 112 insertions(+), 34 deletions(-)

-- 
2.21.0

