Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D4C40BCBD;
	Wed, 12 Aug 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526969; cv=none; b=b+USpBJ1ganOgWplNvGqTX2xP+2i9Zhv5yn9aOlmWsA7fw3cMUKgXDn0hw4sigKckCOPKYweU5FqBPWXQvHRb82+BX/VDWJqsJLzBPgcgr4eZuHk9Bfku/VsMnrxbeZuL0zxTdwMF3X2UUsXwH5Z8GjgmFyR6usPmm9GDAZxU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526969; c=relaxed/simple;
	bh=t9+vAyNBc5hbWcoEznMTg58r47M+gdps0UnYHSvqFwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJVo5wMAWEGrN3F7K78lKEgp2ygxhKPVdxL7LxelsmZx3bufkWyGBZ61TIDjnBf8efSwApuafLx6KDxW+UZkGoQOWwpsAP2Du7G7BXz0T1Ww5ylIGtP4tzem22uIpxfx8RmwbZ/CdBaxTNwu94W8kXhGwhuQdSuiQysBDS/+cbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jzrNmO6d; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jzrNmO6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526894;
	bh=FIACfTE6HY9gRQUYe7MUc5uIAOvWe4xknMRb2EjO4tg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=jzrNmO6dApx9vM+S6qrtjoidwc5DkTPXfNEpXMxIYx0aS7S5zfDhZrqLCYM6X69P8
	 Xn4Hy/BWcShanwflpC+507OPfayFcEAYAKlLpq5Pn0aF9myJpfLDJFpV7mK++kf71x
	 KxTLXDPalQLKNlbtni3xCRz90S1xADTG+PLwx4kY=
X-QQ-mid: esmtpsz19t1786526887tdddef16c
X-QQ-Originating-IP: 4ywHshY3prd/YrZlsz3cbXCTcv2+vS2r4y3VpvHJUvU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16021684546642310656
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:14 +0800
Subject: [PATCH 3/6] usb: chipidea: usb2: add SpacemiT K1 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-3-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=1248;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=t9+vAyNBc5hbWcoEznMTg58r47M+gdps0UnYHSvqFwA=;
 b=DNePWlRca9q6sgDuGmHvfUFcfcteN+TwEO1f9979xv37Y7Zihx6Tl1gKBe/qkwpShms/x+ced
 pE/pLVo92GpAYqU/uOr23/rhG9TwBoSQpaMxD9ftlUaof7Vm0qMhUM4
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MViTLAucusFcYetUF76ExbeMNcojO7kx79taiXHn0PQ6r09OXUhQNgWK
	qfuMxTmdYi6exka4WTKcwgw6DC9lOc7nPHKEz+0rSn8VX1kkt9+7uGPL2BUrtcm2KaC64qC
	JlPDAZ5PWnBvXg58Ii9R8DW8OT9/RWIWWq0vv5sScNF3SeBMVfbxMmrG/SjRlub/az0XwUL
	ovxcs2OCjvbtoKR9ph4fuVGGq1iT2plfYxTVvi8O6QzL5OW3SCcOk7VO1zVWCPc2OcnXKiK
	9HPtEPYdzj4AEseWYw0ylGsxCIv3n1odT/jSh29Fgrw1rr4eyOldq6URgamXPBoSDibbSod
	I8ek+lzdIFol/VNhAVufyO/c8JyrJYQN3An6jgm4QPFHkTypgPs9rQEpivvaxZXy/HcZklm
	U+Gx5G37IUjCJ/tGioVB9KxnmoiFQNqneMV4n7Igy1KmYYqflq+gLOb9fpmvVUoH+k8gjQH
	UCwXse40ALIbil+t/Lfp/S55MPsiecaAYhQ768bj4etnHfhl3fwLn5QrXc3OE0Hfs3M1nGH
	yFbK7+4wQrrd0iNhdQGKW5wyK+l4N/pcplGNo3aWVB/a6fKgwuS31c1v+69YZQzE6xRFALt
	N+L7nuilU9zN64+dzZb56bNwIrrl/Z54Ysqd6OQpFlD7coq/HGMPOhMF5w8e8m6O0KSTOsO
	Q6CSkpQl4rGU91a61Yj+9mw80p/vW8fQxrUHJgkXN9bIudv/8Xq/JnS2HsK/TO5M6YmxFRu
	5W5gj+PzjWOkudky813fj67zWPRMDDviI2eM7TcJA0NytlGdNHYCkf2jSvljWDgbCujUILT
	Tb6/KeZrUR9gWAZscFAglCfyamre+X058b4IDOA2mTaMJrOJWSUFPJjVIYaMKNvUTjiqC85
	5RTgFcPC6pR1QnFAmqHDHwyjOLADHbLaRpFgG8rG/ZjlRfWqZKNohC4rucVthVB7/7RiVHS
	WYIQIVC0RAu/G7Z5vE9iNRtn5Dxuvqjw8E+vWmMJjB7gI+SQ0L134sVf5nFRz6Ur1f/pJk8
	iOMtbTVjiw3exj7+TDtVn6Lqk8l4jMlmQjT5mqas/r8Cmen7182z2ooQhE7YF1VSjkBV+EU
	Wfrn2W4+p2/czmUusboiwQOFmK+QRU/nIfODx3xC8n+SsRU3laZzieiSIaHo4Butw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 00d575cd2955..70c5ce750519 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -40,10 +40,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
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

