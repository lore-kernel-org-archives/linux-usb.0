Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF0328B5E
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587421; cv=none; b=mdUopEavUsSNQ7YNyf4pljd08dYViX3Nz/akSfMk8RL2ERIe8Y3CTn0pSwjKrqJ3t2ml+JQZ9/JR3YWk3OjOMFHkfxP7BEkTVBAPC2y/8VuMbZp654GjEsQhCu6BJpKzZYQf9IUEfaUG/BkgBCQivaOj/tJzbeUnAQs/UuOy+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587421; c=relaxed/simple;
	bh=EixTu8F/XmrqpGkUc1ZAKwt7Ik8fS3oCoez4NHHuAPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rT5HK0Ig7/ve5dn6kWSPvtYsVFax5EvZmXW2f+Vno6w4vYUgOA1tzM8fF9yRitK6zhNgGvi39v57P5sZFh4ssXpRhMPrX5KiY+cNG+w01WJpiB80RWFMkoSWfImgupA9P5g0pRwc7z+G/4K+YwHIzlLJCd78i+vULaeE1mAjwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOZXSgOJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOZXSgOJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2803491b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587417; x=1786192217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZXu4hUthVdVMyzR8sBV5EnxrSahb+P4A553ME38qa0=;
        b=WOZXSgOJjx0ZjmIkfuQtj9T2AZd6qh8Qb92UvfH/s2Is+c6PdtqSAZUxDgNyKW4rwT
         iEorZDSztXrZSeSfhNADDRAQDPanOsW6vbqjP+CDgp1XmpyP0yoT1zQi0F2M2EExXkoh
         Vcw+7ebWm8EGjjpgzSTjzoZn3JX+ZLOUViE4P+cp+rw50AvsbmsomGyg4sZSnDuo0r8b
         4xxWXmq4frmkQAxk4eXetKgQ8dlhOZ0OgmFiJykbcq/YnfNO97buUlaEmkdFn5grlSGo
         pogW7QU/3JOv+0w6FTQSrH/h2hiuTmnhZOUtbHOAbp2B/jK6dlKVlCEyHC35umSzB1u0
         KMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587417; x=1786192217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZXu4hUthVdVMyzR8sBV5EnxrSahb+P4A553ME38qa0=;
        b=M/EmfDs6kgS9+V3g/gMC/4IEee9xBkK2b3phAMGokK2M3EVzVMqRpA26PPp3A5Xu1w
         cF+is82HX9it93pLOPpLZNvMF9JaAOUse5KnMxufjURRRtxofv4dzkymY2Dfeq5wYLfT
         cxUnKFAcxiSVlsQF/npTzaVDc/fKUT6l0xG4rqAblyY5ulcgt0dneLjmUSlYMJCXrZWQ
         0jbhSOiEwDLM4wtkvsBxS3MjmD1UYMKXwc678WkQbuS2WIAgMLD7TdJa7ZAqiZnDgzFZ
         2L5DHNgVJugFpZeBkJ57xV5v5VDOL6JOjs6kT/+CJisFaB+oYbpEnjysT50PJj1AFj50
         fyTw==
X-Gm-Message-State: AOJu0YyU+PwGvHdFxK2aoMszzRJwtfrVhLRHAOtXXhhMIY737R+YJhhg
	fD4mMzDSx+GLzmxvjPCaOAbqScZIH258WPPmNtfRCtfoy5kmgQkwhDq5
X-Gm-Gg: AR+sD13UUfuDUW9sdF6T0NlUZdqYItarjekU5AHeXkWxIVtX81lbG8COonznyqGp/wN
	1Lm+5U/Ex/nGTk0elPV9npoDrTrn6n4/nH2usS+ZpWdvsoVUARyrHM/McYr/n9eXvRrZX85jXgs
	PvcZG6cG1DUjnS83eH8XpOx8IWfZCb6FN3eVg0StZS6fJbhxLvqNb/ohiKn/vxkZCJ5IIs7Ptuf
	2WX/OKS0wDwzQiGpvJFQWeh9dr8gPehcHuWB1TOLKz1cOYWJCOwXWyzrONCOMmdEMIQctDb402S
	VVMKp04f3I+4kXdUL4reh9yA+n+2ePVlxLxt8lEqY2EvtiOaLWpYz55Gk1+FzMbXIxy0uq6zaCy
	8sGsLg52vpoi73Bdt8ujLXXSoXY3GQCewl3ivkx6Laco5e/90LtcXIscoR38y9j6uYYo9mfBZO2
	gUMkpPYtmE6ryoWRmPfLoUqbQ1gdOaZaV/UsXXxh42tcIvCMNgvi2scu5rvTo5O/ikz3lxOS7wt
	hQ=
X-Received: by 2002:a05:6a20:d809:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3c92a63ad0bmr3140772637.30.1785587416840;
        Sat, 01 Aug 2026 05:30:16 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:30:16 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sat, 01 Aug 2026 17:59:52 +0530
Subject: [PATCH v2 3/3] usb: typec: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-usb-ptr_err_patchset-v2-3-1698e298c1e3@gmail.com>
References: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
In-Reply-To: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=2871;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=EixTu8F/XmrqpGkUc1ZAKwt7Ik8fS3oCoez4NHHuAPA=;
 b=y9rlU0Bar73W/79icXHYY1Za1xqYHDFPlcRNAyzBdU9DLsdx5ZFdZAtAfdQnYCacrmDjy37bN
 67dNNmpkRFUB7JSMQ26Hj03dv6oZIIwgFS5fqDwVdYCNRhAPyYsGqab
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in various typec drivers. This prints symbolic
error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
making error logs more readable.

Fix coccinelle reported warning:
WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/typec/mux/pi3usb30532.c | 6 ++----
 drivers/usb/typec/tcpm/tcpm.c       | 2 +-
 drivers/usb/typec/wusb3801.c        | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 985683fe49e9..b32f4c433de9 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -139,8 +139,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
 
 	pi->sw = typec_switch_register(dev, &sw_desc);
 	if (IS_ERR(pi->sw)) {
-		dev_err(dev, "Error registering typec switch: %ld\n",
-			PTR_ERR(pi->sw));
+		dev_err(dev, "Error registering typec switch: %pe\n", pi->sw);
 		return PTR_ERR(pi->sw);
 	}
 
@@ -151,8 +150,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
 	pi->mux = typec_mux_register(dev, &mux_desc);
 	if (IS_ERR(pi->mux)) {
 		typec_switch_unregister(pi->sw);
-		dev_err(dev, "Error registering typec mux: %ld\n",
-			PTR_ERR(pi->mux));
+		dev_err(dev, "Error registering typec mux: %pe\n", pi->mux);
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

