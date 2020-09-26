Return-Path: <SRS0=HY1r=DD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C53C2D0A8
	for <linux-usb@archiver.kernel.org>; Sat, 26 Sep 2020 09:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87E54238E2
	for <linux-usb@archiver.kernel.org>; Sat, 26 Sep 2020 09:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="a0IXdxf/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgIZJNh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 26 Sep 2020 05:13:37 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33712 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725208AbgIZJNh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 05:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=go/GaGWLYygNLiBbE4FTR7jxg7MC9xdFSKqfaaL676Q=; b=a0IXdxf/9FUHhoNPStg4Dz5c52
        rUun8GE0sCONEj3aheVaXDodCkU3S1wXpzQRskaHfuBlwFODBIZ0VHvIoDZN6PzpMaxYLfZC2Veou
        ehNpm23vZTQ21fbaH4RU79rKgt7Ceevgoht6UR/4WbXtqKgyNCqWwaPhPggIO2ItGvfU=;
Received: from [94.26.108.4] (helo=karbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kM6Gr-0003As-Vh; Sat, 26 Sep 2020 12:13:34 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     oneukum@suse.com
Cc:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/2] Use the new usb control message API.
Date:   Sat, 26 Sep 2020 12:13:25 +0300
Message-Id: <20200926091327.8021-1-petkan@nucleusys.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923134348.23862-9-oneukum@suse.com>
References: <20200923134348.23862-9-oneukum@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

Open coding, ccasional improper error handling by the caller of
usb_control_msg() and not flagging partial read as an error requires a new API
that takes care of these issues.  It took the form of
usb_control_msg_send/recv() and this patch series is converting Pegasus and
RTL8150 drivers to using the proper calls.

Petko Manolov (2):
  net: pegasus: Use the new usb control message API.
  net: rtl8150: Use the new usb control message API.

 drivers/net/usb/pegasus.c | 61 ++++++++++-----------------------------
 drivers/net/usb/rtl8150.c | 32 ++++----------------
 2 files changed, 21 insertions(+), 72 deletions(-)

-- 
2.28.0
