Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007261BF33
	for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784465791; cv=none; b=Fx1nXV1m8euO8tZecVV6O3x8JQ4hKlxEJbfG6gKt6v7M8J5p+h5WQKAam6B1zMgHehV/etScH3Eq56oVJHlZ0+BhdkXCVqIJnlSl8VIjwu5hD9oQbTScVVteV3jzbcnQeAcTxN+IqAi2MY25+DIVkiFMufUlcZt8DYAb+rLIWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784465791; c=relaxed/simple;
	bh=TshTtph4XpDtLC0dRiJ/OQINrhwR+YX+U/Elo4w8YsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DO9l8Wj1I9YTqu1gRHPORPiaplNTa38WOWmtnRnGwtgKmfb402p+b1TpEcxR0Ue6XpxQJ0jSJ3W1lYlSFm94XlPgKpeLQVMbB79I8582jr4cATHWccII4WpUZ8bNgbnN867SYpuKYEdYURrk1jlrN6z4y7UKMkIMB1oiWqvw+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDO5R0IS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDO5R0IS"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1368535a91.2
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465789; x=1785070589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hVhgq8qkFjQgYXBuINyY4J7kP1MwBhvWar/OW6Gmc8=;
        b=pDO5R0ISMTZWuRE10Ot8yr3/Re3W81ohDzZgvGqwrmEpaLWu2hkt2vpq/Z2bW7dB8v
         zafOsMGmHa7cop464mYILANI7pBcEkua+dZsEtNy/uSc9CGt32nNOiKFxsJyHpAG7eAt
         bEIn1VAY778UGEudVIfsv1gMeyqqeprRjzpQ+K55D1X/IPSMhx+RiuD5WWJmUdT7UMdH
         pcpgEie7HN0Vo+9EFfT46B04lRmKb+ZjFtCKyavAQI5OKayCRl5tP5oy6lRPWGYgddE9
         3+W10NNTK8f51RdoD712syUIakaceR9A+698aEkXK4G9zDlutJYhe3UkMYChpKCicY8m
         AfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465789; x=1785070589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hVhgq8qkFjQgYXBuINyY4J7kP1MwBhvWar/OW6Gmc8=;
        b=fty++lmJQLRUlPwAco6Sbdq5jzBP1wedEXbMgFo4theNU20jdTlzIkbW0pv6UpOI/o
         wJ9QSNThCuF8/XgK/uCjDP10Ri5RtnDU1CeV2hSAbxqwveqZS3Iq73PC6HYA+UZI+g3A
         Xgdmmdb/vUN2kruG2OovqvTLTPHraQZ07USAiJRn7R8cNc1veTSEHpQkvLKB07xLT92K
         ErbiGPuMqNR/ecA1JdLZnq9fg3/Eq6wmiBEDLcXJNXlCOXMf5rzISEIwcF5P41UCqEck
         DnG+uk5h8KFCSQzeQlE7M8r2+7lofAhHbmy02IjlRcMOADzDS9dxBOf+gP855l3Y1Lji
         yGZg==
X-Gm-Message-State: AOJu0YxSsbgEzP9YWIV2WV+iQOpranXBJpVrOQc8SDM+9rJb973b5DFd
	mAMURxZOdZrsPpIdcFBzXt3SyiVAtkmj/Fh5kLKOPre3g1s8tWSjSN/U
X-Gm-Gg: AfdE7cnXhkosS8RLea4JdzXjJ+Y3cIiI+a1H/rhlhzzzAMTI8hZRM5G1HAJFJnExKwv
	0e18zGv9XVxkpmj22g+k7oRPb6NI2q/N+zrReOzh+sv0kjDWT+6KMeJYhiXvplEecFWiL+JAU2y
	u1cOio7B/mu871B+oKYJaOdCyEBW7Rb1fbdfoJVi2hKdWmBz13qOOykdst/QVFEaM4h4Klhmtsv
	leanf92uUj80lv/wTEVJbByy6/wLa1z4TRn7/l2AAnxwDJamIx6x+bgdlsL5OoWxnDsskYOviUU
	VEk6lOJXfJlU/SithbXNo7zmDrksojOagrMw2y7LvgyhMLzZ241qFFhueOw0friFOFnyLsNb3ET
	upETOleQx062/0x/Iz4w17SWckxRWWC3meaK9GceDWR+8n5Il0pYP4Bd30Iaq/HFjKDNvtE6OHb
	+yjRw=
