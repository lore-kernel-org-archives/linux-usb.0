Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554221;
	b=s+E2IcCnCFru67gnk47DnL80o2NfrC5Yyb/KlWEvr5EkZFejRh1enZr7/ex/BsYtKkL/
	 EtlFX5YBYpJY+jzTU9L7SshHFAgP8D/u6ks5xeLjIUaAzRTGAwFn3SLScJBJlEthzFgai
	 HWspLHI7aGX7U61BYavQYTwLS1a+xmh9F7aDRVoUSlrvFc32QdUc1gnFipAMQW6szVu3/
	 y1+MmRK/4Y11eKzDeMddigGTUKtcrS2dMVmiLCUtWmntzzdiyBZoQXexy6W9fudKIqIBB
	 5QWWxS+3ebMCP8pFp1VkGoUVoW7Gu0FbkfuCfjdXeJb2gGO67fVo4UnHgnRI2xKhWFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554221;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8ZyV1iF1j5VAvwf/fPYCUYBLTLU/fKGnHzpgnFB+TZc=;
	b=rmpMeSBRoohxstFfz/fktU6wpqAmc8HEzCzTNHrfxhYmI1PlWhXwqnbARyGLeExyhNC9
	 lj90GAGrHY23zKHjKyOanIcYdaUXJOQ3EAZ4IUTj/E3MSUhCQhh/CNyzojwM9CFVBUSPr
	 s6hNg+HJAipy/r7NtYLCBSZz0lfjitNkMb616nQqEt+32HurHncQ7WgLSkPSvUBCi17Fl
	 JBskH6qqD6XW6sAhX2j//hZNPVWh57X/aNBEvL1Da5E99z9+jRdKofmikM7jHWs/1yrXR
	 inRsSRRzcm6JOwVLkt9V8tmQcIZkYAL+sQ+pNJSVDQenTha0oADEIF5LUuQDsUAKjUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vandenheuvel.online;
	spf=pass smtp.mailfrom=vandenheuvel.online;
	dkim=pass header.d=vandenheuvel.online header.i=@vandenheuvel.online header.a=rsa-sha256 header.s=protonmail2 header.b=jD9jVolH;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562CD606A334
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 17:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562CD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vandenheuvel.online
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vandenheuvel.online
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vandenheuvel.online header.i=@vandenheuvel.online header.a=rsa-sha256 header.s=protonmail2 header.b=jD9jVolH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vandenheuvel.online;
	s=protonmail2; t=1793554217; x=1793813417;
	bh=8ZyV1iF1j5VAvwf/fPYCUYBLTLU/fKGnHzpgnFB+TZc=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jD9jVolHOmiyCbYjzMLeOLo23ezCJPKRzGfFuxlXm18lntvi3kqjc+KS/4iKwZL92
	 3wEZ9hzlDfQO3j2YPApRW4/qYcvo3JQEQ2S+OVhYOiKs8NHVi+KiUfZ4WX7Gn0m5Bz
	 95IqZCh0Hm1RGmCxTZ+ko/qg0ey7mVMKo8wcaMxp1cNvFGsh9PefMKmFERCGWwYnKY
	 3nUs8XHC4A/SjiBprodL8TkEIN85ZLPrgjlXx1fwZrDGM3jfr09G2vQNsXGPGj9ppJ
	 Hepdrfwam1LmjM0XuQ9JFR4FWVN6EE44k9pJdXvK78khCUqtbuQTkr5jSX2APAFxat
	 412xjwA632p/Q==
X-Pm-Submission-Id: 4jHhgD0gMyz2ScWr
From: Bram van den Heuvel <bram@vandenheuvel.online>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	Bram van den Heuvel <bram@vandenheuvel.online>,
	stable@vger.kernel.org
Subject: [PATCH] USB: quirks: add NO_LPM for Kingston DataTraveler Duo
Date: Sun,  1 Nov 2026 18:29:44 +0100
Message-ID: <20261101172944.59384-1-bram@vandenheuvel.online>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kingston DataTraveler Duo (0951:173c) repeatedly disconnects and
reconnects when attached to a SuperSpeed root-hub port with USB 3 Link
Power Management enabled. The kernel logs only a plain "USB disconnect",
with no I/O errors or resets, and the drive re-enumerates about 0.25 s
later. On a Framework 13 (Tiger Lake TCSS xHCI, 8086:9a13) running
7.2.11, one drive re-enumerated 72 times in about 5.5 minutes. The same
drive also disconnects repeatedly on a Dell XPS from around 2016 with
older kernels, so the problem is not tied to one host controller.
Several drives of this model show the same behaviour.

The disconnects happen about 0.45 s after the host sends a command to
an idle drive, such as the first INQUIRY after enumeration or the
periodic media-change poll. Sustained reads are unaffected. This points
to the drive failing to exit U1/U2.

Disabling LPM with usbcore.quirks=0951:173c:k stops the disconnects
completely, including during a 497 MB read and accesses after idle
periods.

Another owner of this drive reported the same problem in 2021
(linked below).

The Kingston DataTraveler 3.0 (0951:1666) had the same symptom and
already has this quirk, added in commit afaa2e745a24 ("USB: Add NO_LPM
quirk for Kingston flash drive") after bugzilla #208257.

Link: https://community.frame.work/t/device-incompatibility-kingston-datatraveler-duo/11477
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222222
Cc: stable@vger.kernel.org
Signed-off-by: Bram van den Heuvel <bram@vandenheuvel.online>
---
Not boot-tested with this patch applied. I tested the same quirk at
runtime with usbcore.quirks=0951:173c:k, both on the kernel command
line and through /sys/module/usbcore/parameters/quirks.

 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index a4bcbe9..5ac44fe 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -425,6 +425,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Kingston DataTraveler 3.0 */
 	{ USB_DEVICE(0x0951, 0x1666), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* Kingston DataTraveler Duo */
+	{ USB_DEVICE(0x0951, 0x173c), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* TOSHIBA TransMemory-Mx */
 	{ USB_DEVICE(0x0930, 0x1408), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.56.0

