Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AE73D7D7F;
	Tue, 23 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227347; cv=none; b=isj1VqcSb3ZPmcFbsS+bfU+/4o9GNeYAsp0JkCCb5fr08ObIsIRi1yF4X1dkzGolRc980vX8Qmb+M2OjbEoDJCB184wVebJhGASvSMpuW28c0PpijOzTnrpzQxELTfYaH3oVGilPpQ99gF6o+T7RjPG1KlUN7hHt01HjBytUBYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227347; c=relaxed/simple;
	bh=3RLKIG8ZoGt9Dp0NbyoSfE08+cDRcs98HUUBTe5FntM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXd4GovIfAcm1LJyQA+Xq4b3+P1NbhaFpU+BV+0nur0/y6WrXrK43rnfpkC+au1Z5cQbsxbypGthLGDMOxE/A5lWLdv3pBGYs/sfmNeDmtUHorqEuNlpRmPfeGI+SyzyKbrR4eMM/SYTHHXVokxao/lwAikCWX1t0ZLLaMuKP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkKXnyuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkKXnyuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBA01F00ADB;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=/eNI9335MWb84Fkb43tyAVHx6wuSlWBqLOecqamwSCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JkKXnyuhoXzwEeRLvWpoelReWFExJXpdiuO+2CuuadMcHfTqGvwiRVE8pb6sf640p
	 mFqRBkadyoTb2tmBBVlcFZjO8kYc8H7C4VfMtxNOz6Dos9JzNsgGCNXLeXNX6oWSLh
	 CIYiTfDT4MHsX0qRFL2Tl2WELVVTt/Qb9mEHuoUaUoEG23Jx1CEOagml0huahf60vY
	 1N9ruBPc7+KGAB3V9BEMyVHGMQA7MRoyxMDspXCRz0bohZ32EX6gbA8RzbuJbpKGcy
	 gqjtU50GimnqjEb6bgkmJutgT0HJEC+KPOp0V/JC3VO30MD4tnzL8qprHfESC9OE2s
	 3ATs6diGtkFyg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuW-1lA4;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 12/12] USB: serial: digi_acceleport: clean up inb command submission
Date: Tue, 23 Jun 2026 17:08:26 +0200
Message-ID: <20260623150826.314727-13-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623150826.314727-1-johan@kernel.org>
References: <20260623150826.314727-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the inb command handling a bit by removing an unnecessary line
break and moving the assignment operator before breaking another long
expression.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 6a557fc1ad85..6790892ca2a4 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -453,11 +453,10 @@ static int digi_write_inb_command(struct usb_serial_port *port,
 		if (priv->dp_out_buf_len > 0) {
 			data[0] = DIGI_CMD_SEND_DATA;
 			data[1] = priv->dp_out_buf_len;
-			memcpy(data + 2, priv->dp_out_buf,
-				priv->dp_out_buf_len);
+			memcpy(data + 2, priv->dp_out_buf, priv->dp_out_buf_len);
 			memcpy(data + 2 + priv->dp_out_buf_len, buf, len);
-			port->write_urb->transfer_buffer_length
-				= priv->dp_out_buf_len + 2 + len;
+			port->write_urb->transfer_buffer_length =
+					priv->dp_out_buf_len + 2 + len;
 		} else {
 			memcpy(data, buf, len);
 			port->write_urb->transfer_buffer_length = len;
-- 
2.53.0

