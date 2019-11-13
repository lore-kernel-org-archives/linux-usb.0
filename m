Return-Path: <SRS0=2B3Q=ZF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6297BC43331
	for <linux-usb@archiver.kernel.org>; Wed, 13 Nov 2019 02:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CDFF222CF
	for <linux-usb@archiver.kernel.org>; Wed, 13 Nov 2019 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573610423;
	bh=XzZBn4TQb5p09UhPbtTd7mbOVh4J/ulq/n1RLpPhf3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tZa+TCbZzLtoEOzmSs3ouO24NczBqyD39ETejrCLGWrjeoi2EQb7Q121UmaQy+Qqa
	 /BnLPKI+Ly/uGCq3Ndpnak3IHruQp7bIj715n5j0iaZUWR9chU9x4hMh8M+3IIVSz4
	 pq3lJAtkjL22o/CW+YuuN/HIh5rFn6IO2pUdR2+o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbfKMCAW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 12 Nov 2019 21:00:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:55492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729618AbfKMCAU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Nov 2019 21:00:20 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4E1D22469;
        Wed, 13 Nov 2019 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610420;
        bh=XzZBn4TQb5p09UhPbtTd7mbOVh4J/ulq/n1RLpPhf3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OFuQ2E2W6Iu2o9Y76i4125wc8evNSjmdqmSdyUCNA16tkn3s9rpfBDzvE3jD8/zBp
         09zAmDpVCMO5exU2JGV0xxGMOaCEnbGjehGwnS/XJFc2wZBotXSST06ytJvFm9MycZ
         rDbZNk1nohVFT9ujIKS7y4Bk0ZKvQncIpNED1z98=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, Sasha Levin <sashal@kernel.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 30/68] USB: serial: cypress_m8: fix interrupt-out transfer length
Date:   Tue, 12 Nov 2019 20:58:54 -0500
Message-Id: <20191113015932.12655-30-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015932.12655-1-sashal@kernel.org>
References: <20191113015932.12655-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Johan Hovold <johan@kernel.org>

[ Upstream commit 56445eef55cb5904096fed7a73cf87b755dfffc7 ]

Fix interrupt-out transfer length which was being set to the
transfer-buffer length rather than the size of the outgoing packet.

Note that no slab data was leaked as the whole transfer buffer is always
cleared before each transfer.

Fixes: 9aa8dae7b1fa ("cypress_m8: use usb_fill_int_urb where appropriate")
Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/serial/cypress_m8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index bbeeb2bd55a83..2c915be1db4ce 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -773,7 +773,7 @@ static void cypress_send(struct usb_serial_port *port)
 
 	usb_fill_int_urb(port->interrupt_out_urb, port->serial->dev,
 		usb_sndintpipe(port->serial->dev, port->interrupt_out_endpointAddress),
-		port->interrupt_out_buffer, port->interrupt_out_size,
+		port->interrupt_out_buffer, actual_size,
 		cypress_write_int_callback, port, priv->write_urb_interval);
 	result = usb_submit_urb(port->interrupt_out_urb, GFP_ATOMIC);
 	if (result) {
-- 
2.20.1

