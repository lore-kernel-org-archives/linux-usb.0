Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027428;
	b=gl3hwwe8zfkx+tlzxrHo+kvjW+TZpG4NylEyR1umt3fNLRbtpqLMk0IJZkmo86mwoIQz
	 cvFmxaLWmP05kAJwrCN2Ne4vqce1fXGJZUIODFeW32mSnmORD+7TOZSV4X8K43tuoWybQ
	 xxGAcrrkl4DV73NkrdUg1n64IYL8DwM1FeVOB71CDlE4smGtBiwFoGNWUZG4IkOkOuEX4
	 8dQT6qB74Lpi5tidTz4/PHmA0eI7YzXzz9/b+ricyatKFwS6mhJlPwgUkLRHrjO3kiYlP
	 1GqJtUSokrRTdRYy43W1puYzDiiL1WURTDMzHpOa5QIdef9dOCFrfJyKst0+l/AxEDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=A8RfuNOxSUZHyY3m5Pl0sedIFFoX+UXPT1Yn9hXipnM=;
	b=y2H+8ljbE1R53IElaZV1vzXoB89EsTrI+v52XpjfB/huubnnkbExLmtWvlVNNuzjarN/
	 DAatBkM5T6TN574bO6qx0Q8Lm0GZ3XQ0dL34+/epTaQinfk04u/risbpDM+BLs8xJUsHR
	 uoLPSNjhCS2bREujyvWOL7dS5mRfKHrOcTGM9c36Her2+jcUWm4YRrcnS0ndzPpUSvsUY
	 Gj/wH7vJh3vvDBDDqLPCPyUmLWQI55/euH8w48oNxlYGltJSdHJQTg6AIjeoc3ckJfZ2n
	 detdNgZcToBlARw1a1sCSWZRApKI9KEARhl1y+OQJB50YZi+Se3bYfmF/GTY0KbwQZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XU73rdsF;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007E9606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 15:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 007E9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XU73rdsF
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1846bc43c28so3181382c88.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793027427; x=1793632227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8RfuNOxSUZHyY3m5Pl0sedIFFoX+UXPT1Yn9hXipnM=;
        b=XU73rdsFN1oKEcVT3dK1mfEWHRmZQihXLhi5YZHCf6pnlvKy9Rd+AGx4s6nGZu4bUf
         wuEZrevHn0tebKAotGiDLpwXNmqYiJL787GmGyTfvbINDdJn4X2/Ocs8ApcMeeJwJlBt
         EwHRAwEeGiK0we6/rCtdoRjJVfVCAdx5/Q407tTgfSF32GFgQsGg/jrxbw+0m3eqqvB8
         RkoY+9GXgnMmx5dBgYuvcTHSjqh7l+YBoHXMkVwCFHrsIe58+/6DCAyK4nCnY6GDSFqj
         FxUIQ+jfxMqlmstgrXjO53MCPRdN9Kn2Oybu8mx1LuOjDbkar2jxU4KP50Sc03ldd8NI
         Kx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027427; x=1793632227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8RfuNOxSUZHyY3m5Pl0sedIFFoX+UXPT1Yn9hXipnM=;
        b=NgG0epbYLaqJwPN0pgG7VYdmThN5NiXAvulyHoz2N/cANR5VTZT2Z+YESH97xAbm/e
         jq8iBCyjX8MpZ50D7K+3X9bMuElO5ZDHX26YydEr4bOR5mCS8Y+VeGFkIEm/SHhYj0Wu
         5hbxnS3NqjmVGF51JvjaRKdYVjseVNuQnaSh0egtUEA+pAO5Uf2SPgo7B17C+FHJ5stt
         hXTSsIiyT9pmMP2B7tIH8H1dTnSJ9EKuDuZAyF/RJ30TbjbjO+xCJBIua3e79RKEFqTG
         kEF1XrEYhXSMyZirkHxtWSUdGxis/2W6oGUaKABy32+h4ly2L2dJZoqFac8BWEel7Lfl
         c7Gw==
X-Gm-Message-State: AFq9FYLnNtoWhQe8mWA3vN4QsnHzUmpU6XCnBGVt+uaNpcUDq+3bjijd
	MEBoHNLY+9Hea8wai6vib7K5lY2ijNWmMx+z1jaQLb9JSgfetK+l8p4N
