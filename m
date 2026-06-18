Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890263EB0F4
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777716; cv=none; b=UzjhDIuo9XCI3BWSaZw/7jWzl/4OWKeVoH8j0bxkLirnsyeSzeNrUot81eiajXpvnMUpSIY6ajKj/eNAD5A4/xTmdil0zrKxdxtEUYfhCWkGigb+L2NZQb5mJyyd9CqnGyHes5OAmoNtTv6I398gf/YGkX6mmhjx9mR+cbRZQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777716; c=relaxed/simple;
	bh=VRaDko0DUVq72GOfqGykoCOU7FMNSQo1WTrbna5YUT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPcINzxYamO2Ks52F5zKe5xtE7gaQKGbtnQrFh64zdBbr5mWSLPtaX669/FYdaM1Dz2cx4p6Ar6Mpu+z5BNg0EGkO/sV3dTtiRluT6/VDKfCCmKLCJCLvVJJm0Qcmipwew0MZH3weXNby1da+CcQS5CmRipUPx0V8Gol87w9IoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dOFwZzTK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dOFwZzTK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4626fdc829aso602640f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781777707; x=1782382507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUwaRcs/J+cVFA/Hno8SLSYO8ZO17SVINUvpRUgcPhg=;
        b=dOFwZzTKoCVrcXmwqK8uFqbEqpWXioXM+hvqV9Qr62Zca3Eqj9z1Q4Med0ejhGDKFj
         54CY/XNFnOQnaMVcdsPa6U2w/qcGyGxc1J+Rh2qZ+wL1hiO4T9WWdTdLal4Ycgw3A4jU
         YOhwG/h/3xRVXaUrqeyghCqivEYqSPxAKsCpU6mmKm/Okn11rAPBWxdBn/U6CHiG/LwC
         jlbCxOU4PU2SszRKxGVTSu7K0ehddUI+71kH55I+2/atc4lBOybncNdk/fzT747wThkd
         NLt47sGBfxpJD0SJNiuJMOXbO3+yFqsZqEgRRx1NTMsXuBo8FaRg5u0PxinahSbxQ/HQ
         CZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777707; x=1782382507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HUwaRcs/J+cVFA/Hno8SLSYO8ZO17SVINUvpRUgcPhg=;
        b=XRBouFiXqRw3xCckjO9356h20KySC6JljiMMgt8R6cJ4cfvsa2w0xeQa44USEUOhvR
         ypAZ0aYl7DnGnzxy8hyCapas2JSWXW+ZA5baFDToUvG3ocTkfF39R/OrXimDgRViPZ42
         6flU8TcPv2wArtpn9eyYYDfiv3tNgOkPkq5y0pkwhUtvk9AZ+NNMwoYGH8+oQwnVktqI
         EyOddDpXisBSyaTHY+uL9rHeyG5/Z9ElE71vul1ALJ5vEhc4fUVoqR/9p0viSTt9h30u
         8Vj3UrHdUnPwUXWj1WGWKUloJ36wTOR2NTbYryUVyuRDf4JDvYvjsrkuexa0dDhR7yAo
         yLmA==
X-Forwarded-Encrypted: i=1; AFNElJ8IEqilbd4O/Gh/cpW8jjFx+ZIs1+QJzLAz3Q6+/IqUaJlEPRq0vwFUZ58Sq4VJdkvzsiNIRO1bF+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrFbkBZsnfPs2xIqJPKITCURm5IO75oEVd9w5sRjab+gCxh+R
	zgZhDlU3ncRbVkmjPZ714Y7p4Th4msETmNVanjz+j3mmLAJedYYZY49tJncRMJZF5Yo=
X-Gm-Gg: AfdE7cm30ocAGpt4i2rkeK8/gJC2j1Jq3QQNh9PD52HZwhLUMy4aEgp0SDjFAvuDY72
	SBm3/P3N4EsNqRFWYoRBaM2waGRxUYe1dseE9gI1palHxojUBHHrABAwQHFpt02vjPE05QEvG0c
	W2NjITDqwm++zQ+2OdMqGznkST8fpAfbEiwrLMpsk7Wp3YY253hiPxoSSTsbOxJHTCT5Xh+r3PF
	BzVfo3YkiBrj1yoEp6Igo6otGBvCuSjNowPETA6Ft8+/SUC4M9SrwhU0LqK5uCXrQeUeB/Xd2NZ
	etee3CnIPQtEYNRRAYNuFv0L1Gkfxn67hgDK3t6xwFp7ZdWfDIHWVgSRVYJM/Srutb+4Jmn2fiv
	bmSLADJq5M1q8ML81RanlQ4ojhi311DoRx9Y8PRMxfyrZUTvAm63gaXlfiixHW5ALbPOhzEfmOv
	PI1GUEuo134v2uK+z3iXBRiWm41/1sFeJIbyc/u2/suFst/e22b7MtIK1kBQ93iUe0NryF2zbTt
	7j8
