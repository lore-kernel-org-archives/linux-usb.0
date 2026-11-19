Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095738;
	b=RvJjLTccRo3ER8Olsts+iQzCOpygmn0oveJaD48XsegEq/IN87Bcs8mx1U0LV1RKsBuE
	 lf+/EgtB2o7nc0wlAMjjUEiSyd30zfa0ryqPOSbAaOdkKrO8yMoj69owztvVtUbIREsTi
	 iEBaLXUN4HYNV+TullZjd9gCjGRSVZeMcwVM281SVKeORy9/jxNcciDPI28S/AtC/YqG+
	 2kGFax/tSdGfKsCsXMF6EUy53oMcRpT+c+FurnZng44oJ2aGT7NK94KsoUMiEmIeQwdL0
	 K7Rs/EzbEfBDj1OIACDl1+YWDH/eyVW8fzWu4sSznHW4HuCS8LM8+7vE/BEO7rDMBCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095738;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=93JGExmDvLbuW+oC4tjK7kMLorNu6gupm5sqCUxSJas=;
	b=VVzZIPsd3KZUDdzbib2wwc0xPiMl7HFR8StoipI63bWes3ib7bPHGtYOsM50ROdCqAE9
	 HPENhwH4Be3bLzrGmePRvkFKmHatYoLk9NZ7FJ3LTxeIOxFkCBRZaG1OemfqZWYH3TqFb
	 H4cQ9jD7vgmNl7RAb75J1Rx5XqUUFl7E80pj9vZTKzbHqJwxDTOernLPrrfEwj64riBmc
	 Dg2BRuI/FTlUune26mHz1yLsEuJhtRIJ2ESLQH0tIno4Y0lopdRMM+DoJICow87zDxUmX
	 ydopnseo/vszBCXYK4/pMg44qIGK3JjNDJZBX3ETuF+wdoqxp6YBSdbwYFmUlPJLdrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gDtSumDQ;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28060A262B;
	Thu, 19 Nov 2026 13:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B28060A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gDtSumDQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795095717;
	bh=93JGExmDvLbuW+oC4tjK7kMLorNu6gupm5sqCUxSJas=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=gDtSumDQ8hu+B9WIeBWbQxzuQv7PXIRF8UUKXtHU6TB6B86UXq6RlT8TYdIZtoklF
	 qEZae5DI17xmFK517BGJOQAm8kbUPsyjJRouY5NWP8SIHAnxvubfE24UQt830Xz2iu
	 ZnhS7Ml4kSg5Rot4UyBAobwBIe3llD9o8JAFqtMI=
X-QQ-mid: zesmtpgz7t1795095712tffd6494b
X-QQ-Originating-IP: dLUPNlyNIbcztw6i3WSgaEvFS/vMwOSwntm0pZqPxsU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:41:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17830256423621997771
EX-QQ-RecipientCnt: 16
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH v6 0/5] Add SpacemiT K1 USB2.0 controllers support
Date: Thu, 19 Nov 2026 21:41:49 +0800
Message-Id: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAJ38/moC/33OwU7DMAwG4FeZciaT4yRtzIn3QBzSxGERrJ2ar
 Rqa+u6kk2AcWo6/ZX/+b6LwmLmI591NjDzlkoe+huZpJ8LB9+8sc6xZIGADTqHsjCwnH/iYz/J
 DyUvpUFLrYwrodLRO1MvTyClf7+rrW82HXM7D+HV/Mqll+r83KQkyoQsJiS1i9/KZ+8t1/7O4D
 8NRLPCED4zArWO4YNBqgyl5sGoT038wbNcxXbHALZB11ICmTcz8YgqA1jFTMYzk2Go0kfwmZh+
 YUhvNbMUsBu2QQvDNerN5nr8Bt1ZucPMBAAA=
