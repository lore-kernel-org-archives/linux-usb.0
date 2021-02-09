Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0641C433DB
	for <linux-usb@archiver.kernel.org>; Tue,  9 Feb 2021 09:56:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A48064E9A
	for <linux-usb@archiver.kernel.org>; Tue,  9 Feb 2021 09:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhBIJ4T (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Feb 2021 04:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBIJyM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Feb 2021 04:54:12 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DF7C06121D
        for <linux-usb@vger.kernel.org>; Tue,  9 Feb 2021 01:53:26 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id f14so30247084ejc.8
        for <linux-usb@vger.kernel.org>; Tue, 09 Feb 2021 01:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pqbb2hbiFk/I6vb7TmhkdeW2Dsvn3o0tV40ygJzupJY=;
        b=b9Yr/WFLNTMKwRU/2j24yNwf+F6THMtjELrnzsywsXAvhuvqobOJXsTvc+lpvKP3TV
         JjyxjnXcK6zymN3TICdIcYxmJPe59Buw647pX/xX1GwjeksqDvnR1xClt3jNL9cruFPT
         k1RBj5wUH74f0g5nDeoMk/IqVDQCAhH6uMFIjZeTxzg2VE8FYH74AN+Lmk3AC8+F1tR8
         wbdLI8NTK+qLD5yeAJxvhqx5NUL70wwjvLH5qYX1e1lrfYQqjLOLmMF8f6ccCcSBIR6h
         0I35KsZlmdqauVSYeSmPW+hz/Smm1QWs2ndz0HZdUJ8n78SOkSI9E+davlobcA2tDpWP
         QqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Pqbb2hbiFk/I6vb7TmhkdeW2Dsvn3o0tV40ygJzupJY=;
        b=pU0x68zv2n60bKQbNIvANcazFVDEdTG1N9aAfOsc4L6o56k+XiJYWohPi+rMac3/CX
         rR5f4TqgiLL8PVFvhiVj2dfkDpwiGhCaHOa70FxTiV41e78KA2zckymECdnG/WQLV86v
         Va6d1FA76EK5xjzRLB8Hltacj15YVgh67x2yoEftODrRGatXjAD7n14dRbS/hTP5Jj78
         RcM9Sgw2GddtQTff7h1m09WTzT5nz1fEUH4A1vCemIUX5hIcjL/szXka+MMo6Oo47zg7
         AyQEiSK36G3nHgd4m1rYQDhMdZo++VswWRHoVFIINsMPkNaDhOg48fD/JCWXx3/R20y5
         vmzA==
X-Gm-Message-State: AOAM530u21zn32/saDRlGSLm2UQYfWyATlXRx0Rw51CG0djIymWtwNBq
        hH0EM2O/z8FCjm8lpBgOfj7stA==
X-Google-Smtp-Source: ABdhPJxTHff2sFseU/wwogexEzr83TWbeERuCDSraUtmSFT/XUiOPJ0B8MHbnrKRymb0cLjUniSZRw==
X-Received: by 2002:a17:906:880f:: with SMTP id zh15mr8838974ejb.268.1612864405279;
        Tue, 09 Feb 2021 01:53:25 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id i13sm10249734ejj.2.2021.02.09.01.53.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 01:53:24 -0800 (PST)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Al Cooper <alcooperx@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Piyush Mehta <piyush.mehta@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: misc: Add support for Microchip USB5744
Date:   Tue,  9 Feb 2021 10:53:18 +0100
Message-Id: <cover.1612864393.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

the series is adding basic support for this USB hub. The key part is
running reset over GPIO line and when i2c is connected it is necessary to
send command to boot the hub. This chip is available on Xilinx
zcu100/Ultra96 v1 board.

Thanks,
Michal


Piyush Mehta (2):
  dt-bindings: usb: misc: Add binding for Microchip usb5744 hub
  usb: misc: usb5744: Add support for USB hub controller

 .../bindings/usb/microchip,usb5744.yaml       |  56 +++++++++
 MAINTAINERS                                   |   2 +
 drivers/usb/misc/Kconfig                      |   9 ++
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/usb5744.c                    | 115 ++++++++++++++++++
 5 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
 create mode 100644 drivers/usb/misc/usb5744.c

-- 
2.30.0