X-Received: by 2002:a5d:51cc:0:b0:461:a169:f757 with SMTP id ffacd0b85a97d-4623fd87011mr9676750f8f.16.1781777707392;
        Thu, 18 Jun 2026 03:15:07 -0700 (PDT)
Received: from localhost (p200300f65f47db048595530b320b6c5c.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8595:530b:320b:6c5c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f263945sm64066132f8f.8.2026.06.18.03.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:15:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 1/3] thunderbold: Stop passing matched device ID to .probe()
Date: Thu, 18 Jun 2026 12:14:50 +0200
Message-ID:  <67d4dff187016bdef8fa41c23bb9b6647f1ad41b.1781776904.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781776904.git.u.kleine-koenig@baylibre.com>
References: <cover.1781776904.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3270; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=VRaDko0DUVq72GOfqGykoCOU7FMNSQo1WTrbna5YUT8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhizjo7L8AoeW5ci3hu5TkFc++6olOI7F7kxtZu56XseYO 5rsZuadjMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEzEbwb7P0ulLv9r2yI/FOqf z/lTxFb04sEUlZqe+ll7FJv8Lrzdz/hlKZMSu53TN87z85Yp1x1NVL18ddbDE68cUmTLnmoHhLX 23Pxf/y7/z4bXE+pN1JXUjj783bVWp0RSaPdEjor1+6KWTjrH52N+NqD3jmC7rt51TysLWyfB9t sBVtXzL3j8u9whfbPkrXzvijX3PjisKFxt4FXhUmTzb7eNkIhPkzrfZF6FKGFFJasMRn6Xyq3TG icuc1PTm7S3/u7M6/nVxs+Lt3487GQ7MdreOYhRb4Wpom08/4cX4m8id/lvbDuwpOz0lPUW60Sr v7w9t76uOqeeZVveFYegc6lq/fvVdwm8XXu2gLmHPdgbAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

No driver makes use of that parameter, so drop it and don't spend the
effort to determine the matching entry.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/net/thunderbolt/main.c | 2 +-
 drivers/thunderbolt/dma_test.c | 2 +-
 drivers/thunderbolt/domain.c   | 4 +---
 drivers/thunderbolt/stream.c   | 2 +-
 include/linux/thunderbolt.h    | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index f8f97e8e2226..edfcfc41a316 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -1335,7 +1335,7 @@ static void tbnet_generate_mac(struct net_device *dev)
 	dev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 }
 
-static int tbnet_probe(struct tb_service *svc, const struct tb_service_id *id)
+static int tbnet_probe(struct tb_service *svc)
 {
 	struct tb_xdomain *xd = tb_service_parent(svc);
 	struct net_device *dev;
diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 7877319b1b03..63e6bbf00e12 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -636,7 +636,7 @@ static void dma_test_debugfs_init(struct tb_service *svc)
 	debugfs_create_file("test", 0200, debugfs_dir, svc, &test_fops);
 }
 
-static int dma_test_probe(struct tb_service *svc, const struct tb_service_id *id)
+static int dma_test_probe(struct tb_service *svc)
 {
 	struct tb_xdomain *xd = tb_service_parent(svc);
 	struct dma_test *dt;
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 479fa4d265c2..24611f05b3cd 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -77,12 +77,10 @@ static int tb_service_probe(struct device *dev)
 {
 	struct tb_service *svc = tb_to_service(dev);
 	struct tb_service_driver *driver;
-	const struct tb_service_id *id;
 
 	driver = container_of(dev->driver, struct tb_service_driver, driver);
-	id = __tb_service_match(dev, &driver->driver);
 
-	return driver->probe(svc, id);
+	return driver->probe(svc);
 }
 
 static void tb_service_remove(struct device *dev)
diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index c1f5c55583d0..b28e4e95b422 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -1540,7 +1540,7 @@ static void tbstream_group_detach_stream(struct tbstream *stream)
 	config_group_put(&sg->group);
 }
 
-static int tbstream_probe(struct tb_service *svc, const struct tb_service_id *id)
+static int tbstream_probe(struct tb_service *svc)
 {
 	struct tbstream *stream;
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index feb1af175cfd..d9dec4322aa0 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -465,7 +465,7 @@ static inline struct tb_service *tb_to_service(struct device *dev)
  */
 struct tb_service_driver {
 	struct device_driver driver;
-	int (*probe)(struct tb_service *svc, const struct tb_service_id *id);
+	int (*probe)(struct tb_service *svc);
 	void (*remove)(struct tb_service *svc);
 	void (*shutdown)(struct tb_service *svc);
 	const struct tb_service_id *id_table;
-- 
2.47.3

