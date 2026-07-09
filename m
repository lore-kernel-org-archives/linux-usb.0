Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C211A3BBFCC;
	Thu,  9 Jul 2026 06:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578167; cv=none; b=b92mh0BlSL9Cy12gbFxoJZsEz7NeTcEh7ABzfC6YJvq++cDE0/OFa+I/AgovnGbFuYO+e243B6ACGN4yavyRKdjpSB6XOpNda5fcXmhFA/p6i2THuDWNfnN+LAfIMDIyxIKSgYY31OuoFwyno2ntqRapufOMGiPxfoHjgDXJ4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578167; c=relaxed/simple;
	bh=hJVJYt1V74dN+biRLT9LitTAX/NdOvmOzoTEyDkeWOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ge0a4aV/VlT7lqAv1RYXntUzpe6/6SppiwTKEw/iXC4XBmaG0YJWAXz2NEn3pKAiu70YB969shZULHaZnU4p28OyrVIF/HyAPP2k/Yx0YttG+7uG5ldClxX1IWV0942FI8ImE1wKfvc0wiGkw3CvJPMxOKMUEsFEtGPLhJRozm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=MBzGCQWo; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="MBzGCQWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1783578125;
	bh=jowBylnUpvxzvvAE/qL/SMyiPzSG4P533Ggmr6WUoW4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=MBzGCQWo2WwcRN/aj6pNmFT5U91UXUQ9M59ZizN5/iNHJUEJWS7xejMHwH6IhZP+9
	 oTxX6SS2O5guTGWwoemJWojDogOUjixb0LCbwYg2TQbd0JWyvkscNiD/kALRnf+ND/
	 yRdcQV9z9QFDLR/KGanxH2gTB1Mb+psetcqrbS1M=
X-QQ-mid: esmtpsz11t1783578124t02b2f65d
X-QQ-Originating-IP: JBcvtFhZlgGGmAW/a1wTKWv3Tw0ykR3fOMlRCNFHWSY=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Jul 2026 14:22:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9108130892998750175
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julian Braha <julianbraha@gmail.com>,
	Xu Yang <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v3] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for TYPEC_DP_ALTMODE
Date: Thu,  9 Jul 2026 14:21:47 +0800
Message-Id: <20260709062147.240-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N3IC8um5pMyY41Bft6aOrYRcgmTOidcJoD6OxpCwp+Z22pms/OlNFoj7
	IAh0wB8XoSt5JdWrYdnZmguwg8hXQMfaGCPnYXjz+LS7LflP0BZvozXVnlTJtGQpif/N2Vk
	FW9IciciALxjMWSrtVoFG6F+8VgzY8Nm/pF7XzPk+1TpeD/sDb/v+9/GQc1UlUAGDZDS3xu
	tS8CI5jvcKWegQ8QLQrjpNQ8+jZzWYUZCAyUi53bItpgePMEQcvSGbj6y+b188kiXD9AiNR
	lgZTSYNLF2uh8t1xqtK9uz4ei+Jhhh9whkFgLNCUFuqRouvAhIdCThK76PqWPktKwzN+a+F
	4j4YY3XOXfg5PQo/KjS6XPJ1990kEQpSlUNv+AVazq05pT1ihy+wJU9lSo0KgpLOjOkM3nX
	MnRStcs42gPAZUB8Wy43NfObitxUTiM8Qmb3mN1Mp+K595Oy32j/9Amk3AJXkkuSmkeBSua
	TkZZXIiDWXsc5HpLOp67nsljTBwr7OZZ0pYr/STJADQOhAawKRFObBXkaM4CqivxUlr0FwZ
	7bzY2o5uUTPccPQ96bKCkfvE2UVu9i2+VALPOn2irURC8ba3A6daFfgzeeADc0XDAv2Mlc4
	iuuzfKn4cI6xIBAun8v1IiSmm3flNaqBUpish1U7yrhIStChHOud0CFgd5rdwodWgRRKCk+
	1471pc8BRXUlsAp1cku2Y/OIWTckNpeGYic5Ul5X8py8M8236uzF3zeC5QSCUjMNBs8U8pb
	30p71yYwr7CoGPRJAKNM1xwZjKb3O5dlfqglXrr7hrGlFKUE1Pw3sfLMdrH7XBEB18S5OQn
	4PX+ta7WcRH/vMelP502CspW3HWIwPthLZMETP/lXwQGi2PV2STV9CildEYeN7ix+/ssepJ
	EuFfW4QOYO0Hk/ACilNpJ4Fs+NXECQJRP0bmR3T2EVpMLYaZUPPwMgFpyiT+q+8x4Bf6Nom
	Tl0fCY9YjaH0K/td7Na4XmhsP9AGzPHUx8IMAcOj+vCwjq3sXNcTh2QtdDJ+WrpYJib0/SF
	zhCWTrEg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
also needed for embedded platforms. Select it when available.

Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260705065832.184-1-kernel@airkyi.com/
- Use the same "select" as v1 to make things simple. 

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/
- Change "select" to "imply".
---

 drivers/usb/typec/altmodes/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index 7867fa7c405d..b054c0b6a8d4 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
 config TYPEC_DP_ALTMODE
 	tristate "DisplayPort Alternate Mode driver"
 	depends on DRM
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
 	  displays and adapters to be attached to the USB Type-C
-- 
2.54.0