X-Change-ID: 20260812-b4-spacemit-k1-usb2-97adfc283d58
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795095710; l=3014;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=TqluRmT/VQB7LfSLhpDGI5y1zKrDzvzJhnZexVT50xs=;
 b=bdUeE/ceXJs7e8o00nWPNNac+fn8nBAqapatdHquoFv7z/unRMxfetBfGUn5zNQEV2ylmXgvy
 TyMtGcpo1ROC+cAW/rdSS0DP90HgdbTlk+vM+m8Td9IiLVmDfC8lHaW
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Mw4SyGTR9S7/ifJaahEXGtfygspmIv2nnf3mQVlIRRGrK6OjMG8UDB0V
	0OBPp83u7Z+icFIMRR4Wf17Twhx5/XjsOx0t+PfzyKsTt9lE7Yob6sU9wNSFyHruH3KibNk
	qBkv3OgKB+qphPwSdXUS2UA/9UxyE0qoecZsCyBvEbO29PM8IEyo3g+mUnQq7lFzmni0dNn
	Oldiw6Ipsq9ZchriejBa4p9xPIbJ3vpqffmunGKICPQ+gyn2GPuk1GdHGxoK+ssSXAZPQGU
	+zxP/9XdAK1vTm9EdufdgvRBkwtQrveiz4n39S7jWzL9ZbHgjKdelawXH6HvgOT6suzqGFz
	4tSBAYiU3+mb+MB0tmFgMYcVCz33JxBa6p20DcOUgWzsP4d+IURuGVao6P3pdFw3I0Wh6j+
	hBqJ01Un1RIyveSBwnVZjjc3KVgmT7caBIzASkqTRM3kZ/bpbh/aSwpEdDu8FcGot//94/z
	ZqIHobwS2B0b4ukS+jqOk0UKfM2DGby0K0lOYUb+oVqnS4v7HGw/nFQzmYOEwcl2Rxf1fdR
	5P8pue32BdYJV56iXhphaYyoNFZQcHpdC6N14MzpysTNiyokB/2HABtWyhgKwRoyQRTlNJ2
	E3b7BuVuPYFpyPIpKP41DLR11Ros9XSj0evCQqZwPATnUb9ogBXWGBh0R8kcoawp8VFbhe+
	fEPK8U0KnkeFsHxvdPRjjGm8+vCUo1v9rz3rxpYAro8hM8TnnF9rvoBupIJUPR96YPQruGL
	k0s24URWFD6JZ3eIUkOvdQFkElxPqLRanctjEKUqpQYFNYKmPRQlWg8YivS+5gztxwnFPrj
	w91rJvQn+QWgLM2PG/xbxzGAH3bHU1TXfnYnlNrv1+l5xn0U31KAj9+dRW0DEk3oXYHPIDs
	dX6s/RgRFmkbA6mM/KrAQjVyRDGThL6XAZXXoyixJ1kq43LxTwDsoABZ84KsRQi8Yh/DaV9
	Kp4ZnEwC6nrnT3LxWM6+FE1fJZ0fGnpd2Yf/95ooUGn89pVdoYWKw0caspNIaE6nRviK9zD
	xSjCmdiOVxCXuHiScfkNzVGGL2xO+kBAeJa9j+1kY/tNQ7unUHSPNwlO6umurKVNCCFK6aC
	+9Pszaw0wSy8kzZGYPNbeA=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support.

This series is based on 7.4-rc3 and has been tested on Banana Pi F3
development board.

The devicetree and defconfig patches for this controller were previously
part of this series. They are now sent separately against the SoC tree,
so this series only contains the binding and the driver.

A self-powered USB device/hub is needed to test the host function of the
dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
cellular module e.g.) is needed to test the host only controller.

---
Changes in v6:
- split the devicetree and defconfig patches out into separate series
- rebase on 7.4-rc3 to pick up the devm_kmalloc_obj() treewide, which avoids
  a conflict in ci_hdrc_usb2.c
- Link to v5: https://lore.kernel.org/r/20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com

Changes in v5:
- rebase on 7.4-rc1
- drop the ci_hdrc_usb2_priv struct as sashiko suggested
- Link to v4: https://lore.kernel.org/r/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com

Changes in v4:
- drop irrelevant Tested-by tags collected by b4
- collect Reviewd-by from Yixun
- Link to v3: https://lore.kernel.org/r/20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com

Changes in v3:
- collect tags
- merge the two dt-binding commits
- use local variables when acquiring devm managed clock/reset
- drop manual clk_disable_unprepare() from the remove path
- enable related drivers as modules in defconfig
- Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com

Changes in v2:
- rebase on 7.3-rc1 and collect tags
- reorder the usbphy and usb nodes in k1-bananapi-f3
- add constraint for spacemit,k1-usb2 in dt-binding
- add OrangePi RV2 device-tree change
- use devm_clk_get_optional_enabled() for driver according to sashiko's advice
- Link to v1: https://lore.kernel.org/r/20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

---
Junzhong Pan (5):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
      usb: chipidea: usb2: use devm_clk_get_optional_enabled()
      usb: chipidea: usb2: drop the ci_hdrc_usb2_priv wrapper struct
      usb: chipidea: usb2: add optional reset support
      usb: chipidea: usb2: add SpacemiT K1 support

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 59 ++++++++++------------
 2 files changed, 43 insertions(+), 31 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>

