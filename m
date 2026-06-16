Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47F30AD0A;
	Tue, 16 Jun 2026 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600109; cv=none; b=eyCcVo3E5SFitAHF2oHcucGvnyIQWBLq1tuKO3Q+XY8Y0+Xm7ENHrsyoMm2a5R87YtUty7sDZDpZpGk05CUktUaqoxZjZbGhAPS+/uHnUCXlOmT62DdN68Lrzbs/+ne8bI4leCdIoEZww+xXX9Yd7cYkcJ6eNxuXFomjI3L1IwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600109; c=relaxed/simple;
	bh=dcBkUnRVmUxkhLKZ5WwhCRcLw9cMfnw1gt244NdkAI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qLiwLXGN4k62sLgC2P2WsrwKMfB8rnRiqEDUJgRlj0PGwrgI1zvbIMaN2nwL9P8+opUlTHRdb6CjkFP8wCLJkivarjYu0kle2me1xJ2MJ6GUyQHeCOHx4SjWDLmJUk1DkJvlggCLUaLv4mZO4q+4L4C9bvbntH2/eTEDmEntmlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=bBPVf6yw; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="bBPVf6yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781600086;
	bh=rVaXII/CGnqlL4327R7/btw4c1gd2RXVOhKvBNnWTQM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bBPVf6ywQ+gIK33OYyHWl1zEP8t1md+eK71+GvLqZFtoBCrBcdn+Y62esGYwDT/FO
	 V+6g79dD6HBiHnFvHxG7nqdNXGr8/pF99ZJjZ4R3dIlyE+PE83hHBn4R2ADojZFFQp
	 BNdpT8I9Q/We1GtSoeME11mBDlTQTD+fJOSC1Gag=
X-QQ-mid: esmtpgz13t1781600082t0b6e65aa
X-QQ-Originating-IP: KQ76DmTOqK1vKuj87/oeWoaPZuFAPDTaPqQBnSrVVwE=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 16 Jun 2026 16:54:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11855543236985699695
EX-QQ-RecipientCnt: 4
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] usb: typec: tcpm: fix EPR AVS APDO maximum voltage decoding
Date: Tue, 16 Jun 2026 16:54:39 +0800
Message-ID: <48301FCEC9F3CA14+20260616085439.987664-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MfQnJH+7WKv6DpBIZ9gaEKCKwDHi68/1Ug2VfM4Z/kMWk39elqa4fbXy
	8/lsE/hYjB19ID+Xp2qUdTz6HQa6uS4P7B9rtA06PM3vNhqeH2Cg3JHS5KJA+xhQMr33JTc
	5x0AxOxFs566TYbCevDcbORfp6MRPLNRgNN3hh5b1+0eN1Vq+LXywg70/EYgB29lOPKs9d8
	sZ0DL4/tFzpA8OuVb6BsD9s/9va/plgMoAJlIjj507w2SbaVkq/c43c1nbqL5apaH3U/KH1
	4j0wgFZccoKZtgwyWL0EIttzZnZf16H6jTTFovGStjYHijyyHvmOpvtWM6/glGPQMq2UVIA
	5YIC3j0aC5tgW7LXljHVysS2oQwieDtH5afJYv+utAFkHU+k+cokm8Jc3F+DAe9LdDrHPV8
	fgyGf+fV30NNG87X/bq17soFUqJMmT+7sFlUTW0baNwiheG5SJIsclKX/iYkMiPXxk+OVlb
	DEhn/aK1Fd8SYpzDEQxrS4v1virbqXvYXtVjW/rSd49ZHsz9/+0XUxX2V6g2QY9+R28AUZj
	XCARpm9Kkt4w4lQY0ZWR0J5LmSux5Cqe/GqqQ1zJFc9rxz6jl4ZUD8rPSim5FJnNokw1J7B
	se6R66fBpvQyy8dZxwQhdW6AiTyKgtt14Wui+Zv+O0w6/6GQ2EBoNdPUPj0yxh+h6NV4nK8
	PfKB66FkG26DIe4Nd6efRe2OhuTAzvzWdSsyFLd2IIcTvZxzHBmYFtUQp3xMvPrZSoAslqJ
	2Q9DcCyzVlTC76EreoDL0YaJM5R53VbZe1oUtIs7ufTEDByzWBsh+KXEzcKkd7PegcVr3fD
	zethPnKPHmruaFW0HjuDc4Tuq3DrXuzc13vrs8bw0Y1Bo7zkexGAEk6lSnPeCYh962xKqg+
	Viky/gDRbPlu+ZFN+aaFd81IC/Muht56+82LIWgE8DAGaFPT7PQ58fu1kKeVRW71Uc+XyZ5
	oDDJ0nX+kymKF7b8HAIzuSINjDoGb77e8XgLEbQwHDCMfdPkgSbFno19OMTH7y3Ee09OByZ
	kZdMtpufbvvPEQTFFo4U0rsqIVwp7Z7BXhV0Nalu63iv5xxlEc
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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

