Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BF6C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80F302064A
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knyB91nX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbfDPR20 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 13:28:26 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38481 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfDPR20 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 13:28:26 -0400
Received: by mail-pl1-f193.google.com with SMTP id f36so10673222plb.5
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 10:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9Aq84HBpDtOIm1olGebGPH24Mwroh3jWPB8zE3/6La0=;
        b=knyB91nXlkT6E9w9vWwvphWqCFbaAxhPQM/EFHY7oVbsCskwyrWbDjDdeXRGdctOUY
         7m5bA3Y5a9RVS0Di0G1actbN/RpRiHaWG5PWiO24fbJdW3RzqzKaW7rhe7muNoFfQ1N6
         NS0voz35SUeqMpSKQtBz4S8Ii3fsk4d+PDbKy+WkFId08lSnHXiLX2qPnt3czQXh+1C5
         BF+TAicsdLcjVjZwBEHXeXJCsFEMiTUkDhqwKqsvvJdqVHEiocxZML0da7eQHkm0gJQ/
         Kd3YdlZZHAsGIqxCJyGmak/lfNW1+tjrd7YGLOl80jfu1Zd1M5EI5uvcLTEJEb1nuIFG
         Ff/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9Aq84HBpDtOIm1olGebGPH24Mwroh3jWPB8zE3/6La0=;
        b=YeGAhTWNnk/zMGZHlijKqiCVLp0fXfqnlUIOpHWo9oyvXgl6/hfBkLH4YhvXerZumd
         TQgZQB4JzRCUh19qp5eHWxYfawv2eWniuCOql+w1xPIykjONPKnIh9u6jkQr4x0+uyNN
         BRXlmJnP4/4wUnO+etzU+Uv9RTdFAv4EwkknkfNIk18lNNyPKULX7A904FH8hz/5ZYo7
         dnnxdvoG4rrABhuF4YQJW5J5KRymC0An7w7ZBdwTdOIyJLwbrKu5Z1r9zS87SDg6I5w+
         PMkN5sCO/wFmFNv/1EQyu0vIdcjY5lPFFmd2xaja5IQhX1vMy1FmLXrr9HziCpf5bNdw
         Q9VQ==
X-Gm-Message-State: APjAAAVGQcpez0WibaF18gMc3V5nLxF5mALK5HkbR9V6j276WdDx3XtA
        I4J5blSn+FXGxaSBoI8XSRYL5j5JSBw=
X-Google-Smtp-Source: APXvYqzGrD6Gz3ArkbCGLKiUP5Kpa1QtPS7NTVt/9tcEfK2pU3eyB2xiC46MskLmMYL0Ijm83Ubl8g==
X-Received: by 2002:a17:902:be0a:: with SMTP id r10mr80738329pls.4.1555435705013;
        Tue, 16 Apr 2019 10:28:25 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id k124sm85026233pgc.65.2019.04.16.10.28.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 10:28:24 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v8 0/3] Add support for firmware update on Cypres CCGx
Date:   Tue, 16 Apr 2019 10:27:44 -0700
Message-Id: <20190416172747.22139-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

These changes add support for updating firmware on Cypress CCGx
controller. New version (v8) fixes comments from Greg at [1]. 

I have tested them on NVIDIA GPU card.

Firmware binary is already merged. Details are at [2].

Please help review this set.

Thanks
Ajay

[1] https://marc.info/?l=linux-usb&m=155541111931927&w=2
[2] https://marc.info/?l=linux-usb&m=155006182508289&w=2


Ajay Gupta (2):
  usb: typec: ucsi: ccg: add get_fw_info function
  usb: typec: ucsi: ccg: add firmware flashing support

Heikki Krogerus (1):
  i2c: nvidia-gpu: Supply CCGx driver the fw build info

 drivers/i2c/busses/i2c-nvidia-gpu.c |   7 +
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 885 +++++++++++++++++++++++++++-
 2 files changed, 882 insertions(+), 10 deletions(-)

-- 
2.17.1

