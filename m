Return-Path: <SRS0=VIq2=CK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74511C433E2
	for <linux-usb@archiver.kernel.org>; Tue,  1 Sep 2020 00:55:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A608208A9
	for <linux-usb@archiver.kernel.org>; Tue,  1 Sep 2020 00:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5vuCR3E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgIAAzX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 31 Aug 2020 20:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgIAAzW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 20:55:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D73C061573
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 17:55:21 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id e23so5450136eja.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 17:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IPiKisiJXt5PgmTopj7tR0AbrhqV68JQXCCgV/17HOI=;
        b=U5vuCR3EyQWipVAGBDPdccCnAzu4gSJjYsFLajlQETfysqBBRhoNTPwx/72E+dzFKG
         otQwiCi0ejVpxtKipmIbsXapJpkOItPhsRXxcMuDoDCiZclRR3m0DHzMzc85rZB3gW/C
         QRF4Ei7By/QaAjeu3y32xFGx3Ib1HjoY4j7E6RQn5/ZtZI/JOVDM96jLbmQcUwwdfxSe
         eineQBc4oPXvjrzQrC10+O+6BBuWvOEOIZwpInEaxNhQq1gKJ+TqsrZaPd/cVD2717Lv
         tvIYjgnLMC8y1IHWv9aYWtU+D0TSO26JPB7kp3ZOIebDmweZZ/Tza45c3eazafSph2qC
         mX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IPiKisiJXt5PgmTopj7tR0AbrhqV68JQXCCgV/17HOI=;
        b=MreAR/nIdN7bRAtcz2IxTISX1UaImLPirg8bsYDZd+2GHAzq5e/ApCIK26anSLrS6M
         EEf3xHtTQaS+RyYt4K+hxN0ebhQh2fWeIOQkVqtkIpndJh2bdnmytrXXqam0oIk3olbm
         8p3VKXYX2m5RPRRyj9EFMhucnfDBwyP1baKIyJxLMYAcUt/g6i0Zsic/KnXGbRSLjBP9
         SG5DwcIlwhThbY6bVRojiKFA+jgWaQL6Iza83itUfRFRNIheboMqkN0L82XqvEfIQpO2
         lNhTY5/O8apnPMWIU/8ZaJQYJOz/VLLQSjChR6ZvQHwSOQC68/OhmvDuDkr9XZNsMJQv
         SB4Q==
X-Gm-Message-State: AOAM530fU/KA9S+KHMTNuvFukTrwfk7LFHgZUecTaWgmPFjQ+tC/x39N
        g6M6rGu9l/e5+Vlteo0mxeO+KPi3heR8SvoV9KlnZZFbVV4=
X-Google-Smtp-Source: ABdhPJx2Ibao4nRm0Iu+mQ9d8RfYvWWWiFDMNjG0R4koQx0YKmeNPwYCs8aoeRp0TgI35uauddrFORY7bkQOCY+xE/A=
X-Received: by 2002:a17:906:6888:: with SMTP id n8mr634248ejr.412.1598921718309;
 Mon, 31 Aug 2020 17:55:18 -0700 (PDT)
MIME-Version: 1.0
From:   Tom Yan <tom.ty89@gmail.com>
Date:   Tue, 1 Sep 2020 08:55:07 +0800
Message-ID: <CAGnHSEnKNZFyjF6E+QCLESzuOX-Fz-4ejuhmZNnGRaN8GQbM7g@mail.gmail.com>
Subject: About clamping max_sectors to (ambiguous) dma_max_mapping_size
To:     linux-usb@vger.kernel.org, cyrozap@gmail.com,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

So a recent commit that disable 64 bit dma addressing for ASM1142:
https://github.com/torvalds/linux/commit/ec37198acca7b4c17b96247697406e47aafe0605

I notice that it also causes (hw) max_sectors of uas drives connected
to the controller to drop from 1024 blocks (SCSI_DEFAULT_MAX_SECTORS)
to 512 blocks, because we clamp it against
dma_max_mapping_size($some_device).

For uas drives, $some_device is `sdev->host->dma_dev`:
https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1778
(`shost` is `sdev->host`:
https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1873)

But for bot/msc drives: $some_device is some other device:
https://github.com/torvalds/linux/blob/v5.8/drivers/usb/storage/scsiglue.c#L92

In that case, max_sectors remains to be 2048 blocks for SS BOT drives
connected to the ASM1142 controller.

I tried to change it to `sdev->host->dma_dev`. It lowered their
max_sectors to 512 blocks.

So my questions are:
1. Do we really need to do any clamping to max_sectors in either (uas/bot) case?
2. If so, should we change the $some_device in either case?

For the record, in the original commit (for BOT drives):
https://github.com/torvalds/linux/commit/d74ffae8b8dd17eaa8b82fc163e6aa2076dc8fb1
The commit message states that the clamping is needed because of some
other change, which is supposed to cause max_segment_size to raise
from 0x10000 to 0xffffffff, but when I check the sysfs files for both
kinds of drives, all of the values are 0x10000.

Also see https://github.com/virtio-win/kvm-guest-drivers-windows/issues/498
