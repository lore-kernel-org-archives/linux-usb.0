Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07E3C4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D09F2186A
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="DUom28i2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbfDENgA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 09:36:00 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:44634 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfDENgA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 09:36:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 4292227E0351;
        Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id z_yANV8XoY7D; Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id D647527E0350;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu D647527E0350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1554471357;
        bh=e/qHMmTrQdIijaAqL7bBvz8Rb2NYfsgUXAcGseJIdaA=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=DUom28i2GzBL+etPuElhhPB7oXKC+dyh+KopxQbV2yxrM0QQdkQahf+X+ac41wobH
         L/kkVuRCg5ybt9uIP336tgLrh8qoXmCU6GyC7xcsXjoAdIMNUPfn+9kMC1yXBm7iV/
         XHJt63/bETGmRl+/OoXCSuuckT+6+7zTEhCxPjb8=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id hUGRuDf52jyE; Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 9BF1827E0345;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH v2 0/5] usb: dwc2: Improve gadget phy init
Date:   Fri,  5 Apr 2019 15:35:28 +0200
Message-Id: <20190405133533.2203-1-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.21.0.196.g041f5ea
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Theses patches tries to clean a bit dwc2's phy initialization and
fix an issue in gadget mode where the utmi phy width is set
regardless of utmi being used or not.

I believe that when using ulpi a phy width of 8 bits must be used,
but this wasn't the case as the variable phyif was set by default
to 16 bits.

In this second patch-set version the last two patches are optionnal,
from my point of view they are not essential for me but I hope they
can improve this driver.

Best regards,
Jules
---
Changes in v2:
  - Changed patches order
  - dwc2_init_fs_ls_pclk_sel is now declared in core.h (to be used in hcd=
.c)
  - Fix patch `Replace phyif with phy_utmi_width` (wrong value set to usb=
cfg)
  - Add check for utmi phy type in patch `Replace phyif with phy_utmi_wid=
th`

---
Jules Maselbas (5):
  usb: dwc2: Move UTMI_PHY_DATA defines closer
  usb: dwc2: gadget: Remove duplicated phy init
  usb: dwc2: gadget: Replace phyif with phy_utmi_width
  usb: dwc2: Move phy init into core
  usb: dwc2: gadget: Move gadget phy init into core phy init

 drivers/usb/dwc2/core.c     | 199 ++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc2/core.h     |   4 +-
 drivers/usb/dwc2/gadget.c   |  36 ++-----
 drivers/usb/dwc2/hcd.c      | 190 ----------------------------------
 drivers/usb/dwc2/hw.h       |   6 +-
 drivers/usb/dwc2/platform.c |   5 +-
 6 files changed, 213 insertions(+), 227 deletions(-)

--=20
2.21.0.196.g041f5ea