X-Gm-Gg: AYBFou1sn4fhhtYEa+i9Lgq3nJOrR4L+2Mcl0rXZ5ohZ6cYPMAZQjLnH7sz6a7IU98X
	uHLFuxtdZiLFPLd0fJMe93h6DvUHk/GEvrXiIqPtyqesjkv2UUknZGVN4MwwEEolJoKQE8cJPrL
	/pDglQOwaJ5d23Q/A+KkD3evr8qyJ2O8MalRS30bDQ99Wyc2PCgCNwEh6YyDAszuQo2WjlvtswJ
	iShCEQe9oIA4yHLd34Il62K/9wdEeToICcMg8Ql5ZAlzc/+OcYvo2muTK5NGGQlmiGAdTH30j8i
	9OlIR9e3E6wViO2GND0iXu80K3zR4v5gk3kGQETZQASgG8cYErMBcPaXIi5PaX1ZDb25nFzHZBP
	scA3zxmrJrXvu/5AGzpQN6IFJGRtvHqpcQM+qb2QX3Mh7N5TAgghdMMq9WR0mdK/3CwcPamNhGk
	NMbPIzBIZA0pRsJhIOPaxO0uQNglEC05PKzgAcTsckMNKCYGh3JmA/6hBuaRbsqBLAeFicNj5qA
	QDeFije18S9bFLwee6Cx9t/3JkAkzZ4gNcvfnyHdpgV5uSYJWuc6NyM+f5Br9jKILs=
X-Received: by 2002:a05:7022:6982:b0:150:1cea:31a8 with SMTP id a92af1059eb24-19935be8443mr16206375c88.19.1793027426705;
        Mon, 26 Oct 2026 08:10:26 -0700 (PDT)
Received: from localhost.localdomain ([154.17.21.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm24603548c88.3.2026.10.26.08.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:10:25 -0700 (PDT)
From: Weiqin Zhu <zwq939681378@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: core: quirks: Skip device qualifier for BEITONG BTP-PG01A
Date: Mon, 26 Oct 2026 23:10:03 +0800
Message-ID: <20261026151003.16869-1-zwq939681378@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The BEITONG BTP-PG01A wireless controller dongle initially enumerates as
4131:800c. Device qualifier requests fail with -EPIPE, followed by
failures to read the configuration descriptor. After port recovery,
the dongle can enumerate as 045e:028e with only two interfaces, leaving
the vendor configuration software unusable in a Windows guest.

Add USB_QUIRK_DEVICE_QUALIFIER for 4131:800c to skip device qualifier
requests. The dongle then enumerates as 20bc:5162 with five interfaces,
including three HID interfaces, and the vendor software works through
USB passthrough to a Windows VM.

Tested both usbcore.quirks=4131:800c:i and the built-in entry on an xHCI
host. The patched kernel was tested without a dynamic usbcore.quirks
entry. The configuration-request size quirk alone did not resolve the
enumeration failure.

Signed-off-by: Weiqin Zhu <zwq939681378@gmail.com>
---
Changes in v2:
- Correct my name to Weiqin Zhu for the author and DCO signoff.
- No changes to the code or test results.

v1: https://lore.kernel.org/linux-usb/20261026133448.10185-1-zwq939681378@gmail.com/

Tested the built-in entry with kernel 7.3.0-pg01a+ on an xHCI host through
the original hub chain, with no dynamic usbcore.quirks entry. The dongle
enumerated as 20bc:5162 with a 146-byte configuration and five interfaces,
including three HID interfaces. The submitter also confirmed successful
USB passthrough to a Windows VM and use of the vendor software. Secure
Boot remained enabled using the host's existing enrolled MOK.

The changed source file compiled without warnings with W=1 using both
x86_64_defconfig and the host's USB module configuration. The full
host-configured kernel and Debian packages also built successfully with
debug information disabled.

The available usbmon capture covers the unsuccessful configuration-request
size quirk experiment. No capture of the successful path or cold-replug
trial count is available.

AI assistance: OpenAI GPT helped analyze the original enumeration problem.
Codex used the supplied handoff and USB traces to check the upstream code,
prepare the device-table entry, and draft this commit message and workflow.
The submitter performed the hardware experiments and confirmed the VM and
vendor-software tests. Codex collected the running kernel, boot parameters
and cached USB descriptors locally after the static-patch test.

 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index a4bcbe9c9..c01c5cfe1 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -615,6 +615,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* GameSir G7 SE */
 	{ USB_DEVICE(0x3537, 0x10a0), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 
+	/* BEITONG BTP-PG01A wireless controller dongle */
+	{ USB_DEVICE(0x4131, 0x800c), .driver_info =
+			USB_QUIRK_DEVICE_QUALIFIER },
+
 	/* DELL USB GEN2 */
 	{ USB_DEVICE(0x413c, 0xb062), .driver_info = USB_QUIRK_NO_LPM | USB_QUIRK_RESET_RESUME },
 

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.47.3

