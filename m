Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5D2F290A
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587407; cv=none; b=cdVlYVlyrEzMymvKcNI7QloM9autj9xahMb00Mieim5kIo77tbXLCVIQZ8ssChskSn/fvDW64myIpRyvptyejuQT+nXJUIm4HAYNxcvADqMsNSmfmKK1tyUnizF0AOfE5AKJgbrTHF0Fb1sm+drM+OmKZqVLmq6HWMCZDFGIE64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587407; c=relaxed/simple;
	bh=mFXIwz+ySAWkDRjmYY9h6zI5LpQ96dUOJf0gRTWHXyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgRkWvLrrWdF9spSHOnX5PRv8WXB8xMGHUZ6O9lt9bfNoptlpEzbQVtn6zbgbHiHTkJodOsHHNeaXR1i0mlZH4DxkPnYjpX0YZiN7ib7jFtzgMrmgD46TXpbTGqLh8obJBWcY6R+ZiPowZbO8UvCVdbMlafsJTIMUJyN//wOH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCboV6YK; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCboV6YK"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1397698a12.0
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587405; x=1786192205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pHBa06CaOVH7j+70B2z/e3yTJBG/rMdeErbOIVU81A=;
        b=jCboV6YKvYvpPbSnWWIHmxkLjJZxc5oNp+iPLqQwIGFUTvrIxC1CMndX+arEkcYrxd
         L+C6aY17jnBI6+iD8bX1/saF0lt9fQXqnJ3A4h9sKwrSDb5ZvubZiBmcSIEOReAyUHLb
         XmhX0pVLxk4eQ9JNidl5ZPL4VRSwRGRhUlYabGQvg6azJzUS6fE/FaOm8Yc6ACh2oDU5
         FaNaSFOiEP/79lIeN2AmzlFq3Z4P8K50YJOeFx1DBMWr/AXYKqIpVKJPefh4BG3mmdIP
         0Q0I9sTOjAIb1JBiAi9t3zg2LS8wc8kw8sbTLyKMPansCIbjsUlGXxA0sDdX6Qg5IGeU
         IzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587405; x=1786192205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHBa06CaOVH7j+70B2z/e3yTJBG/rMdeErbOIVU81A=;
        b=lr22HGStkbP6l9PjEYSu5dv2SzONgKvX4oJP70FPYKFrMoPGwC3vyp+PdGQ0EHKIhg
         GmxHSM3JJbjyEIOt4MH/XySNTkc16JFRPhkHwpkknVXPqHBwXVXvTImG1o8UFokVedlR
         EEf6cknkHhIsug2PlANQZXvBnvsUwk29eaS0SMRxOWaytag63tBB3AWZQ1VqN2wx0cuI
         VYDz73hyHKU1hFUHO8c9zsJJaooxgheYBRvPp4cYMOxjxsUfySd+2NCc7rMS+2ZXjXeE
         TmJdHbs24CVfp+ChyWmqM62D+YExwFa5w0Tsb1ga/a0qcYIMsLxanHAA9zvZOQ1zV0m4
         uxNA==
X-Gm-Message-State: AOJu0YyzWF+GnecZJh6RZhP09mfi/EP8Z9oPBBpIFhd6cwFD2ktUiq0f
	zmnhD4xANs9dT03zzCk8xrhg+RSo2aELzFVBssWH5VG538+6Jcs+xawAWngG79Tl
X-Gm-Gg: AR+sD10li77hFVv3btVYI6dr0a0B5g+RnJjM9U8/s+OOogt5BawQ5Yf5l4uAtedHR6N
	Xlnr5QXk6GyHeVKlCqGGvVGet5tvPxCU8KAQXm+sNk0UH7niTKHSMzbFWzQZBQSNLURSk08PDa6
	R6zJOCI5WWlImH8qDdc9BpY7eVL7NQcIA/pYE/D3BXMLUx2FzvXTSpAiQKoolhf+MzACqLXmihq
	mk1izuZ1mdN6mY5ZaAmnbtpv0O2ivdfMYS1QoDrcWTFk3L2nLOfFHpeLB0Unm+CEJCITojgKIIZ
	SOaoraH+NuhK+YSpxa3WfimParQooop9PhFbI7IeS5nd2swXkS4AC61KitN3eRSyYgtBE4I8eDD
	V6WNDVNu+zXHrpAM24nwTLCL5kZFgTtw9PFmfqlpIHBG+N19V9Bd/pJ+2UvnDNHPjrdoEO34xzn
	1Rwvqpy0OJ0YFpSDkqA5uPsCvWO06GHSY5IXsgo+mSznGuXNQClTiVfiGSBg7fpg4=
