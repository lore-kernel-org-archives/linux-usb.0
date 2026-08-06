Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DD230E0F2;
	Thu,  6 Aug 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023812; cv=none; b=OTmScataQdK4+hJ9KcGAFLcME0WPRwxcrXDRwcTJPSLTEascIsEzYvkb61ruW1WTjVsBzLoX0KkK4v8iDyzm/rKHcK7PMuoIZ7a58hvUKNP0VJFdYmNB3W4be3+hNfH/vIw9fKKhridCxHkHRSIFw3UpxPcgHmsQsBh686CpAFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023812; c=relaxed/simple;
	bh=Wme0/KOhUhIec2RNaSNpowPhWlfjKZcNkVXNim/h8U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=auFTjBu5Welfy60undBWTGM1RB0fFw13ub1N7QBT1QSm/RdbJ9JWx0bGyH0KyC6BC2aCMFeYF0biFznHybaM/qLTEHeh7oSMDc1vVeGOBa20dFwb5ZO79QR6UnJ5/UcOz1/BWYQeGcjAC6Pav8Tdj9OZ+O1YJswd04Ki/qmUh6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=FqLupjSu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W8aS9Ucm; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="FqLupjSu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W8aS9Ucm"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9861C1400106;
	Thu,  6 Aug 2026 09:43:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 06 Aug 2026 09:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1786023809; x=1786110209; bh=Y3
	6pdGpjg2rEesdiSXQ4kwPF4JsX3iG+828Azjy5/Ws=; b=FqLupjSuKK8zhIMsrL
	GP/D1ZMGmk/bvcCNq0wgqaFhRzgQ1vdlGQaeZqp1YlKJxcPiog57D4zJajNFxhT8
	KV7+yxhQcupc8rmqOayQ/Fm2eOEU6TlpJebQDK09gQh1keQA762+GjJtXeBlFJOb
	15o+Vv10Z9vznmYXHjogqQFuXfj2RKdVIDVoeICXYvJHctM06mLNZmJ6HDLdlEyG
	uFQqXCrPeb+osNNOJCFVrnMzNliH4s6ahHNdRuDsRsyk7bFDOrdrR3KyauKhJ36Z
	+OauCx/lGFO727aKRtvyS0Lt8cq6Hd9KAy67I4nSjqLmJb48T85iJZ/YM34OTK4d
	/jxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1786023809; x=1786110209; bh=Y36pdGpjg2rEesdiSXQ4kwPF4JsX
	3iG+828Azjy5/Ws=; b=W8aS9Ucm91Jf6aBvqmvKs34JtXnXrKw/Ix9GS0M/SYux
	oSnLtjN/tMdBGHr9pvDxK9y1IdI4ezuriWknzQ8xSfHXVaDi7WJYmCDVd1P6mDO6
	s89LETj+jL3ljjPdzvGxQoY40WaRPfay7CVNMqI2YAy26jqJDUUnQd8zgdDJPjHi
	rWnkWzWm5QVm8GssQHN48ZKW8yJ+FJA2ybXYLtWRn7kSQbRUNOj4RviZk579fPZv
	le+B8E+syCiaITUwA+Gp7PzLbRfYHELUQpEc68XVOUWsUiiFHCm4asVqAo+uvbPT
	LHuSa2c/rvt1PHSdMK8mLK0JIUE6tfLmqtVqA8joSg==
X-ME-Sender: <xms:gY90akVHa5tYo039AWgHCdIQmZVDIGyOSOrZzd8MJKOh4hcUD-EBaQ>
    <xme:gY90aklUCfn8uwUx7pkVXO_qTvzOW4KKy630H4OzA_QH0GvdnmFd9BpbHNNu61qoR
    swjSlpWP-QZNshm4yMo0FwUTJ0kKQMRSSpCFX84tXpY_IIWGzri>
