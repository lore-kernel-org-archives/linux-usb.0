Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3042C10F00
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A98D62186A
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="DFL2WwKL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730590AbfDENgD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 09:36:03 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:44666 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfDENgB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 09:36:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E128227E0350;
        Fri,  5 Apr 2019 15:35:59 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id hirt0q2Au4V6; Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E4C3727E0353;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E4C3727E0353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1554471357;
        bh=vecTqGFgdLv8rRI+KTl+LZSxyTcfodA8bYPVKNBxkrY=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=DFL2WwKL/tfBipaw4nqW+2pnIMjgledNILKn46YrdOOIKj1mu8mwew0sI41PKdDc1
         ej6JAhrB7Gaxdk0LNLCRcRjJ+VSexcYoTvtDOFQAWOi7stU0KFj1pwkft8XkVJqGpZ
         ivwC2Mf87t8l9WjVl2tn6FtIBNGUZgcVZNsEcz7k=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id maQOI9hkKZII; Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id AAECC27E0347;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH v2 1/5] usb: dwc2: Move UTMI_PHY_DATA defines closer
Date:   Fri,  5 Apr 2019 15:35:29 +0200
Message-Id: <20190405133533.2203-2-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.21.0.196.g041f5ea
In-Reply-To: <20190405133533.2203-1-jmaselbas@kalray.eu>
References: <20190405133533.2203-1-jmaselbas@kalray.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190405133529.qNmoJ-r5ab1YuZkqqup3MObo9DgJ7UCjy08czmmblBM@z>

Makes GHWCFG4_UTMI_PHY_DATA* defines closer to their relative shift and
mask defines to improve readability.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 drivers/usb/dwc2/hw.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 98af924a9a5c..7dbf392783c4 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -310,12 +310,12 @@
 #define GHWCFG4_NUM_DEV_MODE_CTRL_EP_SHIFT	16
 #define GHWCFG4_UTMI_PHY_DATA_WIDTH_MASK	(0x3 << 14)
 #define GHWCFG4_UTMI_PHY_DATA_WIDTH_SHIFT	14
-#define GHWCFG4_ACG_SUPPORTED			BIT(12)
-#define GHWCFG4_IPG_ISOC_SUPPORTED		BIT(11)
-#define GHWCFG4_SERVICE_INTERVAL_SUPPORTED      BIT(10)
 #define GHWCFG4_UTMI_PHY_DATA_WIDTH_8		0
 #define GHWCFG4_UTMI_PHY_DATA_WIDTH_16		1
 #define GHWCFG4_UTMI_PHY_DATA_WIDTH_8_OR_16	2
+#define GHWCFG4_ACG_SUPPORTED			BIT(12)
+#define GHWCFG4_IPG_ISOC_SUPPORTED		BIT(11)
+#define GHWCFG4_SERVICE_INTERVAL_SUPPORTED      BIT(10)
 #define GHWCFG4_XHIBER				BIT(7)
 #define GHWCFG4_HIBER				BIT(6)
 #define GHWCFG4_MIN_AHB_FREQ			BIT(5)
--=20
2.21.0.196.g041f5ea

