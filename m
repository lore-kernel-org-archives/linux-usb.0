Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B7B2989B5;
	Wed, 11 Mar 2026 23:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270409; cv=none; b=bYH2KggxlKFJILdfJPhDTPyzF5Xd/JzxtUaxH3Ues+ZGbq90yHE5bst5tRucaVnMDPazAKr0s/Rl+h4RLsHRskYRPoNB+DD79wdqB21eQDjQ5JJEiRs5HJtOpiKtXtMjQ6nKAdonHBPZ+8kgnjwIHmeqMFZGBEme6DUN8GzaM8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270409; c=relaxed/simple;
	bh=nyCis1OKm867BGk54vBM7sp6aWigeD6z3A7a10n9BmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r4oN3QTh/Id5jt3F5s1FWw0ZtcZRqM16Zp4QvhSgWDxWFp/nTuU+pzL51oaDfT8QsAoPlXim9wn1NGDFtQKV3PzK0ZiXk+cqBwm3/vUvFzY1duzF021+eGIbJV14TrqN/IqCEglnqHBWl1vQN4EkCoedsdrXjEYyYOaEecr0aGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7toUs4c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7toUs4c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08809C4CEF7;
	Wed, 11 Mar 2026 23:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270409;
	bh=nyCis1OKm867BGk54vBM7sp6aWigeD6z3A7a10n9BmE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=e7toUs4csjuJvgq8ohVhWy2bPVlGDCSRO259nEFgNVZ1/9uqjD9y3wgKD04BjJY/i
	 QE1hm/ZVTTzuHAET2qz39vbW/lSmCjfLyd6PcACpAVGaS9AEuB1j9o8yEmd3jN7Ty/
	 u5MYYRaOmiK7Yp0+9ArjptzSLS6l7dtbpW4gmxcI923CTSCFLXQyhmgLxpjciPnFM5
	 cIvcezSWV2tT7gq7s4MQX2hYLsORJaeC8KNHpxuTDyR8NkxGpHONDU3UXohLM0SqDb
	 7N9UInXOe6Oyj7Wp+jgXbXecf1e0mr1rdFRrtMCW8NGsLhzBarxvum+qgZABFuNFQA
	 lILvH2aLKh/tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4DD103E2F1;
	Wed, 11 Mar 2026 23:06:48 +0000 (UTC)
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s_via_B4_Relay?= <devnull+bence98.sch.bme.hu@kernel.org>
Date: Thu, 12 Mar 2026 00:06:35 +0100
Subject: [PATCH] USB: core: Use `krealloc()` in `usb_cache_string()`
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBewrQzcq8gOaZfOMFclURmI7
 75ux+/w/wcYq7DBrTlAeReTuVS4SwNppPJklEc1+NZf2+AcbhbxpUzTNCfsuHMh+9BTn6Emi3K
 Wz3833KsjGWNUKmn8Td5kKyuc5xcU/ug4dwAAAA==
X-Change-ID: 20260311-usb-krealloc-4e413f239a9f
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773270407; l=1845;
 i=bence98@sch.bme.hu; s=20260213; h=from:subject:message-id;
 bh=ryeZKOW7CoNcTvHQhdlplcN1pMIWzqbmCO+DbTrOUHo=;
 b=TQXh95Qshna5DUlvdb+3cekUBsb7EGBbjdiOEEpRVdGjKu6uCnWEJ6F4M+n8xqlupNwBMgqIk
 uDLpQEFx+8DAwBBrbkN3uqDNpMaYsnT+UqcAEygIWIgk9Vtrtj9nuHU
X-Developer-Key: i=bence98@sch.bme.hu; a=ed25519;
 pk=rtWE8PtqZ5ZMyUVCckDq8i1ASLxgUbV2fwDA8KaOli8=
X-Endpoint-Received: by B4 Relay for bence98@sch.bme.hu/20260213 with
 auth_id=636
X-Original-From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
Reply-To: bence98@sch.bme.hu

From: Bence Csókás <bence98@sch.bme.hu>

Instead of "shrinking" the allocation by `kmalloc()`ing a new, smaller
buffer, utilize `krealloc()` to shrink the existing allocation. This saves
a `memcpy()`, as well as guards against `smallbuf` allocation failure.

Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
---
Using `krealloc()` makes this code from 2005 more readable as well as
robust. Nested `if`s were also unrolled.
---
 drivers/usb/core/message.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index ea970ddf8879..dfe61d8b913b 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1005,7 +1005,7 @@ int usb_string(struct usb_device *dev, int index, char *buf, size_t size)
 }
 EXPORT_SYMBOL_GPL(usb_string);
 
-/* one UTF-8-encoded 16-bit character has at most three bytes */
+/* one 16-bit character, when UTF-8-encoded, has at most three bytes */
 #define MAX_USB_STRING_SIZE (127 * 3 + 1)
 
 /**
@@ -1026,17 +1026,17 @@ char *usb_cache_string(struct usb_device *udev, int index)
 		return NULL;
 
 	buf = kmalloc(MAX_USB_STRING_SIZE, GFP_NOIO);
-	if (buf) {
-		len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
-		if (len > 0) {
-			smallbuf = kmalloc(++len, GFP_NOIO);
-			if (!smallbuf)
-				return buf;
-			memcpy(smallbuf, buf, len);
-		}
+	if (!buf)
+		return NULL;
+
+	len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
+	if (len <= 0) {
 		kfree(buf);
+		return NULL;
 	}
-	return smallbuf;
+
+	smallbuf = krealloc(buf, len + 1, GFP_NOIO);
+	return smallbuf ? : buf;
 }
 EXPORT_SYMBOL_GPL(usb_cache_string);
 

---
base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
change-id: 20260311-usb-krealloc-4e413f239a9f

Best regards,
-- 
Bence Csókás <bence98@sch.bme.hu>


