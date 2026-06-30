Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A324A45104C
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 19:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849108; cv=none; b=Wd2a1VP5gSLMDvJw9Ey8q5mvu2NI+j6PkdFkx84K0IR6IUO4Tjaqu/xwIS8fn5wKw3XI2c9pqX5NAHR5N9WTX7dHhQCM8KYKq//bMplCW6o3eYQN5uaHwTTw6WcPsap5Rh20Kac467W6E6gX47B4fPC4TGvEXjWc+0RxHgm4T/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849108; c=relaxed/simple;
	bh=IHED1bhwhaIFXZzAtTG598QDZu83K0PbPJZHuBhlpRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDyrSSE/g43BGKuUnFslxgN86PjZVUCsbm/O0CjrXVK6iwoNx/zer6aNO9J+hMA9s6lxGk7VJ34cUPr5zYEYTE+NokkeyU+1kmykfnHusgPtjKj0atKZ30fiUIDpbd1HOYVCAZiPpyd/sXcIkXWEziZpj96BFUTx1ERV4R1b2Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryEmU+Ja; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryEmU+Ja"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13b2b08a553so2721198c88.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782849107; x=1783453907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm0OFa+tCcoIZaTYvevqY142K/nJxOVjlT4BYE1lqx0=;
        b=ryEmU+JajQhVp2XZlUlQCsGXwydj1otyU63z3IczPsvI60l8aqXPt1Wi0Hg+WbcVGC
         2yw3yhPdJymW85+FElhwe0JZxJMcG5h6c2pjoP6XyO9wlJWPU1mIcJIedNrQuK3yO2AL
         fn3olVCitoBgLM82GIQ7SjeBzxamYz/tVooRvqa9Jy4z/PvxmwSvA694VyK3o2ILN2cb
         PzFOWLREoegzO0jof3lss02Vut5/Cd1J1gHLxAzpYLNygaL58rjizy/h3WeKhaif8o4c
         w2C3YpRpch+7GZYHrgrGb33zoUuxAhcojZK4Ip4TlR1LYTRtthKZQn2c+EoFfm/LF7+n
         lNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782849107; x=1783453907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm0OFa+tCcoIZaTYvevqY142K/nJxOVjlT4BYE1lqx0=;
        b=TcEdXouUdqUXRNDZaXV2O48ZqbuRkwXnkFY+7Qfpp+CNF/bn+4syHWA58xpYieOSbd
         xedFmgoLV6mvOZ9T/ijGqN8esjn6dVFbHrHob/3ZwGN4qvHKkPRzbDSgeqlcDNNNnDDN
         +waOJ+k8CdziP5ISLSvFd+OBjoyyzPY0g+KuSCdoccwFMxQZeo0ijn05zYvmST53cguC
         xy3eCRlc0gcDf4o9ocbHjRfbX0LOSsgDWcrOssVLL5G4c9lcW1JqH8odvA24N8rOeUFt
         50skZXyZHTOxry6F/7UAnWFNmdXNBg2qZ1sUSmx/i3K0YwFLUWMBG50wo9TEPe4bIDCg
         AcDA==
X-Gm-Message-State: AOJu0YzeRSwIOVt30EzrQPCUq2tDJY4ezxsb+HTknTLxUS+c0sdLf2rp
	t6oTu+is3do+hQ3FIOt6bnkfkW8u/IFNr5YkXSTnoZ/C6wN3Lb2Sh8udSOjXh+pp
X-Gm-Gg: AfdE7ckX/jkKQekJk62XXS0as7kRiF9ksVJ2Q3f+NLpGRY0cXX4XJctlsM0Tb2PCgZL
	xP0GA+gEZJqlGCAArTvtyMY2yrfdHjVOezSrqlNHkKxAE4oZb4//cqFfP6P2VB3P3IHGzD3+1id
	nVmC7gtxx8CXTBDE2kOpSgUe4rOg9ylnRjMld/iGZlOuSL5lOwovNlgG0SlKPW1BtngvleutAek
	O+Pq38PCHU520+XyKDxoVlcceQS5CdKq6hRjRXvTymUuoo8gi++7qQy5rdcPM6bJnyfSgliDs7t
	rmPhMzmvVW4f2oS0YoowC0tlfdevLQEdh/xoj5thvyKLUmv3hs6XTvk/lIubAtl9p1SR9nWIixh
	0vvGRJx9o33bh0Et314MgMZbT3+b5NkCvTsPszkfdGJkWxh026Xq/EfvkabNlAR5Ntsvf4qqqNM
	dr57ApzouLpV2ttCY2Hh51tHsmedwNhB9io6/Mm1EVw/xm3n+1mnAFb0bPCNw4XHBKx2Kw7Jhss
	VAVvc42FQ==
X-Received: by 2002:a05:7300:5783:b0:30c:ab97:d7ae with SMTP id 5a478bee46e88-30ee13fd797mr4091475eec.40.1782849106578;
        Tue, 30 Jun 2026 12:51:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm10569467eec.27.2026.06.30.12.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:51:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: fsl-mph-dr-of: add regulator support
Date: Tue, 30 Jun 2026 12:51:44 -0700
Message-ID: <20260630195144.88122-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices have a GPIO that controls power to the USB bus. Add
support for a vbus regulator to have the kernel control it automatically
instead of having to rely on userspace.

Acquire the regulator in the common probe path so that it works for
all fsl-usb2-dr compatible controllers, not just MPC5121.

Tested on a TP-LINK WDR4900v1 by adding roughly the following

reg_power_usb: regulator {
	compatible = "regulator-fixed";
	regulator-name = "power_usb";
	regulator-min-microvolt = <5000000>;
	regulator-max-microvolt = <5000000>;
	gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;  
	enable-active-high;
	regulator-boot-on;
};

uhubctl and rmmod both turn USB power off.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/fsl-mph-dr-of.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 852649156b16..85b08f2f162d 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
+#include <linux/regulator/consumer.h>
 
 struct fsl_usb2_dev_data {
 	char *dr_mode;		/* controller mode */
@@ -182,7 +183,7 @@ static int fsl_usb2_mph_dr_of_probe(struct platform_device *ofdev)
 	const struct fsl_usb2_platform_data *match_data;
 	const unsigned char *prop;
 	static unsigned int idx;
-	int i;
+	int i, err;
 
 	if (!of_device_is_available(np))
 		return -ENODEV;
@@ -242,6 +243,10 @@ static int fsl_usb2_mph_dr_of_probe(struct platform_device *ofdev)
 		}
 	}
 
+	err = devm_regulator_get_enable_optional(&ofdev->dev, "vbus");
+	if (err)
+		return dev_err_probe(&ofdev->dev, err, "failed to get vbus regulator\n");
+
 	for (i = 0; i < ARRAY_SIZE(dev_data->drivers); i++) {
 		if (!dev_data->drivers[i])
 			continue;
-- 
2.55.0

