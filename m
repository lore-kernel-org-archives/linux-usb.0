Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663990;
	b=gPClajkbyVc36Lu0fzlNK5cYBfVn9wuipstV/dIymsGtSHkxrwgz4rkea1MCt3AwHt6O
	 ZQ2MefVc0xSpr9LZsnyfp7bXfh9bBbHouTLGE6RC//lguvnWFEHDrP5SQu4MKg+WcuzU2
	 aKJKJ3S8/l/rXi9AVZngprK18orZ1YeDsZLy9CpzC5N35Yg9deu8Pht7NFsGfMU2yGNGA
	 xZ2vD0Ko7901Qm/7WhGTmhi2dgw67irsQQx0VG8YrHucSql6zQdFjIO3pr6NcGtt9/0ye
	 WUbUcOk5Ybxcjw+zjFb3WnYAQT1gT5OQK0qJhvk8Hy0SCtfJ2wBp6lJdQMuYD/8WbDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663990;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=KNSTVPHPWtuLm7l0lnCFcdMK9ibF44zHiEa73A+7LCo=;
	b=ZDIa65BubCeXgqiB+hVFwyIJs6qt4KfMzeMuof8VYqwnmRJxFUI8Cl8A7ozzg3MOV4M0
	 tbhA9Za1Go0jycbRe8xvM6HbopbSNY9t8GiptZzbTZHbugCCaRQfqilZpwpJJCOd1QsmF
	 Hy1ng9NcCPAqJc0qnqGgzNvyVOJ/8CXrOsuq1mgRYogD2xer8dOvcvMNeT4ItWHn69YiW
	 Tybejv5tObaF47aumPIsNntfU090yxKqF0/2D8D0QtZQvWxKjv45uES+tkBlxOMHkjKRp
	 ZVpa0j/YdQBzqOZeYW16AEM9mQkGig8N5lRDZnwsdMId9wBmDXmKwm6bI4FS1OXZk8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=M9owt4nq;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F2606A6A3;
	Thu, 26 Nov 2026 03:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7F2606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=M9owt4nq
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WFs143951798, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663935; bh=KNSTVPHPWtuLm7l0lnCFcdMK9ibF44zHiEa73A+7LCo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=M9owt4nqQIdkYpBxoy7XzZnvxeVQUTy1Yu1CRwlJDXr4eeqfl+Fh8d2SDe2wk9CVX
	 f0rDDhmZtGuzSFPKqrld7ZbiPh48/FQgWfX7ANNvm2lXr+yafAX4iX8OEKFVsJsJ7c
	 FeZfbk4o9zS99ohO6F/xx/0vF+IuIYX4e6truvc3ZG8OutOPbRTiYhstfa82XzW67U
	 +FuzYdhXah7pcIr+5gGaPAjcrg/EYS8pvovCALTKzEbKzUMWWMAvxDd1Dwua/lN4lr
	 Ryd0+EKHJPU6iNF3ACPl+z71/7Wht5ZUlURDbhXPhlrUrTCh4h9qq9Q+BVaQsRLyUQ
	 kX9Lc2m4V7whg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WFs143951798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 11:32:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 11:32:15 +0800
Received: from fc44.realtek.com.tw (172.22.241.7) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 11:32:15 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: <davem@davemloft.net>, <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
	<hsu.chih.kai@realtek.com>, <andrew+netdev@lunn.ch>, <mail@birger-koblitz.de>
Subject: [PATCH net-next v9 02/12] r8152: add rtl8157_unload() for RTL8157 and RTL8159
Date: Thu, 26 Nov 2026 11:32:01 +0800
Message-ID: <20261126033211.51850-3-nic_swsd@realtek.com>
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

RTL8157 and RTL8159 used rtl8153_unload(), which disables power cut
with r8153_power_cut_en(). Per the datasheet they need
r8157_power_cut_en(), which r8156_init() already calls for them.

Add rtl8157_unload() for them, and move the Interrupt Mitigation
disable that rtl8153_unload() gated on "version >= RTL_VER_16" into
it unconditionally.

Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>
---
 drivers/net/usb/r8152.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index d00cc911ae135..bb4106f238a3a 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9696,11 +9696,6 @@ static void rtl8153_unload(struct r8152 *tp)
 		return;
 
 	r8153_power_cut_en(tp, false);
-
-	if (tp->version >= RTL_VER_16) {
-		/* Disable Interrupt Mitigation */
-		ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xcf04, BIT(0) | BIT(1) | BIT(2) | BIT(7));
-	}
 }
 
 static void rtl8153b_unload(struct r8152 *tp)
@@ -9711,6 +9706,16 @@ static void rtl8153b_unload(struct r8152 *tp)
 	r8153b_power_cut_en(tp, false);
 }
 
+static void rtl8157_unload(struct r8152 *tp)
+{
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		return;
+
+	r8157_power_cut_en(tp, false);
+	ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xcf04,
+			  BIT(0) | BIT(1) | BIT(2) | BIT(7));
+}
+
 static int r8152_desc_init(struct r8152 *tp)
 {
 	tp->rx_desc.size = sizeof(struct rx_desc);
@@ -9889,7 +9894,7 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->disable		= rtl8153_disable;
 		ops->up			= rtl8156_up;
 		ops->down		= rtl8156_down;
-		ops->unload		= rtl8153_unload;
+		ops->unload		= rtl8157_unload;
 		ops->eee_get		= r8153_get_eee;
 		ops->eee_set		= r8152_set_eee;
 		ops->in_nway		= rtl8153_in_nway;
@@ -9911,7 +9916,7 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->disable		= rtl8153_disable;
 		ops->up			= rtl8156_up;
 		ops->down		= rtl8156_down;
-		ops->unload		= rtl8153_unload;
+		ops->unload		= rtl8157_unload;
 		ops->eee_get		= r8153_get_eee;
 		ops->eee_set		= r8152_set_eee;
 		ops->in_nway		= rtl8153_in_nway;
-- 
2.34.1