X-Received: by 2002:a17:90b:6cc:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38e4b5792a6mr11187005a91.37.1784465789205;
        Sun, 19 Jul 2026 05:56:29 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:28 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 19 Jul 2026 18:25:48 +0530
Subject: [PATCH 3/3] usb: typec: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=3117;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=TshTtph4XpDtLC0dRiJ/OQINrhwR+YX+U/Elo4w8YsU=;
 b=rOqRg26QyDZf5559WdNDPWAG75Lk1bUfU++c9aZ6toUgJ75Al395i1fAUcJgGkaQAbCTmnSVA
 MlK66hcnFGXCwfDAeiZvJ89y1HvvgA+mdLV+wyy9OEmYm+j7FFo8UZW
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in various typec drivers. This prints symbolic
error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
making error logs more readable.

This patch fixes coccinelle reported warnings:
./typec/tcpm/tcpm.c:4799:60-67: WARNING: Consider using %pe to print PTR_ERR()
./typec/mux/pi3usb30532.c:143:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/mux/pi3usb30532.c:155:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/wusb3801.c:281:5-12: WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/typec/mux/pi3usb30532.c | 8 ++++----
 drivers/usb/typec/tcpm/tcpm.c       | 2 +-
 drivers/usb/typec/wusb3801.c        | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 985683fe49e9..a2357a28ecf4 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -139,8 +139,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
 
 	pi->sw = typec_switch_register(dev, &sw_desc);
 	if (IS_ERR(pi->sw)) {
-		dev_err(dev, "Error registering typec switch: %ld\n",
-			PTR_ERR(pi->sw));
+		dev_err(dev, "Error registering typec switch: %pe\n",
+			pi->sw);
 		return PTR_ERR(pi->sw);
 	}
 
@@ -151,8 +151,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
 	pi->mux = typec_mux_register(dev, &mux_desc);
 	if (IS_ERR(pi->mux)) {
 		typec_switch_unregister(pi->sw);
-		dev_err(dev, "Error registering typec mux: %ld\n",
-			PTR_ERR(pi->mux));
+		dev_err(dev, "Error registering typec mux: %pe\n",
+			pi->mux);
 		return PTR_ERR(pi->mux);
 	}
 
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 89eec20a2064..ad10470ea73b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4796,7 +4796,7 @@ static void tcpm_typec_connect(struct tcpm_port *port)
 			port->partner_desc.accessory = TYPEC_ACCESSORY_NONE;
 		partner = typec_register_partner(port->typec_port, &port->partner_desc);
 		if (IS_ERR(partner)) {
-			dev_err(port->dev, "Failed to register partner (%ld)\n", PTR_ERR(partner));
+			dev_err(port->dev, "Failed to register partner (%pe)\n", partner);
 			return;
 		}
 
diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
index 6062875fb04a..86d13ab41670 100644
--- a/drivers/usb/typec/wusb3801.c
+++ b/drivers/usb/typec/wusb3801.c
@@ -277,8 +277,8 @@ static void wusb3801_hw_update(struct wusb3801 *wusb3801)
 		if (partner_type != WUSB3801_STAT_PARTNER_STANDBY) {
 			wusb3801->partner = typec_register_partner(port, &desc);
 			if (IS_ERR(wusb3801->partner))
-				dev_err(dev, "Failed to register partner: %ld\n",
-					PTR_ERR(wusb3801->partner));
+				dev_err(dev, "Failed to register partner: %pe\n",
+					wusb3801->partner);
 		}
 
 		data_role = pwr_role == TYPEC_SOURCE ? TYPEC_HOST : TYPEC_DEVICE;

-- 
2.43.0