X-Received: by 2002:a05:6a21:3086:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c92a53bfc2mr3432958637.23.1785587404863;
        Sat, 01 Aug 2026 05:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:30:04 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sat, 01 Aug 2026 17:59:50 +0530
Subject: [PATCH v2 1/3] usb: chipidea: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-usb-ptr_err_patchset-v2-1-1698e298c1e3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=2678;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=mFXIwz+ySAWkDRjmYY9h6zI5LpQ96dUOJf0gRTWHXyw=;
 b=jfKEnthypoEP4Ged3oIPzGHgkh8fKEboHHtGYp8GnOOl731ypclqaBCWEJk45aqjaYWxcPebl
 IdK8bprk/6pAX4FCm6k6twbF0DDejmsTDWYcJ4FJf/VMEEHKfJU05J6
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in imx_get_clks(), ci_hdrc_imx_probe(), and
ci_get_platdata(). This prints symbolic error names (e.g. -ENOMEM)
instead of errno numbers (e.g. -12), making error logs more readable.

Fix coccinelle reported warning:
WARNING: Consider using %pe to print PTR_ERR()

Compile-tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 12 ++++++------
 drivers/usb/chipidea/core.c        |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..7bfe37ed68ae 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -218,8 +218,8 @@ static int imx_get_clks(struct device *dev)
 		if (IS_ERR(data->clk)) {
 			ret = PTR_ERR(data->clk);
 			dev_err(dev,
-				"Failed to get clks, err=%ld,%ld\n",
-				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
+				"Failed to get clks, err=%pe,%pe\n",
+				data->clk, data->clk_ipg);
 			return ret;
 		}
 		/* Get wakeup clock. Not all of the platforms need to
@@ -448,8 +448,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		pinctrl_hsic_idle = pinctrl_lookup_state(data->pinctrl, "idle");
 		if (IS_ERR(pinctrl_hsic_idle)) {
 			dev_err(dev,
-				"pinctrl_hsic_idle lookup failed, err=%ld\n",
-					PTR_ERR(pinctrl_hsic_idle));
+				"pinctrl_hsic_idle lookup failed, err=%pe\n",
+					pinctrl_hsic_idle);
 			ret = PTR_ERR(pinctrl_hsic_idle);
 			goto err_put;
 		}
@@ -464,8 +464,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 								"active");
 		if (IS_ERR(data->pinctrl_hsic_active)) {
 			dev_err(dev,
-				"pinctrl_hsic_active lookup failed, err=%ld\n",
-					PTR_ERR(data->pinctrl_hsic_active));
+				"pinctrl_hsic_active lookup failed, err=%pe\n",
+					data->pinctrl_hsic_active);
 			ret = PTR_ERR(data->pinctrl_hsic_active);
 			goto err_put;
 		}
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 07563be0013f..09db8a4eace2 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -680,8 +680,8 @@ static int ci_get_platdata(struct device *dev,
 			/* no vbus regulator is needed */
 			platdata->reg_vbus = NULL;
 		} else if (IS_ERR(platdata->reg_vbus)) {
-			dev_err(dev, "Getting regulator error: %ld\n",
-				PTR_ERR(platdata->reg_vbus));
+			dev_err(dev, "Getting regulator error: %pe\n",
+				platdata->reg_vbus);
 			return PTR_ERR(platdata->reg_vbus);
 		}
 		/* Get TPL support */

-- 
2.43.0

