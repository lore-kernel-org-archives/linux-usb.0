Return-Path: <SRS0=W/rD=DC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D3AC4363D
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 16:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45CD322B2D
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 16:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="MyjPr3PF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgIYQCW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 25 Sep 2020 12:02:22 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33450 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727151AbgIYQCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 12:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HKghntozPatqSbIa/0iRutbq7qGVa77/QxXE6pFe7/c=; b=MyjPr3PFKliFzdaHSujYR948/N
        qZJG2PRlLlbPstWzLHwVD/l4LVR239gDLp9YiDB/zkxHVCEFA43o4Ay5va25RSXVGiaGQokBuN72s
        TrhL+PzIwI1UbzqdEyFq8xqkpTsLL4JN9JLXstLmz7PqB73wHy9JiNp02j3OexAwiBlo=;
Received: from [94.26.108.4] (helo=carbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kLqAr-00024z-GS; Fri, 25 Sep 2020 19:02:17 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH 0/2] [patch v2] utilize the new control message send and receive API
Date:   Fri, 25 Sep 2020 19:01:58 +0300
Message-Id: <20200925160200.4364-1-petkan@nucleusys.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925143730.GA3111407@kroah.com>
References: <20200925143730.GA3111407@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

As discussed at the linux-usb this patch series is moving from old style
usb_control_msg() to the new API.  For obvious reasons we don't want to open
code usb_control_msg_send() and usb_control_msg_recv() functions.

Petko Manolov (2):
  Convert Pegasus' control messages to the new
    usb_control_msg_send/recv() scheme.
  Convert RTL8150's control messages to the new
    usb_control_msg_send/recv() scheme.

 drivers/net/usb/pegasus.c | 56 +++++++--------------------------------
 drivers/net/usb/rtl8150.c | 32 +++++-----------------
 2 files changed, 15 insertions(+), 73 deletions(-)

-- 
2.28.0

