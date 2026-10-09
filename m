Received: from cvsmtppost24.nm.naver.com (cvsmtppost24.nm.naver.com [114.111.35.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E684418E4
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548827; cv=none; b=EaBHmXVC+gn1rBkCopnuDfc4JGyrKWyGoZ+3p2dIJZt6dK3jI+9+02JNtAWrO/YRhqHrv/oOmpfy+M3dmQnrqIYHV90XGCE/a5i1VVRyFcxs8Ajf1uogvTV9aI01rdGXV3ZygmW80U1Q0g8+L6G3xozLJvxEXBABmGiyzllSm8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548827; c=relaxed/simple;
	bh=CE07XgwAI7Xw8ro1B/mgyuiJ8s4IvRawHQFwra6RmeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYvSKJtmd6EIq5IKK3b/sJHIIr2Ur6pdC7CCSEt6FjDXNniPx7NzPv8Oq8sLPRR0lugg29/8Z8S5cTDkDFwgaO4jw0NlLYMkow7fWwErT/WET8fM1i+9B6kVLeT4kQaaECxFk2nNqm040Ud0FvQIbXrg+9HMZOJGbv+2oRuV0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=uAgHYiN8; arc=none smtp.client-ip=114.111.35.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="uAgHYiN8"
Received: from cvsendbo038.nm ([10.112.24.45])
  by cvsmtppost24.nm.naver.com with ESMTP id VusRlrWxRNG2eEENUcuhfA
  for <linux-usb@vger.kernel.org>;
  Fri, 09 Oct 2026 12:26:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791548809; bh=CE07XgwAI7Xw8ro1B/mgyuiJ8s4IvRawHQFwra6RmeY=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=uAgHYiN813dzEM420FrMkGU9RzvE1EmIHrHcy2BC/okn7Vipch6v/EkDlg3jWGxUu
	 qWeC2M3yeZUvmldYrCfcMw4mmuSpj99XJXvhLaIE8ci3TFpUxZS4Wswv9/oK9likKv
	 Qvm3r5gsS1UyxPVGUoZZqFbdNr421yWrefcFizjJ5+V1Zc897Bz+f6XCDryEnuE6VG
	 Lf1UVZe4ZYQ5y5FH4vE5kiNMY7YprwuEfxvVpHT4/u7TQV6M/6yIE+zBhndkw1AagN
	 L46L2HXdBd+p8cOzIsmjBvpAEVkVMVqKACKQ/RGS81WuxhkmS0Q1ygoqbmotzTX8VV
	 IoFmX6qKWwcPQ==
X-Session-ID: LJkL3x9xQLy8d8TJ7HecwQ
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKBmqjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: /qYwFxulFqJZ+HmlKAtr+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp004.nm.naver.com with ESMTP id LJkL3x9xQLy8d8TJ7HecwQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 09 Oct 2026 12:26:49 -0000
From: Sung Byeongchan <tjdqudcks0424@naver.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org
Cc: linux-usb@vger.kernel.org,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH] usbip: clear actual length after receive failure
Date: Fri,  9 Oct 2026 21:26:36 +0900
Message-ID: <20261009122636.642575-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB/IP peer supplies actual_length in RET_SUBMIT. usbip_recv_xbuff()
rejects a value larger than the URB transfer buffer, but the VHCI error
path gives the URB back with the peer-controlled length still present.
usbfs subsequently uses urb->actual_length as its copy-to-userspace
extent, reading beyond the transfer-buffer allocation.

On current mainline target 0c2669a9f4a1d, a 65-byte completion for a
64-byte URB produced a KASAN slab-out-of-bounds read in _copy_to_user in
three fresh boots. INT_MAX reproduced the same first invalid consumer
three times. The one-byte case modified only a boolean sentinel oracle;
the copied value was not collected or characterized.

Clear actual_length when receiving the transfer buffer fails. No payload
is valid on this error path, and zero prevents downstream consumers from
reusing the rejected extent. The existing protocol-error path closes the
broken transport.

The fixed kernel rejected both triggers without KASAN in three fresh
boots each. Normal zero through buffer-length completions, OUT and ISO
controls, high-bit counterexamples, disconnect cleanup, and a following
valid transfer on a fresh transport remained functional.

This issue was found through manual source inspection assisted by an
AI/LLM, then evaluated with local production-path dynamic validation.

Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
Assisted-by: LLM
Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
 drivers/usb/usbip/vhci_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c898375..741107a964660 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	/* recv transfer buffer */
 	if (usbip_recv_xbuff(ud, urb) < 0) {
 		urb->status = -EPROTO;
+		urb->actual_length = 0;
 		goto error;
 	}
 
-- 
2.43.0