X-ME-Received: <xmr:gY90aqnJwe7g1VsIsrb0JJ1zvHonPZ_8gviutE4D69y6NPmnUTJIMAcZz9tfLvfZKdObgV57K7prrNaiOOPX2PRdi2XAi53ajj9uDB5JslBfcodkl-0>
X-ME-Proxy-Cause: dmFkZTFkOtgFyMgylR0+qsvtGKImwaB7n2Kvtr23GQCstv9RU3rxx5q+Z6tH9zjqh+0AnV
    /hGxcSUtngD4YfZSWE5nUIGUwYaSsGUGPp0NnEehxsVkhDFOtY6e3Xn0RLr4s7Lim/WNTO
    M4qPKyKNATu73MtU4iqVp9on3jieXxtUlYJH7fg/Oj3IfonAZU4/aEL3A6a5xpmAVe7aJJ
    7ZcUV+krzZ/sH/mmmjMQAQJTwOialrRlw0rwLbhNUQBIBsfJQnYaOuPUCpeIKlwFXVDhDv
    j9oayx1FGAywdbDzj7bZ3T6rV/xxSArtiR5HHImAjsnASMdjx8OsHS9czQsplvsY9YNSee
    2nv18wnKbLf+oJ/JedW0KQOcQfGkafxSFdGHaLV8LqHj2lAeVx5z63M2ZGfmT0GG9NPQ46
    mzisWVpVQMrTU++2yDYDpFpOma6Wz/NscDvvv0r+3jfeQxNCgZ1U9GNhxG75KjuCgo2Ro7
    tQwjLvl0PPiKVqaLyj8VnCezxROx7QC/06SPrQl72qfBjaK39xKqDt9igoOvKy7/V14zEl
    hC21YKEkbs2/jIah2FkIadlAejYsaB3K4vZmJ7hfftmdrZ/QJKkVOAGwH+Lv8FgjqurMRF
    qJkOjreFdkRdRstD10+PjpR2RAAucOP87iYK5Ye6JNEZQabbQXgLNqs5rHgA
X-ME-Proxy: <xmx:gY90akaTMGwgsOmSBuMCFBSW8oqYqnrIyuIwY0naDv8Aetd374Hvrg>
    <xmx:gY90asRtpbSpnKR6q8K4tEN_QmVUsYiGqdkYJ771TxnRpeU2xaBuQQ>
    <xmx:gY90auuJSsH26foV4Q5B1iwDoiGfUDOY4Cpl2JL91H_ZxkY3mOqSXQ>
    <xmx:gY90auEKyrQeYUurwwb7fGphgQA02QsVTja_jt2zBbSCWJYSeSzQNg>
    <xmx:gY90ai4i10oxltKRitBMg3ZKEGO9cbPp5HcdqgxGF71OPhoTdIaGB2bQ>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 09:43:27 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Thu, 06 Aug 2026 15:43:11 +0200
Subject: [PATCH] usb: misc: usbio: fix bulk receive overread
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-usb_drivers_usbio-v1-1-04879d13b46e@kroah.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBCF4VfRXNtaW4u8iiTGYFygGaTk3S3uz
 ndx/guUhEmhiC4QOlh5mQOSOAIcm3kgw10wOOtSm9vU7NrWnfBBonXYvBjvG8wRHfnMQfitQj2
 fX7OsfuveToTbG4L7fgB2WrSQdQAAAA==
X-Change-ID: 20260806-usb_drivers_usbio-55ac8cc2e572
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org, Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786023805; l=1121;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=Wme0/KOhUhIec2RNaSNpowPhWlfjKZcNkVXNim/h8U0=;
 b=ib+6EIgCYd62ZeAuXQ6xy3IcOr64EKZfxXHmML0wvSWPPDaUU8tS5Jg5atca7MuI3PRbnPlts
 s3LRcsDnkCKDsyUfVbm12TCG1GRk8WGOSEXaacBXV+rQQitv4Ny3cBx
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add a check for bpkt_len being more than what was actually sent from the
device in usbio_bulk_msg().

A malicious device could use this vulnerability to claim that more data
was sent, when in reality it was not, leading to an OOB read later on
with the memcpy at the end of the function.

Cc: stable@kernel.org
Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/misc/usbio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 3c2474dca810..794322ff09fd 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -341,6 +341,9 @@ int usbio_bulk_msg(struct auxiliary_device *adev, u8 type, u8 cmd, bool last,
 	if (bpkt->header.flags & USBIO_PKTFLAG_ERR)
 		return -EREMOTEIO;
 
+	if (bpkt_len > act - sizeof(*bpkt))
+		return -EPROTO;
+
 	if (ibuf_len < bpkt_len)
 		return -ENOSPC;
 

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260806-usb_drivers_usbio-55ac8cc2e572

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

