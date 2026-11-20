Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195726;
	b=CRusMUnlgyU2UKxHmbXG65j7KMhyuNWi6TozlMtowhlgrOOaH/N4MuX4l1AGqT247oA8
	 +beTHGkVS9DEWNcD+TfwempXN8RlgLvE6rWbQnz3/5hCgd+gNNqlcyvauQ9eyKe0hbjHD
	 Z7yzeXdp/ZgqH9zSHD/TYPvLETAgKD8Dh/ypZgpaeQtMIeIFLiC1R9wj4yPDMqjOqm09E
	 AqJG7XV2JCKjBaRVqXA4dfqMCmrun7u8ESG0swDCqmjNuEr2+q0+C3mSvfkf1fkEcRTXh
	 L9pNz4qzyX1LIvU52wsEpMBP6ZIeW2ir0FmJopJoiISp5v5VShXtrYNo1lloxYLDJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/lQFrumXY/eO2ACD5OArHzMhyMrdljnPb2HKCmNt8i0=;
	b=F9eaw/HcEgqcO7Za+8kTzJjF0/HF4Nnm8Y3uv5N/42peLioiTQkBuUb+wI9F8TNlURNQ
	 sV1GBrOj+Qvo6UG2VwPYcPifY8npt1C3rKOiKzloVs1EM/kZ7Ezt2ITYfreSOtwcD4Zf1
	 //A8WKV1uLrDTuE4Q3Pg76yEdzLrSQWu4ZnGMig+3RVZ9ZE4ZrmEpMCjgVHrp1F9XkZ/j
	 MRdLZa97E8C3zWC0qoWhtIMoP2UU70V3LoRiOJlAhRHq4n+PFceKBE7sZEWIrseWapwzd
	 cWVBabinrjC50F7vsW+M3HqwCnOSW9sgWCHbTLQSArsSbSPPQiDnjPXTpEVjQpmCZTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dfH6Gy+a;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A464606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A464606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dfH6Gy+a
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1316759b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195724; x=1795800524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lQFrumXY/eO2ACD5OArHzMhyMrdljnPb2HKCmNt8i0=;
        b=dfH6Gy+aSviOS1anR7xvcOw6hlW1P/zVeUP1d6jCiadqppqlOXcSVj8En2+UuWYn0p
         eRy+8Vv3YB+V6f7QILp1yqfa3nhh3dL1EClu/RNtmuk92/9v9KAKiD5EE3cXcqAiM/Me
         oZLaMxLnI7HdHnrI4310uvFtDudAq7MI/rrEvLZtkZD47KqvC0ZCpRIDPH90Uq0Mtio+
         NghmoS86I2dFndjeWGz4EpRJjEUSx0eCxI2oMMPDNXKq94zu+tEo6ejO5aub39gTJ+01
         4f2KC3v8fvePDD1wsNeGaskua9ba9CfoWx2mIhGP/mMoyIHj9ZBq6j6223BfTGiHZSdq
         vgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195724; x=1795800524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lQFrumXY/eO2ACD5OArHzMhyMrdljnPb2HKCmNt8i0=;
        b=1vTNUWgsMUjhbvn5mQhi+2msmG64G52PyXM097aBXFNdx9zKDrFdW76RC0Kk2mFk77
         VJT7ORk9tciajLlAFt+nRkodlNJed2u8EVMhVMQhR6nGnjXZhO4WP129sz+/rDNCiWLw
         USJGBuJpb00JxNkBTH2+DG0O15dayLra1dhxJk/81NPdjqFCNWVb2jRdmDJPzlvDR3Qx
         zJ5r3i7K46/la/lK4ajRSoTfPp61I/M4KrC6mKhu7jDTkQYsscOlLUkjZwaaCmacK0Vc
         Xkv7WTwI8x9xMf4J4NCqs6jwXl8Q/bx14Mc7tlZNv25u4aszKI6QReV+1xNBEF1ivkWU
         NTIQ==
X-Forwarded-Encrypted: i=1; AL+hErHgOYg66F5l211dT/kXVk1yczLOGCxJA2r06beM6cGsM+mLl54Z0V7DGO+0jdyW7bqnCyJL/tf9NXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BUbSjbJ48dbHkm44WbzHNAxNJcHTKizRYV3uqtyvsOrhWOCvZ
	hZUE9XdURCEr9o+S9OW6tLrGamIu0gskHlFuecifMBpX/V/6r5Vxl65wlT/coIavW7s=
X-Gm-Gg: AZFdTZdWLYUTNe2tOHUh847LdlkmcJjlTPWm6F0mtifKUj1PmhPEPpniDscMbS/S0Rt
	9glvvvjQ+FU5mN4fASGdppWUjC/sYDDqnSXJ5yMcpLxjAYawP1PNTo560lJt9oT6zGG5B26P5QQ
	oB/lC9nZUHQvSfGICcERZ2RRJLzzHTnWL9ykm4ZXdN7kapvkV68pWytqtv+nMsLRQzZ9DQlgRRo
	6TOZ852Y/OyMeiaZfTX1qOxwsZaB/ZJXN+Z2ZQJnPJrv0Wxnlcjdf7EQrq/WKYLxta+82NgkmNb
	z0F2XwNG6d3cJjgTWxS1Dl1GCEF/i9Yo898qYA7GyOhWUSAVST5AFFbakH0S1RFbYCPSx8fxnpx
	WZnZTvMU55Vk1clkwbj5EnDKh+c3iRFEDO0S3ozr/F/v1Efk96sbGxoiQ5Y0WjFyU+Ym94DHxvc
	NrynxRKlPoDfqOv8vdi1usXg7rtnDs+Q00+SpgDNGjgiDRvaeRAPlRwu1mB+uTE/PCvhGeS9wJ/
	eri+oQL0XIjanzTuy8/7tJJ4l849Cz3F/5ScGdbu2kM5N+S4NKBxh/XN0tSNDg1qyCPfNOUflvx
	dg2GTy9Ag2hmgFwXSUD2RC9Ffgso6fmpoReZkxvYyV32q6WaRIJOx/ptl9swiBoP1gUDDOB02DA
	6qCKOJL98tdCbRMozAbMpGQEw9PZveETi1i7f
X-Received: by 2002:a05:6a00:3003:b0:8a0:550f:bb43 with SMTP id d2e1a72fcca58-8c7ddfb0281mr3651179b3a.34.1795195724025;
        Fri, 20 Nov 2026 09:28:44 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm1867911b3a.33.2026.11.20.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:43 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v9 0/3] usb: gadget: f_tcm: fix infoleaks and a UAF in the BOT path
Date: Sat, 21 Nov 2026 02:28:26 +0900
Message-ID: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

Three remote-triggerable bugs in the f_tcm BOT path: two infoleaks to the
host and a freed scatter list handed to the controller.

The first patch of v8 is in usb-linus as 69b3b657087f, so this is the
remaining three.  v8 was posted here:

https://lore.kernel.org/r/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr

Yehyeong Lee (3):
  usb: gadget: f_tcm: zero the CBW buffer the status path sends
  usb: gadget: f_tcm: reject a short write data-out transfer
  usb: gadget: f_tcm: clear the scatter list when reusing the BOT status
    request

 drivers/usb/gadget/function/f_tcm.c | 14 +++++++++++---
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0

