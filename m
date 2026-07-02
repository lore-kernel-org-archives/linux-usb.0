Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D19412264;
	Thu,  2 Jul 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980048; cv=none; b=BSJAGvj6Q2JPSvqVmoMzV9i5gFKwBUKYnTVSYAUDMyckm+VLM2/d3wGxgkWu9+mqpPTAYFEcSB1SHKXFo/7YoWLwdJReT/O3hU0pWUZYpYhrHhjwWBhUr/q/BXxzwyhYHQWSfb2d+eVuqtppGZ/B9ym9KFK5zpKRVfFNEjgpAg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980048; c=relaxed/simple;
	bh=YTMBY3lPGCbeJZukKuC12MHH6Izf4z23FdgG5sNSVp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFizQZelX2kI7gjrVLCtRdE+gzuTGDZAeBXSD24PKoOkveSEUJG0hKJL+fggYsxaAI7K+NlQEjFBCAf2IZoiniYZ3/Vf/4ekjFwNtb6IjZp//vHftMEMftG3en3jzEFduH4kC95sxWtFPOBm4ywLKwMAEhZIgHVDh8SASoSlqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RfrZnsh2; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RfrZnsh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782980035;
	bh=xZl9n4SSq0AlQ66FbM1ZQAlJ2XwNpirrFGT3JwGR14E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RfrZnsh2MCyncPA1hK8UygHfP6dgKFPREYZ84Z1qyi+HFgghXP1e/YHUilGXN3bjR
	 3W/gsCflnde5U2koD5wjsk+xqeXDf76k9w1VRKlAmAuVZwERgFG6kC5pwp297jOIR3
	 ipnOOI/4e5E0NiGqGPvcIENQgvidZhXgS/uRz2y0=
X-QQ-mid: zesmtpgz6t1782980031tc09f6a9a
X-QQ-Originating-IP: zbzp5YSU67vmZlEI3hTXu3J1qs8spa2cESI3CrxtNCs=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 16:13:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13717686121421522630
EX-QQ-RecipientCnt: 4
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [RESEND PATCH] usb: typec: tcpm: fix EPR AVS APDO maximum voltage decoding
Date: Thu,  2 Jul 2026 16:13:48 +0800
Message-ID: <EC9C0058EE42BCB3+20260702081348.2479291-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MTGYztYhR5ETsuUUNScthWxf8gVkRq0xT+48DPUQUSHpmTvRdGo4y/5n
	20WzBVXMM7Ek+5i7JwfEq9p2Hz+uJLLGjQtrvXgCKTO0+FEjssJqIeAiENSLfhyU927wnbG
	vi2zoh3UZ+jV/WMvsp9Y7C2KavY6WqeJCSdFr/OVvnFuZChTj7k4AmsNnI6MGpJ7aBOj+Mb
	lvWhALcub/Trv5rz2xepJt8Pfmz3EpXfhWQbZepiXHxVxarKZi0dNRseX6as2e6P28ZiLYH
	ALGk1VQppXrQ1lmdlCeGO46H8HjdK7ZB4osREmduteADgTKyLd7/hn3/1dMgue5hx4Vo7LD
	LGJuk3+iNT/ajeEce/Tuuo/asGPowG4AZYoHCEcZVRZB2rdrY+83nw1pxF8EuDMKf+7xiFs
	SjTE9l2WI4NE28JFf47r1ui79dQo2roV3dCW0NLc1YcYwXcBjx+4H/vAzYLEcG41EToUho4
	DSejhpLyjdjzvhd8v9FnQX2gFT38I/SIElQWNMCtHcMJlWF3oRFpvvDtCsdSglpmsuVeDHl
	UFXQ5VCc4YBgHmXIDxtUIAU5jG04HOibe5BvsFsFF6FvhwM8J+CjRF1H/bVJATKDZ9bD0mC
	MCpuhuTWH9fQqhT7MzrUzdWYS5mv9Zd8keHLxteklhYr9kS1/YQzNRNVc9XS70qpmdNqWIi
	+GFsfrn4wb2rSn6eAaeb//T9RUhF4tYCOiHbk4OdIsQhNm7W4uWhohLCVtXtwqlRzvJ0i1C
	n/CT0pIiDRYfHEAdmwVJAWrLOHvtvbcjn53c0wr+N1HRb+0ac+5XKZRlcQfiCh4eEzfvYSG
	w/ANPdLlIPp9CtQ80ckhomTB9vYgRKy3JI9LjWuibwiIyYIFvyAoQ2Pb0PRgU4E9JLZEbna
	OaeKE5Ib9r7Xbxqf2yvNdcN1g8kO1GnmE1CgFWhHYSjD3afXZRgDLPhqFodpHwx4BRnlc+9
	CkQ92t+tRezEj5+hDYioPnCjTQrOiLlo0Un7Bq5Dj0pun5jeUhZBFk9GrGa82eBlOXkEAM7
	ER5hMBHg/wVO7BM49SnSt7v4q8O+lZ1pmVYbofF92P/9kLnTYy+LzBRnh1b1g=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

pdo_epr_avs_apdo_max_voltage_mv() extracts the EPR AVS minimum-voltage
field instead of the maximum-voltage field. As a result, an EPR AVS APDO
with different minimum and maximum voltages is decoded as having
identical limits. The currently visible effect is that
tcpm_log_source_caps() reports a min-min voltage range.

Extract PDO_EPR_AVS_APDO_MAX_VOLT in the maximum-voltage accessor.

Fixes: f82890c98f3e ("tcpm: Parse and log AVS APDO")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 include/linux/usb/pd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index 337a5485af7c..ee360dedeaa6 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -493,7 +493,7 @@ static inline unsigned int pdo_epr_avs_apdo_min_voltage_mv(u32 pdo)

 static inline unsigned int pdo_epr_avs_apdo_max_voltage_mv(u32 pdo)
 {
-	return FIELD_GET(PDO_EPR_AVS_APDO_MIN_VOLT, pdo) * 100;
+	return FIELD_GET(PDO_EPR_AVS_APDO_MAX_VOLT, pdo) * 100;
 }

 static inline unsigned int pdo_epr_avs_apdo_pdp_w(u32 pdo)
--
2.50.1

