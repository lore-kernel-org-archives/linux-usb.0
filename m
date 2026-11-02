Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579733;
	b=pLyjRrFSbiVwRjQktpfr0Uo47eqhI9lE6XbCysBGEAZJwCLWKLePmPc/tdwEvZ9VviSg
	 gJbAjdT/ApvPT/dQ7Ay7HVti6BAe3b+hi6/ZGh2Le2oB7XvUzEd1zmm3nJdg26lHMlWgq
	 YGipab3vUrkkw262cJ2B0jk3zGMODL75psvfzQIatItKHs8vIM8jjWChmTiPol2HJMpR0
	 HtpGzO+bn9n36xdJNebei4d0gezq3cOfOL6tPh6u2Lq46hfNPYXm/tLXUAdMyt4kcn/WE
	 18XDdH9Fgv0X78AL77XebBCHMRsDRLp6Grr498w1jp0Dx9IeKG5k7wXTcR4p0Aw7lIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xBBiHeCR7jKFbqPuSWsbgd3Hit459uvXqE4qXlk5ksw=;
	b=3ESVkjsos9DAAIhSezpsy2ruB134FApfsbOj5qprDp5KFxWAdK/5w1Y9ExJI2lK4bsoA
	 R7Ks3k7LJi9LcveS2EEIOrv5cw7bVnvmq2X4kPURoRHRAVmr3bSsSQsPlQGYL36Z+ghju
	 ykww8b4RChFzCttT2Gpc54AP7HDIa7a2txGvWT/+gSG6NVqvUe8wcwW98eu4AyN76LhDz
	 PlA/A4R58yw6HC+8o1KGRgcS24Aitj86aV6+Op5FKzHZLrWfbYgPO/ntiUiDLnkoB923K
	 2B+bKkReRzlAbnqrGvmbWblC3rBtvrAaJ7SS/vg1ajQHSnYG8/o6qsfWX0ijknoEGMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tztyUsvQ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8E606A32E
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 00:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF8E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tztyUsvQ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so1356783f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793579731; x=1794184531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBBiHeCR7jKFbqPuSWsbgd3Hit459uvXqE4qXlk5ksw=;
        b=tztyUsvQqzw91ufCZy/XX9YBS7YHGm3vlKyqWf9JLOvw7LUzkq37qxlRKlt+kmnt8o
         7g88Ylxuj242OtdWw61WHoAu4IdvP953K8x8IeGvj0KU4lKDvqODWRc2vu2mXhrNNI5j
         V+drM2Kji1mZ6dakw+Go0QeNNLkzifHDfjUn2zQn2iWVr+qeiETnBpoBtgUw7yJRstVn
         6I/8WyrUQLbBomgSREb04EfZrHMFKMOW6GFEcnP9FpgNfvmcAe7b+V5K/mZaFJyd6F4e
         NBg/g1op75hgaD5ReGlqXgmLnrEumhi1EFGLAoLE5Ew5qxievXTOuHWXDgM98OcQL4T7
         VFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579731; x=1794184531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBBiHeCR7jKFbqPuSWsbgd3Hit459uvXqE4qXlk5ksw=;
        b=E0F9BrCwQbK1iqq8hqNtYn606IiTl9JLJO9Q8tpqCEy+oGyLYFWK77wr2J4vmNWPQv
         tAthxKfNNaSnyhH1jBoS0xWizvCOtVD0opZRYshTaN7iXd9NsRayE8fWGXDLX4kWMLke
         6Apl7+zrUGTm3wgYWZgJzdozojmUxT/k++9bSUxrGHd9JX8cpN4fLqdvMTY23McjrdQE
         p+t3kmokmeIN3hurTfwNwMfzlTi+zAxLmxGbFbn0QShGjY44K9KdNqrt3aGAmRm32ZlS
         8X4u7aMx7clWsFCKRMGkNK72XOseuFaMKtWAHUNzpImj7CQZai3NQ2qfj83uJ2xV4eHa
         EeDA==
X-Forwarded-Encrypted: i=1; AKwUvBwLxTPMw4o7/JI3/Z/kbgkPK3G5upwW66lhwmCWJOLukwXWb9aXQtr5hZjEHAHExHd6I15fFxLUivo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hMuPNyZ4oIWHZbkdPBINe9UNekzI+PPNGPzzUMnWFgRGCJlIc
	ZVmCmqDQ8l0QrIhhSPIzDWUEQdPzwZJYk4pJdtqeoFZgHsn3cZq2s1o=
X-Gm-Gg: AYBFou3HwvLJiKMOfRV6K5ZCiG+y9kvzxq2at8JaBcBrtRl/bqKQmPwdwg3loI+nz0/
	OspMC0rPY+iMBZlRfK9f00zXcpzIwx+iqVVZk7u7oAH2Vno6aRJf1U7a6F+de2ULBPX3bw3n11M
	de86zoZn9RMH77j+eHTRUsqSBZ6jd1YROvz7jJZdowO5Rd08wjAjQFUYZdkDQsf5Gzl3aVRPVM5
	OUowGYkjJJOd/EDSQgaadzrSg+NK7+rUBk5Hs9MyM0msVpi5uXCadyuh/S5TGrc3i6MhL3rTYY6
	ty5AfnD5Wi5XphOJzT7WnXV6bQyJBuww2QfQOx5HufYtRJvkNZTx5XDseTyhK8jVvUjVtoMwd+S
	sZbBgqs9KW5u2mTmE9DLXNRORG3y0KGu40Flpy4X3n8RSA4OFl4WRrTli9bNO/s2epTRevvEA8m
	Y9jxW8At8s2IFv+7nPuVydLrpVs2JDmze6g/0bCXK+1TDsq8TGMEFfi1+Wc6QLY2PcQWGoyzf74
	VJTJo/mr891T5LLQjMl/R9TFiYxojkxCHbr/KUj8HzeXPwbC4hXZkVhwUy/0Px/iSqZY4QGgXnf
	akkg05gJ84CXl2X6OHN9Any9iCGSFUEs6cvkgH4UW8yiQwdCXY07B3066OA=
X-Received: by 2002:a05:6000:2311:b0:48a:f320:dba0 with SMTP id ffacd0b85a97d-48e6e4ffa7bmr19379378f8f.45.1793579731393;
        Sun, 01 Nov 2026 16:35:31 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm16571688f8f.23.2026.11.01.16.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:35:29 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asdlerto Korry <korryasdlerto@gmail.com>
Subject: [PATCH] usb: typec: ucsi: Fix printing of a fwnode with %pOFn
Date: Mon,  2 Nov 2026 02:35:08 +0200
Message-Id: <20261102003508.341309-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ucsi_glink and ucsi_huawei_gaokun walk the connector nodes with
device_for_each_child_node(), which yields a struct fwnode_handle, but
print it with %pOFn, which expects a struct device_node. vsprintf then
treats the fwnode_handle as a device_node and calls fwnode_get_name()
on a pointer into the middle of it, so the "missing reg property" error
path oopses instead of printing the message (seen with the same code in
pmic_glink_altmode on a Samsung Galaxy M52 5G).

Use %pfwP, the specifier for the name of a fwnode.

Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c         | 2 +-
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1db0c88d817e..4b4905624d61 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -433,7 +433,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {
-			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
 			return ret;
 		}
 
diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..fc74c205181e 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -430,7 +430,7 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 	device_for_each_child_node(dev, fwnode) {
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {
-			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
 			fwnode_handle_put(fwnode);
 			return ret;
 		}
-- 
2.25.1

