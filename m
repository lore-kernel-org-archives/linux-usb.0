Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B343B42EC
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045322; cv=none; b=Gnyh90IxLVVbPcgHSREEX83omyEM2auKZat3JLcd3HnZgccNdmPsoFfk4Kh1XGFYh1uwSjPZcUhkALcKDllNnZI15SIk0vK3sthsAVhAb+yYIVEV68Gy69u+mIfI5gzNJZ+g6tJX/iN62/aTYtANZNnZilaQqSapmtS7povi3CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045322; c=relaxed/simple;
	bh=QstOwR4MoLepqPhwXXcdqhaZXi3o+22oqo/jORxNnxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUmPz0KyJQtBJhWOccEFLIzl1AO4bpDHYo4twuJ1nXOLYhzdiiV/5a74Q5w5L7IiCVYMdcQgoRSwy/E4j2NH9v8aoEFCd18ml/HM4y6I0A0LkuODdYNZzMhli6V5wNtJFOuhjSObNE74Cywzv/AG5k3Nn7eSG4TgPCslqBObhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmnDdwo6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmnDdwo6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so13480075ad.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 19:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045316; x=1790650116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQsnO6nBZnTmHd9o3wzHwpj6ldm3p0l1ScGQLsRwCts=;
        b=KmnDdwo6IDTvhGn9L1EHokueD8DwKYuaoRaNHR4rwKrUHeSLhPCBpVRz5Q/jjExCuI
         F1AN00FrJJI2uyWnnJdJRmjjKofMsb709IQhW8tcRghnwfY3wgJCvViBvpGIp5dAFyjP
         fO+v1GiNWQFn7gMTl3ZtMA0tPJ+j2drrKQcx0AABU6iFyeYA0YK6iVCF01eKljIWW/JY
         tIVW3fKE4KjYu7MuYLZfUroNHrXNA38bkGuB2kq4A6fdFKv1WKuJetgPZjsmDKCITGQr
         RqpaYMVdXO4gve1W36PQzGMcmQMJk7feF577pmkP0F9JW7ySESZ0UgPc5La/yJMxzi9S
         Rpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045316; x=1790650116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQsnO6nBZnTmHd9o3wzHwpj6ldm3p0l1ScGQLsRwCts=;
        b=rrKX4OjX7kESW6SCgR5JzZXErYJjtsdLaTS+8FVeSspSM89H1hbUUM2aqvN3L+3Zze
         G/MYrseHu+Gz1zJABr/gNucgv1SXb36obFHgaDDGa+tXutZnN0lIMjNl8uMTZdwMPGpR
         oS8AM3KMpXRrKPp804KGDovX0B6AQgk4plaXIBNzj0A6Fe6jvNTZrEFfnDueP8XQ7y2y
         CY5+Zi0oenxXhbfG5VRK4nigU+F1ZrjWE4FlLK/1F1DHp2o/MxFslXLuUPZzc9nxbjZK
         cwPWWTPwHwsUzA9xd0C8EpJpxbS3b5q0M1RaHZYVzieE23VP9YJ6qqvNTJ8qm/CZPNcA
         j86Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRMUrEcxSzW8DuSLPvFuYgAXaGbC7RdAupeA1pGR4VlG+lYLoe3eTwD+RbJjYf35/HoexIVzrOJyw=@vger.kernel.org
X-Gm-Message-State: AFuF++mvi1l7AuSeCbL8ph1fIvhJ0xSMMx5mBQSNTqdyKGzUq6yWFWsz
	Wp/Yh++bX3jMdAY7vgBS5RualFXmlsyWLwnxoFrNGjwGTTwUBDycAdHO
X-Gm-Gg: AYBFou0PYV2anl9RNI8mYp3UTpyPWXlXyNlq+FwU3iSr8BNZzO606DFRH/wNhUBK8dG
	qmS7RT481rnEFnWTy5Pptb69Xj5SjG4ZghyAljNrnV69bj29s26eNvUB+Z4+bspJ0l8ZVTYxLdt
	o9TG6OgWWrJ3kHBIZfApp4KrvjZ+BJ55it+uA+hhU8PCT9xE+ee3UA0BK9EaCgMAZJo8YRTx20v
	3+1gf0zwSgVbmK0Rgsy/ilFrGDyH08MkLqCAtZNNXKVTIQtneVrhG6w0OlKzN52YYfOsVcNQIyn
	BUv5RUIIx+a7+/dR63gmJjejS/yopIv3ieKChpxyo5gvkx0MBaBcY22IubO+TK2W4osnXwAq8Bh
	ByxTx/8NK9VqqH4RtNBcyXWOOY6IGjmPeT5c193jr3XfGSpUVX+3utH99/1iuU4zLCYnZWUgLm/
	wzekjge2iBCY8+Rt+I7tuQVyqYd0FjVmtNuf5VEaCaqeH0JWWEvYIkoD30XXjG0ks4jzvin12Xq
	yS5+KGk
X-Received: by 2002:a17:903:2ecf:b0:2dd:c100:251e with SMTP id d9443c01a7336-2df59a72ef5mr12835995ad.39.1790045316497;
        Mon, 21 Sep 2026 19:48:36 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02e929sm1619035ad.33.2026.09.21.19.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:36 -0700 (PDT)
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
Subject: [RFC PATCH 5/5] drm: bridge: analogix/dp: Adapt the return value changed for disabled blob
Date: Tue, 22 Sep 2026 10:47:20 +0800
Message-ID: <20260922024724.191412-6-inochiama@gmail.com>
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
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 30c0c0b41d5a..8e26cd772482 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1360,7 +1360,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 			 * phy itself is not enabled, so we can move forward
 			 * assigning NULL to phy pointer.
 			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
+			if (ret == -EOPNOTSUPP || ret == -ENODEV)
 				dp->phy = NULL;
 			else
 				return ERR_PTR(ret);
-- 
2.55.0

