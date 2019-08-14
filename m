Return-Path: <SRS0=XFIG=WK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44726C433FF
	for <linux-usb@archiver.kernel.org>; Wed, 14 Aug 2019 02:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FA2820679
	for <linux-usb@archiver.kernel.org>; Wed, 14 Aug 2019 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565749855;
	bh=eDIjUeLpecjzz80joUlEhc7fZX/UocoNem/siJ3IjAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zZDnKEd5t27KvD3Ib99l3csdY/zWN79anOPr4zJ7zaxOVdGOZShfQc79HQXyiMd8k
	 6ng+vJExmrNaSzPt9sLEvNrYaKI1pPLXGL9gleb0bQd3eAATG6UV8O4r8uAn0HlREB
	 48cS/i23bBLg7R8a0Jes2klm+1OXOWGJHhAgj+8g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbfHNCQ7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Aug 2019 22:16:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:48306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729230AbfHNCQz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Aug 2019 22:16:55 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CC00216F4;
        Wed, 14 Aug 2019 02:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565749014;
        bh=eDIjUeLpecjzz80joUlEhc7fZX/UocoNem/siJ3IjAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PbjIF5pjZwMC2RAzD4MrxYIxNPDcd90+kMn+xUEgqY3L8ZEyQEULompkIPGkNSTA3
         2gejsP85dG9NnpN0OrFp7ZjTbSGlIxIbN+lA4NNiSFE8iXVkY+1M3BPgf1bBH9p1RY
         ypDgp21mBynpOXE0IVFKjGW+sSLwBQ9w0kwp68Jk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Denis Kirjanov <kda@linux-powerpc.org>,
        syzbot+3499a83b2d062ae409d4@syzkaller.appspotmail.com,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 36/68] net: usb: pegasus: fix improper read if get_registers() fail
Date:   Tue, 13 Aug 2019 22:15:14 -0400
Message-Id: <20190814021548.16001-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021548.16001-1-sashal@kernel.org>
References: <20190814021548.16001-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Denis Kirjanov <kda@linux-powerpc.org>

[ Upstream commit 224c04973db1125fcebefffd86115f99f50f8277 ]

get_registers() may fail with -ENOMEM and in this
case we can read a garbage from the status variable tmp.

Reported-by: syzbot+3499a83b2d062ae409d4@syzkaller.appspotmail.com
Signed-off-by: Denis Kirjanov <kda@linux-powerpc.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/pegasus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index f4247b275e090..b7a0df95d4b0f 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -285,7 +285,7 @@ static void mdio_write(struct net_device *dev, int phy_id, int loc, int val)
 static int read_eprom_word(pegasus_t *pegasus, __u8 index, __u16 *retdata)
 {
 	int i;
-	__u8 tmp;
+	__u8 tmp = 0;
 	__le16 retdatai;
 	int ret;
 
-- 
2.20.1

