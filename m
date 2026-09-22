Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6901413B5B3
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045312; cv=none; b=uUXH2fpAQRyev8kdGtZK83uqrhVa9zBWI+DZINOCPA/UiJvw6nobEjepVAFF1iN9ot09xEWs8puRTlm/yopwDHkFFBkh1lxa6Z2dzrc9Qosu2weMQglX3ASaxhhr9IH73cvC2YRdMyGWvGpDWHtKg/CWiA9c55cCiqWeYt/gUVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045312; c=relaxed/simple;
	bh=CZc4QBGy+BG9JJGrAOVmoVxgxeojzJnci50cnAtfNzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjGSIBVRBFNBHLpU5z1Dl/Tmod/wwqNGks/1PDDF7hq8OjlFz0yEC0aL9pcQOrsegV1z7qwq7N+aal9QvA85i/5ZA3w+YEhpFvGDG+ybyMHKdUIZEXSNo2JJrF5cJkzTa+oXF+Dqs5gMS5Mp2DtaRwVNsc4QZ4I9OBliZH03uEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aX0vjANr; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aX0vjANr"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so2758100a91.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 19:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045308; x=1790650108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWmT8GXNkKIjtVq2Tp5ZmO6NxHuTlquOEZj2eN8N3GI=;
        b=aX0vjANrtzKgVtIZGdfa9N0e+322OLQitOduMj0y9pu/VDQ7/dhy308mXhyJ2K6iZY
         O/N/s2FKnNXl/qFj1ZqtpK7hiktpgVkX94Pot9PbHWIa2/ptiatpGJqaRhdDctWQ2JiP
         J2JRVDBXc993XkbtpgTl6GlOSa7t3jf09oHYmwtiRO6U72qqBrUWtNZr4OejKjKMb75q
         yeRIQzlC4olZdQHSTpRa3ggIlZkerIQZXr4+cH85FfsKD4tYlCCcEzKBixa2CoPhJ6hy
         oq04HgZ9Ce5gX94QyKJZ5kONJYYVWgagBPOYPDBT2tqANiHwkwb8ScX4j2qfXNikK0Sz
         6dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045308; x=1790650108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWmT8GXNkKIjtVq2Tp5ZmO6NxHuTlquOEZj2eN8N3GI=;
        b=0RvaHS9fY0u+YlNq/czWOoAuMADqpFs2GTU+f46l7UM+g2pFkOV0G5a5doOUHZcNQF
         vzUkHJKJ6wf2ypStloa1jNq9QtWhlPQ3t3QBl9i+Ae3HZ2LNfLuGVFoxgX7eu4RMAjFz
         /FgZPcwvtzJ8+yMshTD70ah/iqKmMG/RZ8Sn6Lq+tK38erAKSBRWETZ+S74V4IJt4ryn
         lYnWur/QPPokCv5jJRr4GSWStmZy64mku39fYqYHQ0RR3o3Txiy/lYIyImap4rnBwuOV
         7qYB5dCbxGy+SJ4gqinoR6vsaWeL3HqJDjnCH4DywnWVR/taHYPM7r9BAQ9/z2BbmPJq
         42Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxiWtV47gnFEa8DzOJIX9eaPrFJBA/FhbTE3E0ZXD7OtA+NlkZjkv/Kf3MfWox2TvzX4gSDB5gkHdg=@vger.kernel.org
X-Gm-Message-State: AFuF++mFeAE6YIKezlIVrlit460RKehaVKDr3y/vCpbvi050kn+5VcbQ
	U49b8cAxe9pzC6PohThHHgs4oYhZ6eYTJgzNikh41XjKgI3BR8eSHrTD
X-Gm-Gg: AYBFou00ZBoWDgUuT97eRqUucLPfKHvJgdAcy816jOf04XeSy4zeor8/HIx67fnj86Q
	k/UB1LW9PVI8g95mkkkaTNTNCgX601ebpl0r/oSveSS0N43A6d948qYMraLq2RQx3UqysUhajoX
	g0B31ttKB7clPt2kXbahKbf+MFvcPXy5QimoWfqItiaYbcpjjcFfW+rm0Cjf8Qa6b7YR2vSLnJt
	6HjQLVyBQs8JYyYlCnG7b4vCFhPBxxzls1qOH8RQ20J603oSx/hA3+3uWvOU8GX6CpOqC+4VkqU
	eWuqlFEs1HPcpmueLunUErHq+fl+Mxuyw76QTJoiKQKcYZpgCrxe5bmnPBC3hknw5gFVYdAWbwn
	ehKriImbIA3ah2xu3ecKkn/64wmOFrvvYXd3m9RXNnn33bbFfzULNYBZ8DEZzLXVKHfQwP8NC+/
	D7BJc1nvNLsi9Is8UcmiamXwDvjRo+ieMA+uuc+U0R74eesLhCic3wFqsGD8905skSi0PTFUeFx
	eMqw8jx
X-Received: by 2002:a17:90b:224c:b0:39d:f317:44cd with SMTP id 98e67ed59e1d1-39e54eab3dbmr22577003a91.14.1790045308578;
        Mon, 21 Sep 2026 19:48:28 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06caf4a73sm297312a91.2.2026.09.21.19.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 2/5] ata: libahci_platform: Adapt the return value changed for disabled blob
Date: Tue, 22 Sep 2026 10:47:17 +0800
Message-ID: <20260922024724.191412-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922024724.191412-1-inochiama@gmail.com>
References: <20260922024724.191412-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check EOPNOTSUPP for disabled helper function as the change in phy core.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/ata/libahci_platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 6e072d681341..3e8ddbeb49b3 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -371,11 +371,11 @@ static int ahci_platform_get_phy(struct ahci_host_priv *hpriv, u32 port,
 
 	rc = PTR_ERR(hpriv->phys[port]);
 	switch (rc) {
-	case -ENOSYS:
+	case -EOPNOTSUPP:
 		/* No PHY support. Check if PHY is required. */
 		if (of_property_present(node, "phys")) {
 			dev_err(dev,
-				"couldn't get PHY in node %pOFn: ENOSYS\n",
+				"couldn't get PHY in node %pOFn: EOPNOTSUPP\n",
 				node);
 			break;
 		}
-- 
2.55.0

