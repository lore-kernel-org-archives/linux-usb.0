Return-Path: <SRS0=ajTD=7H=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69684C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 25 May 2020 02:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D53F207C3
	for <linux-usb@archiver.kernel.org>; Mon, 25 May 2020 02:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wakvVeLU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388712AbgEYCuv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 24 May 2020 22:50:51 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56580 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388422AbgEYCuv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 May 2020 22:50:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P2ooQt094031;
        Sun, 24 May 2020 21:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590375050;
        bh=2RxAorb+kMUb+0ShP8Wwq6wbvvGDp2v4uczeOOKZ5YA=;
        h=From:To:CC:Subject:Date;
        b=wakvVeLUDPUTjQYpmUszzfELPGGUbx1N+R2OkVvchoFNx9o2Z42iQWCQb8dM15HuG
         8e2poxV6rFfRMnk692urGpd76sceETLuAYXABBWCMGFRXjrInqc4qZd3Jn7lqUZmrM
         xeKObJwTZ/QFrHwFmgmvT1KLTC5e4HVq4KKBbrYA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P2ooSL101827
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 24 May 2020 21:50:50 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 24
 May 2020 21:50:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 24 May 2020 21:50:49 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P2onNi023969;
        Sun, 24 May 2020 21:50:49 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 0/6] musb patches for v5.8-rc1
Date:   Sun, 24 May 2020 21:50:43 -0500
Message-ID: <20200525025049.3400-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are musb patches for v5.8-rc1, including some fixes which were late
to get in v5.7. I cc'd stable@ in some of them but wanted the rest fixes
to sit in v5.8 for a while before backport to stable.

Please let me know if any change is needed.

Thanks,
-Bin.
---

Bin Liu (2):
  usb: musb: return -ESHUTDOWN in urb when three-strikes error happened
  usb: musb: start session in resume for host port

Dinghao Liu (1):
  usb: musb: Fix runtime PM imbalance on error

Jason Yan (1):
  usb: musb: use true for 'use_dma'

Macpaul Lin (1):
  usb: musb: mediatek: add reset FADDR to zero in reset interrupt handle

Paul Cercueil (1):
  usb: musb: jz4740: Prevent lockup when CONFIG_SMP is set

 drivers/usb/musb/jz4740.c       |  4 ++--
 drivers/usb/musb/mediatek.c     |  6 ++++++
 drivers/usb/musb/musb_core.c    |  9 ++++++++-
 drivers/usb/musb/musb_debugfs.c | 10 +++++-----
 drivers/usb/musb/musb_host.c    | 10 ++++++++--
 5 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.17.1

