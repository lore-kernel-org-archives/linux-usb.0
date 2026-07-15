Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B803D954B
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105673; cv=none; b=g4YpMhDQYeIz152Gni0Xan50+SSM6w/T3JSw+T6x6HVMOZT8R6GMHFVZ1E9bDrDrZ+aNFfKhJLv3I3uXabgsmduxg16Mrz45SbakGidBnc2vMod+Vqu+lrgwMz4Nozrt2Lr4I1XSJKqjc1QPgL6OQgAYEmtHBAmwOB+Khp8M5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105673; c=relaxed/simple;
	bh=rdGoAErDNJBoyYumylqg66ArDzAHOM3wX5UO22Ntd3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvUyMsF/+t/v/m3yzVWsWn04g/ofVTEsbcPnjEcwjtN0+1DsIDqbmUQe+WxoJgMmZXovQQIZhc7fmZu/FuuDrjNbMUzW7xzJdBXujT25GwBFGoImQfasjPOh0/kO6ASvKn/o/wRq6BJCeA8fAzzUDykeAD30kh0itYuz5B+QpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ijHjYnM/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ijHjYnM/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5531111b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105671; x=1784710471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=ijHjYnM/3tgn+KlB+XxWanrduV9o18Y3avJUFrunGxFuIrrYkuL+D12bpNP/I7jtPY
         qMpapp6Z9xkr0JBfggFmD+XgiixuwdlgM0SMgqxpKpkvVwkGXfpgfim+SJsMYS7md3QT
         y3nIvdooeKsthPUoeQI4b7aPmyGfWsCZejwb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105671; x=1784710471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=jihE6o68cziroBSy3cstfwtjVTyo672LEfSctWhOwoE9HmT+07xC3ETc6vwR/SnrbL
         rR8wwWfRZj3hzikmAZEWmjDsXt4HriJiBZMXMWLryZRhgrVlQVc6OgzSkXrAqymoNrXm
         6HIxL2O/4ebmfrXECdHfYi4lo+epFodKeoIfhE6YldmOFCbdX/k9QR8NPsyHMV5Qz6ZS
         MlskDu8kvxxHxiTDSou80tWcOUIN2EWOKCI8x+la2cKToIwAJ5ivgbpIVpwM2BzBb+sk
         KJcp61NCekFX8Z/A4lHnQKwTzJzygvbpPoip6k8+LsbfMH/hxKhLknQdatySJSi/KnRI
         5cWg==
X-Forwarded-Encrypted: i=1; AHgh+RrQCLmU5fW0zJntPOXkpNoHYarpu+d03qi4WngJrtIa2tsxtF1fadAZOCP5mpDD5EYylDVulVifBxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6c9FZTZPIiuxVJxc/wHZ2diiTn9uZWrwyU0mPiFCfYypE/bf
	lKFM0tedvaPJgnJ/NKA6fPIQ2sCYXKheir5r7cNzK9bJcM2SFstHfYuJB+5o5V5yuw==
X-Gm-Gg: AfdE7clGOedqaTH8gpBLPKPPt5NEokAy7FCbSJItFVRnhlLKUk/HOZqLEQgVsxDkDbG
	SiIuZMZVVP7FCfao2dLS/lnqpd50+aQbtSQ/9Kw6YLhDCz830MeGRVsZ2+myZNfhdziPcO3NMbE
	S+qgWib6845TcJIGDbwdBEQIs1cuJSiAoVb342fwzVH4j64l31a2PPulLJ3O6ja8CGNo2QFgKOU
	eCQWZ5KjEvkF3qOeDgDv6UACB7jL/TJNBFu0btYvcQXgLYmNRryc+Wp6Y9QOtsgjAGwpZ6KQQAR
	8OasnEbcIJI5jSxYbliSGlreNYZps6KV+h41xt2ULSg6Z+vkn2Lx/3OdzLI0echAzAgc8aK2rlF
	Bcq5RE3CG4gY3KBEyyIiD9Y7r/KntczIOVY2Wyfr0ONgILazjWZkavLmCOE19C/gGmV0CoG87Hv
	dBQGDWnxa3mqawTZfRIhRudQ8LRQGYPQlTbYd+e1KtXPMwumnOYR/tVIYEtfk3zYizwg+Uww==
X-Received: by 2002:a05:6a00:2d19:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-84a559964ccmr5439963b3a.78.1784105671342;
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Wed, 15 Jul 2026 16:53:33 +0800
Message-ID: <20260715085348.3457359-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency. Bartosz wants the change on an
immutable branch to pull into the pwrseq tree.
---
 drivers/power/sequencing/core.c | 19 +++++++++++++++++++
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..db8c91be10c9 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on or desc is NULL (optional) and 0 for off;
+ * negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return 1;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..3c6122bd0205 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.795.g602f6c329a-goog

