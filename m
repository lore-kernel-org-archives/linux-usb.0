Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BD9C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 19:06:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 080F320818
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 19:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbY+CdV2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfDLTGn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 15:06:43 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41395 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbfDLTGn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 15:06:43 -0400
Received: by mail-pl1-f193.google.com with SMTP id d1so5558412plj.8
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 12:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=914HvR9Cf/xouTwdgurHE5rXYcwUoto29Zurxb67Pk4=;
        b=LbY+CdV2dUwocTcc4ignC7L5KHTRQkxEVrYWWJKhxOr9+PDfu8fmcYz16GbchbbmH/
         NPTJvY5I89OVZ8EwWZXs7MOcU3GB6lrF8MqfiaKBSEnhzFhPrTzvR8wwTVAI0hojKJbc
         2tK3Rl8WbQGaAxCy2Ql7VtxE5AqvWWEvACyj2xahgS7+Whdzg6/JWToiI/nPudrKy2tA
         fGRgK6vO+baYcdCjWGhFIWgQq58Jgp+g29lJn8jxEhG8JZ0MwIVY+5SVDdPgEjx8pSIL
         LWAQDXnc+RpkeEzgYE68E8B7HffR5Ekfz3UAKtZbsMT24AILJYrxG3ZgG6B9V6zmRD+r
         Ouhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=914HvR9Cf/xouTwdgurHE5rXYcwUoto29Zurxb67Pk4=;
        b=TDAPT8ZECtA3oTkH8XYrILW4fIICY3Mw6j8TI423zb0910Iwb3wVtHT41N/29OfJM/
         JFUz4enap3uTBOzkJWzN9UQi7brT/UrrlR33tpWub9ecSzRyhofzyqrkqkH1Kqzs5vfK
         B3E2uyaDg6NtD2gLQySuYlHSgPTOtk5EJ8ZXVXmzCrgpd0PtdL8x1yoDn4i05x2UzjG6
         CGyaqBTgk6KllaJswwKsuuKiXZEopjf7vY2nSsiB9IrQ4F1CMmXl3o65EhYZPtk7aP1q
         MxlPOkIC5VzNoolNkshnLQsWm4MJKelqi1AHDSBj86BnKGbhQEFMOjC86Cmzf58YAyxy
         ck4A==
X-Gm-Message-State: APjAAAXORQjPmKzlWPCXja4xYq7/JwVUZ2G3j7yKxKwWLokPC/TjCmI7
        fMDbCzK3N1SZheHVzs82Axk=
X-Google-Smtp-Source: APXvYqykaPMrKInZIp42sHMC44vItWV24mLqKOC3AY7e3P4oh+lARA9gLV6u7h7cfX/PtKa+/GOUVA==
X-Received: by 2002:a17:902:2a29:: with SMTP id i38mr59396496plb.22.1555096002794;
        Fri, 12 Apr 2019 12:06:42 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c3sm58760133pfo.2.2019.04.12.12.06.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 12:06:41 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v7 0/3] Add support for firmware update on Cypres CCGx
Date:   Fri, 12 Apr 2019 12:06:20 -0700
Message-Id: <20190412190623.26945-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

These changes add support for updating firmware on Cypress CCGx
controller. New version (v7) fixes comments from you by reading fw build
information from device property. 

First patch in same as posted with v6. There is no change in it.

Second patch is from you and adds fw_build device property in i2c-nvidia-gpu
driver. I have updated the commit message, added a comment and also used
'n' and 'v' to be more clear than using hex code. I think it should go with
usb tree since it enables a feature in usb driver.

Third patch "usb: typec: ucsi: ccg: add firmware flashing support" has the
change at [1] (from you) squashed into it. I have updated it to fix two sparse
warning and not fail the driver if fw build info in not provided. Instead
just fail fw flashing only.

I have tested them on NVIDIA GPU card.

Firmware binary is already merged. Details are at [2].

Please help review this set.

Thanks
Ajay

[1] https://marc.info/?l=linux-usb&m=155508466310059&w=2
[2] https://marc.info/?l=linux-usb&m=155006182508289&w=2

Ajay Gupta (2):
  usb: typec: ucsi: ccg: add get_fw_info function
  usb: typec: ucsi: ccg: add firmware flashing support

Heikki Krogerus (1):
  i2c: nvidia-gpu: Supply CCGx driver the fw build info

 drivers/i2c/busses/i2c-nvidia-gpu.c |   7 +
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 895 +++++++++++++++++++++++++++-
 2 files changed, 892 insertions(+), 10 deletions(-)

-- 
2.17.1

