Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B97F473C67
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247878; cv=none; b=fdU3teHgWNFqVsePBcNSIy1NNg+0/wenFXQestZS2y5Lg29QcRsgtmQQf0H/OLv6svkFRk+O/aTcDorRmnCOTzh3YN21Xq59xkuxwzqa/osFCiF/Mbr211IvjEgBV/BwlsUaCg8V8t9/CivFgRJEXtJsgosbTFbVUraWgnnFir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247878; c=relaxed/simple;
	bh=gjl55k3HwxMMJ0LOIwdvjtRAZ8r4q+pBj3WpSnBkx80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LeV+kr4j/UY7gMRSya9LJLu9KK2TcnEBK8sKGsfbOLQMAqorfkJgifPFKsuYI03RRWDi2qfqSgyLtihyBhyK/dkojp5cjHO1haCye2Zp4hp7MqRsQPiwfjWPkx4nJ4N/zY0y1Rnu35pY6KmFeBshYIx8Sk4PlFGRh37hNnAgwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=st69cXnp; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="st69cXnp"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso1002021a91.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 04:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247876; x=1790852676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=st69cXnpj/NYP1BLU8JOAPerkBV7sjsxkRvYaG1zTX+8mcUXQMddkELaYC4kbax0MY
         dG6eWHw2nSC+D0ux+Eakj7C//1APViDBvKmVCUFaYDSVIGn1KCH+1+JmrOzwEH1mMOAY
         N83AP4GPJlODIi0wXuqMGeYyMvUgvLQhXOYpuGpIFgzRvhfqs2NP6lGQJKN1OLThbEy5
         BudZFLqgwWc2vDmSC7y7nBaBOPnZD36PsSKaijXJyllWYSMWDgzclblyXGqdSBQLbA+D
         ttJA6UePPwdeMMUxBs3uQp8VJN703oPCufI3UsMIrToelNvo1FseyBxSaIVQRA+rhtxK
         toaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247876; x=1790852676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=HmyMzFkGhT4urWp/MXKnMj0aHwvaoIWUKK1T+nPxsndZ/F8NxWLOs+SGcx09NTDN+Y
         ozx26kIjs0urxYjI9x7hRLo0+oQ1gJtw1TJuxFLLHzRq5QlQoKwA647oJXmyh2esPYjJ
         VxbTikHTHS0ovh6CUnfQcHyP8DZGmBRhj1C8UtjkP7eDxDvvSNXN15ns36CJiKHlZLXB
         44t8iIruCRp1XrXvd1rhCikFgoe+rrn25eOXXXJZ18PYwq7R6f34nO60Vjp9dJg1m+dm
         uQIt09ajk7IHnRrfmNp3BkZgPMI/fAC/oXxbR95J7katn7fVpXtLcuhTLV+5cwB40lSZ
         EvQQ==
X-Gm-Message-State: AFuF++m1amuWLvEoWaS8uj/TLUSASWJYR/FDINVS+oW9NEo5dbLWo3Qn
	+Qt6JkmFoHajbYFkiIhdEYBEe36lg5WHUmEfD/1Ke2F1HL8JOTmgoi5k
X-Gm-Gg: AYBFou3x1fgoIlSAvq0brUkqgXUHvFZYUoOGHOyHaywbzpoEsLZOJEiVlctNhe5GZpv
	W+Qvwv+Bj/Vm7EC9NvsQDc84rHeaFrj1lflbvXi9OlRJ26HmvzcKttnuofPcP2VexLX14jmfhDz
	uAByXe/+FqYd71grkqtP14cJbgIRYHVeWzAm50bDoi/XhDTiokvDNh7ba17ou4NuOEO+yfNSKVy
	IuXXcInwobtvP4nIyBBfbFcDMe7Z280HX8rNwomXicTHcTi/opa/ZFtku3k9VsSYKT8o4JQc+wj
	THXhrW/STLbibtfda2RHYkMZ0MTbiI16DmBc6n4Vj/L4ExKJWr6AnHzzZNs1lZt7urL4TeDZJ5O
	1wu5mPN13fhYkNOdbS6lbuCtE8BK6ezNZV2TBsjHjutLImUVPZyHG7gDtXjQPlXrzA90iCVjmTQ
	yhclMEGe0Qm45RMcXneKeOxQLLfWGTkTegY8+eouUj/8BAQNIg6TVoIs4=
X-Received: by 2002:a17:90a:cf84:b0:3a0:9eb1:7300 with SMTP id 98e67ed59e1d1-3a09eb175a7mr737462a91.49.1790247876472;
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm4356860a91.3.2026.09.24.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	felipe.balbi@linux.intel.com,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Date: Thu, 24 Sep 2026 19:04:29 +0800
Message-ID: <20260924110429.1557653-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwc3_meson_g12a_probe() enables priv->vbus when the optional regulator is
present, but dwc3_meson_g12a_remove() does not perform the matching
regulator_disable(). The probe error path already disables the regulator
before rearming the reset control.

Disable priv->vbus in the remove path before reset_control_rearm() to
match the cleanup performed by the probe error path.

Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 4d611c08e8a4..7ca6fb89027f 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -851,6 +851,9 @@ static void dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
 	reset_control_rearm(priv->reset);
 
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

