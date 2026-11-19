Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795060631;
	b=l+Eyq5INpCeFuKy1QDueCfKBwa6W/1/VqHF+0MiAyrRTsQGEiIMveQ1M3hOZanenIjAF
	 Nv91B5HfX7nXRKGNDc9gs5vMQCw+MAfPN7MZToSWHkBzgcVAhZVcc5XYAcL7RHy96rCGf
	 5ReCp5HOekRghl4AhzRLNnEXrboN8tEmdaD0KVaM626tJ/5dOJwhDf4BryJdxmDXqMF+3
	 sheKO594NU12wJzeumFozWDDE0/nWrKPEAF1B6edIwdnqVPUKhhrnYX5RSmANUdzYxDfV
	 QWcDGbc9kp4inD8c9ZkqS9ke+O7R/1WC4s4hU6xUVMsaHNUBuJmRJd9hQg2aFSFf+Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060631;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3uFs0vwBfCqi0UELCiwFgEfoXJoy6jrEpkVO5It46E8=;
	b=ZOsPACaQxuxhUAiFg03KsY1335AqWC0hnQibYtzb5BiOWkMPXNgX+77vtd5C/17vudUi
	 c6r4mzH9GTbW0MaXTgbOcXlaLIxpURviswKKOuchi2AwUI5BpqgF+Umo0MN+ksSa4oBfv
	 mVuJHE9tiAdCBESwcuDstEXTQoh/uJ7nhArIJDHtb1kq2qXXCtzijhdp8Gu3gWm2VcmlO
	 US9YRf0GCyHD1P0fE7X31bvwxSyQaT+Qpxi4sjjwHaxyFTu8N4ZMllVHxUcFjjt5cVAR6
	 KQFagDSLrfkYK+XJBrLoIk52uLynpa33qn5EJNbl6E3LzHiH1+kWi6g9n2A1Refws5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7MVVSc+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69173606A32F;
	Thu, 19 Nov 2026 03:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7MVVSc+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795060631;
	b=sSwHKBWRZgLEm91lGqREniOjEDInWiu+SQMVaRdjLrO2b46bvZ5nRngSWDkR31DhyyAK
	 I7+h+PIDQLWa+O3gC2EuThaenOtWoJna8+vO+1P5rtwWlq+M7IasaoR46KEdBPKgFc/hq
	 3utvjd8Mmlz3NRnlLhhah044YSwFTZmDZusV6OzFNRMNo6l0K0ndpe3+JnREGkIEOwW49
	 Gt0pgX21cmldzOMDuoOZBqJqSftgnplJH8oU2w0JBEVwxuNvELrRt35huAart3LtH0esZ
	 6u6If+IV5bIaUnt7yF14ArhJvuQhXy8mUTtR8p2BDxFxxxj+IttDnCiovI/DT3Wsocg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795060631;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3uFs0vwBfCqi0UELCiwFgEfoXJoy6jrEpkVO5It46E8=;
	b=N1dEbbt22Mj0CMQOW/ivxUQ19v+roNsR0F0J0lq1JtHLPkVGW6Jc707Ya6DupP7Ral3P
	 ek23bZZDxygzqK6neAgXq0U9qV2fgb1CWogcBBwOEVDOCLPq0JCA288JqQTK+qvG1PpEc
	 OthzJ1uf8W/vLjWZmlUJy1G9d+FXtwZMZMKVXtfCl+kJaxnEkfrGqK9AK6FNelNpZW9Or
	 cc36rAiBn5yoBisHDd7LcbSIWGt8jf0SJAwQJM0eeyBw7LEosNr/taPoWXWbNk6P+LqsR
	 sDOLgns+tpsEQDxb5bs7gNisS/i3sWHTsxsR3ibAflh17TV6gR4m087BVqOflZyhziQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8904D1F000C5;
	Thu, 19 Nov 2026 03:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795060631;
	bh=3uFs0vwBfCqi0UELCiwFgEfoXJoy6jrEpkVO5It46E8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=l7MVVSc+rdFqL1o5Er7ppErFGv2l2OSVf1pyX840mFOZluoly3Oq7G572stC/v3Ia
	 NFdoRFpL6PUHBSpbsQM3zvh9zgu1RwDGY4Ac6RxXzStu4l+mBIjBKeXXuvAAITn/nX
	 pIKIgJqYC1vCea0VcL88+yOLYGySYXEXOc0osKZA4HzXYf5dQCBbvPoFEWSFGhTJ55
	 6EsqYjxZ2c8MvQYdD+OuSTAq5r05qSCkBokL+JGrqnPCG2naVxpaKbUUzjjyoFOrAI
	 8+K2bwBC3NUirZJPKquTwkjweh+uuUzEsWgDeCGXoMcJ4t70Otc9PpC2vrHaVxNCfe
	 aPJ+mRijMU6XA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 16F9E4B0B9;
	Thu, 19 Nov 2026 03:57:10 +0000 (UTC)
