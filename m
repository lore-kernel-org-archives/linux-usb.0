Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20C280037
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076979; cv=none; b=eyrJAgh1oy8icp18fSIROfg+V/qdpzanIEEQpM/lCFls9wQnyRD72ebetzfn4PxzB6pLT3cfZi3QIIFCrPvrGMPNNrj0ESP5tQau789Q8185dyQFI1fWfzOeGKhTCb5bGa5vKA5Pc9usUxghpWe3i/+Afoq5sOdUdNHKTvT0oEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076979; c=relaxed/simple;
	bh=7JhQB1J2e/AouynrAhPw48pZUT1f2MJaBGPTfTBIU7Q=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=khOV+A+dtMtmxlcWzuYgZ5bsUOn1qmHJmNi9jhtBJCUiLKiVdtorR7Z99zlRXr66fRBGqxdF42I2tfnhsCKD8971+B5llrz4m465efat+y8+baPI74wIp/JdyEUQkxgsjioHqwcpw8/LItr/aYAuLpGmAc+Kph3tvFdUg2YgsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=d1x4mK12; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=aEgpFSei; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="d1x4mK12";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="aEgpFSei"
Message-ID: <94a023c9-80de-4c84-85bf-7846de97c240@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1788076970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UXVp8OkAbdXycC3l74NgkfdKkojdNhGGUoZ8Pdc1Xis=;
	b=d1x4mK12XbGRSLoWLiXBjLmnMHYY5fu4eL+lJn35Io/FbVE5K6AtLIrZUAtcJgjFjXM0rs
	0EUnB7fiK+AasRRPv3G0Smwijc+U08udiwtRTVcg0Lwqc8bicvPuMJOucn82R0OIRbY9HW
	wplOhPqNcLmvlQPX+lzAB0q8+qPRUpJdkG4MRKXiU0A2x8JaCIml1rTv1BV83UjeMovsB2
	t2XJKjC1aKoFa56U9v5sLDj4WLzdYJL88QSc3wUIZG+mSQ9ZgiZFt8lv0FowYys+XHPQ/l
	yLxmBL2aaVox8KWtE84rrCGJI5pT+TkROZ1OuuFR2DOKbHT/5t0laGXVAI63vKKyV/ACAE
	NZPW9xDdlbLE1nmAW41khM5sqBJu/zEK6pls139b2bOGa/84Iht/rpo129LHMV8CP30gqk
	xzOAecVl5opbiuhOsWeFfVAOn6PPStUEsVqbMHauyxpeYYpGyh2S7TmAHos3M5teMM/L22
	rO/kYuulFgM8aWW4l4o0R2PHNzoTtXF0VDsM2Ox+dY2Kk/6tQsTFWWwEIRaPbRKIAgWOlr
	M3keegpsM+C17Y6RJLW/v/7ieNGdZc67X5jncoiQLiPN9f1X8X15d33oUnPfxUD4bW+4Nt
	N1hqx8+yl6dtECrL+oWf2DpcGhrzqi/f4BMJuML1h+So8fzL7fxhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1788076970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UXVp8OkAbdXycC3l74NgkfdKkojdNhGGUoZ8Pdc1Xis=;
	b=aEgpFSei6G19ya6B/dngKlB17kNi1dKCc6Pm7HSD8KxolhdWkhmhx82VRfinRwk4O56CI+
	ic/RHXJsSAD7f9AQ==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@archlinux.org
Date: Sun, 30 Aug 2026 10:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: Martin Rys <martin@archlinux.org>
Subject: [PATCH v3] USB: Improve "New device found" printout message
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use a colon instead of a comma, like the debug message after this one
does.

Do not print a space after `bcdDevice=`. This was introduced as the
formatting was copied from `lsusb -v` printout, but lsusb output has
preceding spaces, this message does not, so it ends up looking odd.

Previously the output ended up looking like
`idProduct=a000, bcdDevice= 1.00` if the first hex character of
bcdDevice was 0.

Signed-off-by: Martin Rys <martin@archlinux.org>
---
v2 -> v3: No code changes, amended the commit message harder, now passing checkpatch
v1 -> v2: No code changes, only amended commit message and hopefully sending it proper now.

 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..c382215a1177 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2411,7 +2411,7 @@ static void announce_device_ids(struct usb_device *udev)
 	u16 bcdDevice = le16_to_cpu(udev->descriptor.bcdDevice);

 	dev_info(&udev->dev,
-		"New USB device found, idVendor=%04x, idProduct=%04x, bcdDevice=%2x.%02x\n",
+		"New USB device found: idVendor=%04x, idProduct=%04x, bcdDevice=%x.%02x\n",
 		le16_to_cpu(udev->descriptor.idVendor),
 		le16_to_cpu(udev->descriptor.idProduct),
 		bcdDevice >> 8, bcdDevice & 0xff);
--
2.55.0
