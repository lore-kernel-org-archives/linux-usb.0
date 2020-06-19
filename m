Return-Path: <SRS0=B/zi=AA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85747C433E0
	for <linux-usb@archiver.kernel.org>; Fri, 19 Jun 2020 00:29:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4678520888
	for <linux-usb@archiver.kernel.org>; Fri, 19 Jun 2020 00:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcajNrY4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728919AbgFSA3W (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Jun 2020 20:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgFSA3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 20:29:22 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC835C06174E
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:21 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id y1so5968869qtv.12
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7+jqeCqm7xumQHxmixvgX/dM6ThLZW5Po9Yk5x6/yf0=;
        b=rcajNrY48cV1KGuKp3j2ScidYPf5pJUp7kP/OgTb/doRd0MYhQfq6dn9mbISJgnbF+
         UW8/Qkv3V+R3l7GMTG0PXt8KjoH7DwLxnD/+R3sbYuuLp1W51wClbQ6AlzbsKOX6WWRg
         s8dqKsu+W9ch8bAJKIINlzYDz22YviJ+5rvI4lRQHYlb+/Uu1YzgtRQEsJJ4d+aRo5x6
         zPD9omHC3SVqXmueZSewBARpEU/iU2piIy7doeMizZFoTtImUwc1G529//kafRXlqsRz
         jScDBCZcV3/V11AsMXv6RtBTs69e/+qru1z6I7qTlTsBHEC8bdhJ8ymdDgF4zytuH0Eq
         cNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7+jqeCqm7xumQHxmixvgX/dM6ThLZW5Po9Yk5x6/yf0=;
        b=a/4FzlLP5zGk4+10arjyderg8ajMrOWDq11IG7yjWXhtxx5oUjTCQvVsUaq9UbRf5A
         m65/iXCByQ0qX9K8r7vsGMZ6E4XBXaKzljBTY1RXuKnlfHMTnUAZf7AVNFKQanHLFRkZ
         DLRaM2ZHGYPa/h24zka0zn+fCafH55shWutjzQdAjSsZh5CVTjudv16eKhZ87jKGa5XP
         vDEaI2inLYmuDM7DpE5LWcK1OdyiP5/WxBtNt2jHbgzhOMdXwtQaE6FMrzLoipeRrG2C
         ErIuyoZV+V+PZ+3H+ylJX+COtxNUqJktbir+nSjRreZaaNPkanklEC9GwT3Gfoq32x6d
         MNgQ==
X-Gm-Message-State: AOAM533BnjCalNVDaTviICVnuzpW/lR8WYraTAlcnDQE8vKkOGQL964a
        w+SIgcDQ2pmI+JkTUmLk/d0=
X-Google-Smtp-Source: ABdhPJyS/oqI+ssfKolj814p8gklF2uwmSWWmMSl23lZUEDJNwiRCXzeYDSrtTBpCqM9U0HwNPscig==
X-Received: by 2002:ac8:3f77:: with SMTP id w52mr920102qtk.161.1592526561120;
        Thu, 18 Jun 2020 17:29:21 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id p7sm135497qki.61.2020.06.18.17.29.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:29:20 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming Liu <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 0/4] USB: sisusbvga: series of changes char to u8
Date:   Thu, 18 Jun 2020 20:28:50 -0400
Message-Id: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series changes all appropriate instances
of signed char arrays or buffer to unsigned char.

For each patch, if changing one variable to u8
involves its callers/callees, then those changes
are included in that patch as well.

This doesn't apply to ioctl functions, since 
the types for buffer of ioctl-like functions
needs to be char* instead of u8* to keep
the compiler happy.


Changming Liu (4):
  USB: sisusbvga: change sisusb_write_mem_bulk
  USB: sisusbvga: change the buffers of sisusb from char to u8
  USB: sisusbvga: change userbuffer for sisusb_recv_bulk_msg to u8
  USB: sisusbvga: change sisusb_read_mem_bulk

 drivers/usb/misc/sisusbvga/sisusb.c | 34 +++++++++++++++++-----------------
 drivers/usb/misc/sisusbvga/sisusb.h |  4 ++--
 2 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.7.4

