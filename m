Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095731;
	b=rC0gwpmLLIBLXr4wSc0ouxs7ZJ+Jndshdwd7QTSr8v7UaQFIAUUKYr39up+EvgiT6bkl
	 ECXsore2fobmgofswncxaPW1gI+mLHH26MCD9Nvhi6+T4dzKlUPeUJ079LQv0BvtpmQRc
	 8enGW/efrHxRva5JSihu2vU5L2pGI6HQVTn4i4VgqwpMIwQhUFxV9e4vhUF4ZVKZMNTMv
	 sEt+ETXopLqCnVIxPkjN+AI24FUnmD5iOCI8MpMJMN6rHzXc7Tyj7yEjYWmEjFi/LYEvH
	 pJtarssML5MCACijD69u+ZISLVlUwrDGnq1wb9f32pkP18KNrflMEM37OpXF8MeQ+rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095731;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=TgFZmurvXvQjkGtLgEG6UNyyMfy4657k1spVaBmHgas=;
	b=mpVjmJO0+0zTLIk+5mzZuMtXnjcB7pasaUK+loaUaWPo2lMzIim6kd/jkZsQx0AWbZvs
	 i20bzBbX1kHv7Lw53OPCIMyWZZsO+S4hI/0NcHKA4IAVuydm+tIa6Qq929L5KUQhRPdVf
	 iK9qYtDzCUvcWbLHcC8w88s1TFaCb0I0Q8TOIw1HdjwyMH4H72Lz0cOu7HYxpGLYdAhpY
	 Y9FKtwXlIOq7rw6rkzxP4n80E4/3E0iFn0ve1am53Rd7e2GzHYmdyhPjpx2Wf0XhHfKcN
	 bqSSk9X5Uq8OlVS3+nw2d6OjRc7qnsXt+wO6xpRculdFJbytJhK0bBqzanAKz1r8DyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=waY0TwO0;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CAC606A334;
	Thu, 19 Nov 2026 13:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CAC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=waY0TwO0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795095727;
	bh=TgFZmurvXvQjkGtLgEG6UNyyMfy4657k1spVaBmHgas=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=waY0TwO0pw1k10kv02ldEILzB4aCpfqXtekn9MouxX+TLdCikWiH5R1ajUmlOfh3B
	 mcma/Hq8/Ux2KT30K39WO/ablcQZgMzhrV27rqR+g/YqZVMM0mTIb9b3AGpxLRXDjk
	 Wt4f3bzhFXZgKK9pkFs/NHTk2vdDzFEO0HWA1Q9I=
X-QQ-mid: zesmtpgz7t1795095726td97e5e08
X-QQ-Originating-IP: ZtK+OiRYspfQmcVodrzoM617/CTWg7U8Rd7NK4nVdi8=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:42:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15643475286149650064
EX-QQ-RecipientCnt: 15
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Thu, 19 Nov 2026 21:41:54 +0800
Subject: [PATCH v6 5/5] usb: chipidea: usb2: add SpacemiT K1 support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-spacemit-k1-usb2-v6-5-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795095710; l=1441;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=/yV0tswOisr38323vPL0dpYPKBVg6tJqBCKRJwcu0tw=;
 b=/2zeJyGi80qzREMO+5uecTZhRc1l8EUfPNDTZ8gl+vfIzQeVZsToecU++FtA7XuUzgJs1YdSD
 gWkQ2M43GFPBmKDSxPfOmCbnZlb0s2GhQllxeB3W5XZkL6P0piS9DLc
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: M+s4R5pmORJiK+H74QOV4Aa9SzVij3blL/IS7AeB59JH6Y9vBCJITsUS
	k6uVRyMnBO7WBcSwcxUQSCrs2Px+txxtknAh6UKZDuZkzJTeOO5SMxh8iAs6ymmohTv7vkL
	pY4fFcds1BXY6eQoICDLgKbgT+H8EvgfOJxbkPBZZyVmaZm25zXxFHDnvd00PunMtdVc2jK
	OsVdOZdTDEToMnBJkWj/++oF01ia6hZ2VqK9jOOpJ/vsX8O1ZvopShY37IT8Ad3w7AAaIAl
	LPNUwoJAXe1ThW5g90D27VICziPHaeB+Vbvf+rJzl4lKck5HLAtAWy8w0kkeNKfAAE8QExo
	ImxlSNU/9+DGaz2N28eVf0z3HgdGMZWwl+6obB7l5mdB9XtgM9BAEjTEuoDlPqAVwGVLcfk
	QF6rA5m5QgP/6o1dB4NfSydcFu18fkHyCx23kw99KJU9Tl6/koE71hLiI3SSQitHsfJHzGR
	4KPMZiqht5T4lQnhVgHhP+VZ9YM8oyo84nh9QeG2BD8n9VsoIUoLJj4I9zuotg8MimXSsAe
	G3x63Hz/aJ61G3n9OL0gbYZKWPYoXtlCQsFpgABb2THmpeGvNgJZubDsNmFIxiPfsQ4oUWg
	2g9Z4NPjd7aBYFT8kj87mS9xhKNu5QCiNM+OqrfBUvsjXDn3Yo3ZauxpOtSAxddAlW4EmXb
	WAUF3yx/hoDnBTX72XFJqv7nIHxL8PIjFNdOJkXxlrWH2whUN4tSRZJYT7/nA8oHG3+kMcX
	5ilvN7hXEJBU+6ChwYWfA3hkqyC2iXOM1hL+NBWt2O9R2mJpd211Ce835Lss534rXWeZJY+
	brZda3+4oDgZC0pK/aHizKSOGIrsO6iowRrWQlf6/5HgrXBWQLufgavak9E3mkWatkBMG8N
	t58sWuvoBcL/4vCiwCBOfIcVWzQY+k6I0NUm5eyz84cFLZOy7fboAnbmVNK0KMUalc1W1Tp
	RLC4vUZaMtRM84gcREd4tTBaGtQeymW8XhBt7PIquBy5PaTdb1f+eEDqJ/mVDasrWV4ef3b
	3gn7fecvXbOrVJaNRyUdHyvOr3SbqCXknMIrSOVRHcX6gKl3Cq3QYguOOvaM4mmFAZHo+ii
	DfkRJpLSgfDauavjR/njhASunFnYt26LQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Acked-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 226e3cab6ca0..b1d1c6df8b1d 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -34,10 +34,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
 	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
 };
 
+static const struct ci_hdrc_platform_data ci_k1_pdata = {
+	.capoffset	= DEF_CAPOFFSET,
+	.flags		= CI_HDRC_DISABLE_STREAMING |
+			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
+			  CI_HDRC_DUAL_ROLE_NOT_OTG,
+};
+
 static const struct of_device_id ci_hdrc_usb2_of_match[] = {
 	{ .compatible = "chipidea,usb2" },
 	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
 	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
+	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);

-- 
2.34.1

