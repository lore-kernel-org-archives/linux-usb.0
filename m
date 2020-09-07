Return-Path: <SRS0=Mbrg=CQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEB7C433E2
	for <linux-usb@archiver.kernel.org>; Mon,  7 Sep 2020 15:51:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EA4C21741
	for <linux-usb@archiver.kernel.org>; Mon,  7 Sep 2020 15:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERCTfdWo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgIGPvW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 7 Sep 2020 11:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730108AbgIGPvI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Sep 2020 11:51:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E530EC061573
        for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2020 08:51:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e33so8220556pgm.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2020 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Lf5JI/5EngLrcYSVXwIufn068kTxx2rWtJHNGWaQh0=;
        b=ERCTfdWoTZkFD+5wD+JEtW3plu4KNoCwrju0nSQTSPkQ3KWl3N30rEuyAkBzY343hu
         f3fFA3hzjINlp/l+bm3UTRwshwWWdXocRHaZiTWzkHUPAkLhToC9Hom+iIGOFsIDAvD1
         Yis9Da8qNjmcnzJfFeXmDcf/kEOWsKMIkFlv60szdJu1ehRPGRkSFBB73/1kN4NdZ5na
         PUFL8PeRGVl5QQ6BHAqPtgHQ6P5SeifghuNF+75PCTS/KP0+l4iJMdvQX8qs6ZQvgZ2C
         Bt5VxahpcvJ1nDOfpau8LO8VLQjbjqkKT5X2apKtwoQvwbXJ02KIT3H8R3uVA9lAqWi0
         IQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Lf5JI/5EngLrcYSVXwIufn068kTxx2rWtJHNGWaQh0=;
        b=Ii/hMYFY8OlT49exHZC1jdAyUaF5OOb0HOT6+4MejISdwRQK5EIs6/Q9vtrSrIEbSP
         vp+Scvb22CF7O1L2NGMNgiJhIdDvcgKwEMTWWiLL7nT1YCCE8TTv1ctjIUNjMcCWRNA5
         VonAe8R56IvsaICogpkhIEjJnLlzo3z1ei9Ph5ShD7QvNDP53SZT646NAddkr1eP9sZc
         spZwHspPzTVjSHJDCe7HfaXmScEmzkM0JdeNzRl+zN50EUc9Li7ZQd/Zn1d6D35panBJ
         3R1zTtyFIbNNlT0SJN/etepWw01oG5NNDh2hT/aPpi+8pTwbT1vWUsFVCqNyB5jtbIg9
         JegA==
X-Gm-Message-State: AOAM532B7GfbvZklwkMHGPkB2yjXN/fROQk2jlQlMoXUOJNXlgYYib/F
        08d0CxRNCk64aI4qRzzxK5E=
X-Google-Smtp-Source: ABdhPJykUtiZY9jsicWKP6vP4OPAjz7LWQ2D5BcYYXB4vxfjOfarbBvzpUtPcC4PxviBpbcaixyWoQ==
X-Received: by 2002:a05:6a00:4c:: with SMTP id i12mr8603965pfk.157.1599493867511;
        Mon, 07 Sep 2020 08:51:07 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id g17sm12745967pjl.30.2020.09.07.08.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 08:51:07 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH v3] USB: hub.c: decrease the number of attempts of enumeration scheme
Date:   Tue,  8 Sep 2020 00:50:51 +0900
Message-Id: <20200907155052.2450-1-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAEt1Rjq+Fz85KU-aKO+boNE5yL7GiwdopmRd3-FxEL+mzEui-g@mail.gmail.com>
References: <CAEt1Rjq+Fz85KU-aKO+boNE5yL7GiwdopmRd3-FxEL+mzEui-g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yasushi Asano <yasano@jp.adit-jv.com>

Dear Alan
Dear Greg

I added the log which was not applied this patch and the log which 
was applied this patch to the commit statement. When this patch is 
applied, enumeration failure is detected within 30 seconds and 
the PET test is passed.

In addition, I also fixed the error output which is pointed out 
from the kernel test robot. 
I would appreciate it if you would advance this PR. 
Thank you in advance.

Yasushi Asano (1):
  USB: hub.c: decrease the number of attempts of enumeration scheme

 drivers/usb/core/hub.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

-- 
2.7.4

