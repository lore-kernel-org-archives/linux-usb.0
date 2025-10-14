Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758423002B9;
	Tue, 14 Oct 2025 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760456464; cv=none; b=AGuR2evMBNuH2hAuHr7QEYW258rUHZQjZS2epCUdW3LqjMiXTy/0UGuGMN0TINlj+Yw8VknVF6f6Zo7CVwpTuBTtUsiBajmANHus38LUN4g9DnYh7zwooEeR3rYQg+rlRJh6TK2em5OET+Aqu0yTvB96v5yqMhybbcAXRAWWdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760456464; c=relaxed/simple;
	bh=8wBztog1o9RmEJQUw+rIcYfKQ+x7c1yrkIp9siSRrjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umObgCUxq9V+VEtAGNv6n9k1Bnm5JAXY+qB50qsQadxUJnGsH0jOjnmFe6PdIXpBvYajd2Hb9Z+jb6hzioRIyJollb6+KdUjfhZVdQdjsKlrumKMh2Iqwg9KXWVByYkgY3igIW3eoBnz/7LBSzpYv6yGhfZ2Z3y/AkMRFpZM7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=jAtqjD12; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="jAtqjD12"
Received: from wse-pc.fritz.box (p508786f1.dip0.t-ipconnect.de [80.135.134.241])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id CCEB12FC0071;
	Tue, 14 Oct 2025 17:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1760455857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8l/EM4ApjURTjIpcqPetumckaTRZoeff5AJN3jt7gjQ=;
	b=jAtqjD12LgZ0V0TPWtsvO1YHTZrZtxBDLFyGi+74X+EAEug9Hp5T4sqNjO7LYZ5cSRsuYB
	U2ZokIoiCqnuCQQjeU3haYyhNSImww1fT/E4x2mMVIRQDUAqRGP2Fc13jy0tUX7k43mSpS
	o2NodgQHGtA/KbpVdtfBacQ6jDEeRmI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb/core/quirks: Add Huawei ME906S to wakeup quirk.
Date: Tue, 14 Oct 2025 17:30:05 +0200
Message-ID: <20251014153049.91722-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>

The list of Huawei LTE modules needing the quirk fixing spurious wakeups
was missing the IDs of the Huawei ME906S module, therefore suspend did not
work.

Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/usb/core/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index f5bc538753301..39fbbc31e9a41 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -469,6 +469,8 @@ static const struct usb_device_id usb_quirk_list[] = {
 			USB_QUIRK_DISCONNECT_SUSPEND },
 	{ USB_DEVICE(0x12d1, 0x15c3), .driver_info =
 			USB_QUIRK_DISCONNECT_SUSPEND },
+	{ USB_DEVICE(0x12d1, 0x15c1), .driver_info =
+			USB_QUIRK_DISCONNECT_SUSPEND },
 
 	/* SKYMEDI USB_DRIVE */
 	{ USB_DEVICE(0x1516, 0x8628), .driver_info = USB_QUIRK_RESET_RESUME },
-- 
2.43.0

