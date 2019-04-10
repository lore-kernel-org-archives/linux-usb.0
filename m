Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F15AC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 19:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D68520820
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 19:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXUnrMk0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfDJTvI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 15:51:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34306 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfDJTvH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Apr 2019 15:51:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id y6so2055050plt.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2019 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=esbp5SoqnHVKHCW1V1Vtj85c5+r3f6+ChHiHZEjCa/s=;
        b=PXUnrMk0WIiYGoTBq6e/4QGHfkNHEDMYTWq/6d2ChxgXW97EcdZpdHqdvqRwZovuFo
         E0wPzW0c6ujgR28JHn8kES9HFEFajK/EVG/fJaRgLJYWpqa69SEpKFP3lwiKrLJNCxjj
         KjQDZ4708C8mNDxXeu+fz4kH6Y4aNlciPldg/Dsc8Hpa4ip0CHxkTny531xSeKxHtAzo
         AWenfjQ8l8regPIXXZTQsJe/xivqacWyfnowJitDKHDyrFLfN/MycCnow48k+tPvaoH7
         g+4iB16ssXXtZNiCgrFyvs18JDjNjxgCr9wIl+EYPC3PVZmPEPcALiGgkPxbKN8JWRP0
         cAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=esbp5SoqnHVKHCW1V1Vtj85c5+r3f6+ChHiHZEjCa/s=;
        b=MYQeOhJjj0k3Mso7w+AISAoSSMqKNiedO2XNOhMtEqLlHxBPDyWTbt6K3dWHg1i8ri
         0sxJyIrO3aUF6wUYRRqy4nkNP3CXDl/FhfXpOTmSg/1++5ZDpuMmfCMVzcNPfi6UieJr
         NJenxoOcuWMkTdFoY6YbfbHJUbnGA2W6w/D6xnPA/2f3LrWBgc1eblv8/OJhxugAu0Ge
         G9JsUM98bDKJtAfDwxOki597a0M5q3EbdTSIrXgpR/9RA415dXldO4KJM/kLApTvjKnD
         hVBNdJj4+y4MDHxHxJaENp3P+bTb8dnSrhCRbraV3vwrHgZp91xXtgfsDVS7USuHG2m7
         BMLA==
X-Gm-Message-State: APjAAAVKlCe7CNEm9hcW9bh+IFT4yhTRvx/MQy0lZWUud3ZUCFQb8qCa
        pYDybPtYwHa8FMOlVMRaJNU=
X-Google-Smtp-Source: APXvYqy6H1spSQEbWA+0DQsorDhh5HyvNiaDzdIV2A1JBGUmjZIrFMpDajEpza8KuwU7+5uNOW8kxg==
X-Received: by 2002:a17:902:8ecc:: with SMTP id x12mr45849382plo.0.1554925866822;
        Wed, 10 Apr 2019 12:51:06 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id g4sm4485786pfc.75.2019.04.10.12.51.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 12:51:06 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 0/2] Add VirtualLink display altmode support
Date:   Wed, 10 Apr 2019 12:50:56 -0700
Message-Id: <20190410195058.9996-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Please help review these two changes which adds support for
VirtualLink display altmode devices using NVIDIA GPU.

You had shared the first patch during our offline discussion.
The second patch adds NVIDIA display altmode driver.

This set is created against latest Linus's kernel and patches
at [1] forwarded to Greg from you.

[1] https://marc.info/?l=linux-usb&m=155488414908414&w=2 

Thanks
Ajay

Ajay Gupta (1):
  usb: typec: Add driver for NVIDIA Alt Modes

Heikki Krogerus (1):
  usb: typec: displayport: Export probe and remove functions

 drivers/usb/typec/altmodes/Kconfig       | 10 ++++++
 drivers/usb/typec/altmodes/Makefile      |  2 ++
 drivers/usb/typec/altmodes/displayport.c | 12 ++++---
 drivers/usb/typec/altmodes/displayport.h |  8 +++++
 drivers/usb/typec/altmodes/nvidia.c      | 44 ++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c            |  4 ++-
 include/linux/usb/typec_dp.h             |  5 +++
 7 files changed, 79 insertions(+), 6 deletions(-)
 create mode 100644 drivers/usb/typec/altmodes/displayport.h
 create mode 100644 drivers/usb/typec/altmodes/nvidia.c

-- 
2.17.1