From: Blake Alexander via B4 Relay <devnull+contact.blakejalexander.com@kernel.org>
Date: Thu, 19 Nov 2026 04:56:59 +0100
Subject: [PATCH] usb: typec: ucsi: log invalid UCSI version of 0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm3CTIygVzEusLRQVNDWURPC3
 R1l+Rb/z+Bsyg6HYgbjl7pOY0bYFEB9M3aM2mZDLOMuhLDH69RhIlcUtdu7McZHUrtgLUJ1RVW
 7jQK5vhuLfv7n42m1p/PA9PztYFm+rNKy2nsAAAA=
X-Change-ID: 20261119-log-ucsi-firmware-quirk-8ffc87c7d42f
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Blake Alexander <contact@blakejalexander.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795060629; l=2922;
 i=contact@blakejalexander.com; s=20261119; h=from:subject:message-id;
 bh=D9QKefTsauXLfG27A3b8IZK8JtUA5DtyqrpmUi8e6cE=;
 b=rdPy/cmFK41OxT4Qx7L+fZtJAtdaWVvzTfGR+7kCCx+VCJ6OKfsJ7/1KcE8tnZk2za6Cy31/q
 z7qoirp65lwAkn8git9jXKQ+qnL4nPc1yP7zKWqyQN0f8Ne2y80yqKp
X-Developer-Key: i=contact@blakejalexander.com; a=ed25519;
 pk=csAgv2qq1q6RTYXyATg9ngFwpSFPE0yWA9R9nSvVxW0=
X-Endpoint-Received: by B4 Relay for contact@blakejalexander.com/20261119
 with auth_id=1565
X-Original-From: Blake Alexander <contact@blakejalexander.com>
Reply-To: contact@blakejalexander.com
Content-Transfer-Encoding: 7bit

From: Blake Alexander <contact@blakejalexander.com>

Some devices ship bugged firmware which sets the version of the UCSI
mailbox to zero. In such cases the ucsi_register() will return -ENODEV
and the driver will silently fail to bind. There is otherwise no
indication as to the cause of the probe failure.

While existing (and future) machine-specific workarounds may resolve
this issue by assuming a known-good UCSI version, future devices or
older firmware revisions with this issue will still silently fail.
Both users and developers will benefit from a clear diagnostic message
when troubleshooting this particular bug.

Add a dev_err() log message when a UCSI version of 0 is reported during
ucsi_register() hinting towards a potential firmware bug.

Signed-off-by: Blake Alexander <contact@blakejalexander.com>
---
Hi,

I have a ThinkPad T14 Gen 2a which is failing to negotiate a DisplayPort
Alt-Mode connection to a monitor-hub with a USB-C cable.

I spent quite some time troubleshooting the issue and identified the
root-cause only to find that a patch which fixes this issue was already
submitted:
- "[PATCH v2 0/2] usb: typec: acpi: Zero version quirk for Lenovo ThinkPad T14 Gen 2a" <20261103-ucsi-lenovo-t14g2a-v2-0-e85c659b56a2@resetko.pl>

Similar issues with other laptops have also been recently submitted:
- "[PATCH] usb: typec: ucsi: acpi: Add quirk for ASUS ROG Zephyrus Duo 16 GX650PI" <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>

And existing quirks are also already handled in mainline:
- Acer Nitro ANV15-41: commit 8c51ea651d04 ("usb: typec: ucsi: acpi:
  Assume UCSI 1.2 on Acer Nitro ANV15-41")

In the hope of saving future developer's time, this patch adds a
dev_err() log message when the UCSI version register reads zero. The
log message hints towards a potential firmware bug and gives an 
explicit cause of the driver's probe failure.

Tested on ThinkPad BIOS R1MET65W (1.35), EC R1MHT65W without the
relevant quirk patches.
---
 drivers/usb/typec/ucsi/ucsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9e453d216c16..fa79ba6dec02 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2396,8 +2396,13 @@ int ucsi_register(struct ucsi *ucsi)
 	if (ret)
 		return ret;
 
-	if (!ucsi->version)
+	/* Version of 0 is not valid but some vendors may report it due to bugged
+	 * FW and there may not already be a workaround quirk to correct it.
+	 */
+	if (!ucsi->version) {
+		dev_err(ucsi->dev, "UCSI interface reported version 0.0.0: possible firmware bug.");
 		return -ENODEV;
+	}
 
 	/*
 	 * Version format is JJ.M.N (JJ = Major version, M = Minor version,

---
base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
change-id: 20261119-log-ucsi-firmware-quirk-8ffc87c7d42f

Best regards,
--  
Blake Alexander <contact@blakejalexander.com>


