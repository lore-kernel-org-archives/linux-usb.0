Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663981;
	b=HRUv+gsyObrIJ/3Irayr3WMiSzp1Udv28y48InLgJgMagleyqPrrPKvNmRLMi5YjgMiI
	 unLcadqozyNAncFbu2nKNCezi9MwPvkb0PI2ANyTLcMmN5Llswdm5GcYxHQQ4aZ5b24Kx
	 Q/XZcNJwM/Y66Pg/bVw/OxiU6BaM5x4q5ATthmvTGeA8ekKEROBGEQc1gy6OQTsj8GxZ9
	 pviVbwNBXWroGznfJ+jZJI6IBx0wklycmizROv+elTaiSHzZK0qzLbOHiqb3ToYj0rQLq
	 3otNpyMFLnA1FveGDp1AANG+MD1RWiRkSGzJCQZ4qLNjYUEX4XJp62R9VDwj7h9/8TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663981;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=+jN0VcdpvLekZruacmIw0jXDrzU60lSohURpZVwtWFI=;
	b=dPM7rb+OJNaklMuHVzdE/F8vJ0GE/6xga8IybzaWc669aPcYgJiINl7mxz0tXuaEW+1Z
	 mgq1Iun53WSiBEvwPUNvu3Sdbhf2A5eaw0wbLN+LVHiP7wVEhlNtxjs50wxVPaQKFlN7o
	 kZYQtbg5I6SSnAzKxsgJcmaw5EOUY9d/pvv3mTzm/oTj6NKRWpTkvkUfKK1d2kxqNpEzc
	 uCvons7M0WiRetmnifDWpGHVPmfFVPSmmZMMOoaRAX+k6hu4ttjL1t7Z7y5dnRy3xI2h5
	 YkJyuntOq2MqY4R6P4oPnnaR1zgUcnpe+kQlZ/jtwsTQ8gOxd2Eg/DzH2j2JX9N3WBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=STBK5FbN;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8F2606A697;
	Thu, 26 Nov 2026 03:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8F2606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=STBK5FbN
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WGXd83951801, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663936; bh=+jN0VcdpvLekZruacmIw0jXDrzU60lSohURpZVwtWFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=STBK5FbNzJI/f6C03qXxluEtqq6jAS5ua390Kb2j/0Bto5IdkWE3n17++xfzs+fFL
	 iLTod6UtMn5NTENA37rLctZX4MCEqt1bH6yk8Q1FWj24VHQaS5RoofN8IK9plkieud
	 Cjec6y72z5dSZGU+oK0iwfflrPLrMlZzHQg34tWgVEVls5WRT5ArvIuYAze4QZd9H1
	 IcUx/pBVmUYCuPVA6t+EcTj2AvlILFjwwv2JT9T+tMVT7ZC1NVmI0cfOdVuj+EocHT
	 pFw9Vc4np7r4xoboKBttRJyWsZijsJWA2i1LCNzQOcc+iw06STQmau0budwJvFsnGZ
	 mNsi+F9wRHdiw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WGXd83951801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 11:32:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 11:32:16 +0800
Received: from fc44.realtek.com.tw (172.22.241.7) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 11:32:16 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: <davem@davemloft.net>, <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
	<hsu.chih.kai@realtek.com>, <andrew+netdev@lunn.ch>, <mail@birger-koblitz.de>
Subject: [PATCH net-next v9 07/12] r8152: accept PLA and USB firmware blocks for RTL8157 and RTL8159
Date: Thu, 26 Nov 2026 11:32:06 +0800
Message-ID: <20261126033211.51850-8-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126033211.51850-1-nic_swsd@realtek.com>
References: <20261126033211.51850-1-nic_swsd@realtek.com>
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
Content-Type: text/plain

rtl8152_is_fw_mac_ok() has no RTL_VER_16 or RTL_VER_17 case, so any
RTL_FW_PLA or RTL_FW_USB block in the firmware for these chips fails
the check and the whole image is rejected with "check PLA firmware
failed" or "check USB firmware failed".

Add both versions with the same layout as RTL_VER_14: 16 break points
and USB_BP2_EN as the enable register.

Fixes: a51e171e176c ("r8152: Add firmware upload capability for RTL8157/RTL8159")
Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>
---
 drivers/net/usb/r8152.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 7e553652f97ec..3e16d0f832bc3 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -4904,6 +4904,8 @@ static bool rtl8152_is_fw_mac_ok(struct r8152 *tp, struct fw_mac *mac)
 			max_bp = 8;
 			break;
 		case RTL_VER_14:
+		case RTL_VER_16:
+		case RTL_VER_17:
 			fw_reg = 0xf800;
 			bp_ba_addr = PLA_BP_BA;
 			bp_en_addr = USB_BP2_EN;
@@ -4932,6 +4934,8 @@ static bool rtl8152_is_fw_mac_ok(struct r8152 *tp, struct fw_mac *mac)
 		case RTL_VER_13:
 		case RTL_VER_14:
 		case RTL_VER_15:
+		case RTL_VER_16:
+		case RTL_VER_17:
 			fw_reg = 0xe600;
 			bp_ba_addr = USB_BP_BA;
 			bp_en_addr = USB_BP2_EN;
-- 
2.34.1

