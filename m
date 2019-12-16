Return-Path: <SRS0=1PTI=2G=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473DBC2D0C3
	for <linux-usb@archiver.kernel.org>; Mon, 16 Dec 2019 16:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DBFE2067C
	for <linux-usb@archiver.kernel.org>; Mon, 16 Dec 2019 16:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l+OSsbqX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfLPQT1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 16 Dec 2019 11:19:27 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53986 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfLPQT1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 11:19:27 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGGJQa0060385;
        Mon, 16 Dec 2019 10:19:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576513166;
        bh=KzjrfVJ7tM4niwbcGmu7SC0wQ+etZBmSFjKcmGXemOg=;
        h=From:To:CC:Subject:Date;
        b=l+OSsbqX13UqouG5PAl6UzTLfqPr+zvGPhB31uKNrG55wxpjd2TAtRIhVBwBl7xi3
         eG+VPo1w4tm3Tl9YV8R4A7cktC8Tn4zn6UCChqmOzdLTdUwUO43Kkyp2Yqhdn094ax
         nuVDvycQSXKj/+H9tmmweOvuvWN1deicsAgAMgg4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGGJQK9091993
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Dec 2019 10:19:26 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 10:19:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 10:19:24 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGGJO5b105067;
        Mon, 16 Dec 2019 10:19:24 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 0/2] musb fixes for v5.5-rc3
Date:   Mon, 16 Dec 2019 10:18:42 -0600
Message-ID: <20191216161844.772-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are couple patches for musb fixes for v5.5 -rc. Please let me know
if any change is needed.

Regards,
-Bin.
---

Paul Cercueil (2):
  usb: musb: dma: Correct parameter passed to IRQ handler
  usb: musb: jz4740: Silence error if code is -EPROBE_DEFER

 drivers/usb/musb/jz4740.c    | 7 +++++--
 drivers/usb/musb/musbhsdma.c | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.17.1

