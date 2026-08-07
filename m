Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A94480942
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108634; cv=none; b=P4+lii+FOVYPA4jUYSQjg63pVV2XD+YKJnfejwIt2UAG3M2swfkF9KM9Zo5Kp8vIldPh4rD1uBCH5ZQJDyV1t0N2fLIBJGCGicogMKHfZElmmgJIXPo5+bqy+IXP6fRfXDAaWSrE/ISuu6usahzsu35B3vnT4dAkHWlbOZZPg8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108634; c=relaxed/simple;
	bh=rO5YBsrlcaAWHGgIeMaKVTjiJ6YF7fWpkrc4LZ2vRUc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mFydaRYqcH5jCEWHvuC+qsNkqzc2uuIWBQPn/llhlp362TfuQA6cvW2V7BCy85APrF6+041TwJQkkvovewRhxDSmujFgQtkYCWRaLI8j68SKoL3GjlEioJ2iNqkhyj3NYSd9zqfY8S5vtWjs8cRqXuN+g1PqABmnpQ5sASBXlHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5wx9rAw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5wx9rAw"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38f620399a0so2978236a91.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108623; x=1786713423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aMfij/WpmebSJQAumpWhu4x8ObI27lDJNWJqgdwwVPc=;
        b=W5wx9rAw8+/RjBw6LFHdRdKthLRMldXZ596tHGc0vV64DOCfUFVHr28SWwY6MjS36D
         y88f4TthIGGMe2QHBP6FWoVGiEjc2bMezl9LCNIZySoTxeI5kN4r/Bp/P56yK8r032rH
         CcU/d8yXCU9I8Fb7eGo1THBCQwCkuFv3Oe2zATo2oHQ4vxVjeWpBN8UX9F5Y109Hw5om
         xYuCLaGS60tImE0Bdr1iffqMVjlRUhE7I5mw7d8hfqZaxWVzUI34tGDKjQshstaIWHxA
         dFiKHe13uelLciW/eyd57WMpAE0Z2kejyCpSNpXpf20XZmBNSdKNEXg6lOVeU8fz9zBb
         EdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108623; x=1786713423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMfij/WpmebSJQAumpWhu4x8ObI27lDJNWJqgdwwVPc=;
        b=L9L4DZVgbVbmz1AxYyoo18nkFCyVITn112nha3c+gFLZCLb5YeIAoq5hkthMpSmp2I
         hDuV7r4zQNbXo814hWx6A8Phfkv8uZyY8b7DvNoKQHh0JJXY7ar95Rocl/OD5Y0u5O5i
         5fvhlBoefxqwyGnk5syLHLOP/3fVyeZc6xr6Vb3EhlUpL2/3v8naUphS6Oc5KD94050N
         vJfy4BDt9+Sfl2wTBkRM67Pr5qCU3u2N+VDf5qd0wWhmk/GxF34yQhPJPQ8i+Tvg7iAe
         ojebakWjB5/08cokt35m6zkspiVDc3HiMdVOxozfOI9JJb2Qzihy/FslYCW5pgrr3/ni
         s57A==
X-Gm-Message-State: AOJu0YxvCqPDQkaKGgqaqQ8b2yfVyKM3yan75xxjH+/RJNpFnv4MO8j9
	2o/A0qilOo0txPvb340qjmxeOR4KN1mf0zN0oAUho84hrc4ywqXtsLP7
X-Gm-Gg: AR+sD10h06BhQ0PiGeKnR3RzcRKIoHwzri5k9il+Ja+GIqeRpnK/Q+1C0hOXueStayd
	83f9LnXbCK0ihsLOiVFhUceAYVywH07wrhhul8XDs8xZ/Jz7XwsER5kmy9cK1lM5fuYTbHLKBjx
	HpzfiSTJoXGl6vrltOUhndYgqEoMuohlDXaqpk4wsm5OrdHr9JA6a+/hnEp2zQamJkAnO7qfdry
	A1rssJ2BOhZkh5zPqa0es+4qqPbQikDY9hJCgGY6J2Gw1IlyCckgxMHxQ7Dq6xRo8qGSux5ZBnu
	TAsZeEs6aqXoH7m3HIgeT43/IE8vgCfXUqVPQjpvoFxUMlOANQaOi5SI5GAD2FYOpi//RpwgA8S
	ko3mOWB+4teOk/MKT0muww1PhUUqPYLXrE4uZPXL1R5Y6PQyQWTgrhVj38pwjJQBV+Afi/JwFQc
	6BYRHOQ9K9N+slGTsBI0G1rBz4/WyohwYqJOXDMAa8yQJwS3tZXjP+1gYuXgKwBeuVr2gOgcEU1
	4kAeIxICUe/cQvZYWZJivpicOIHQoYjvX3Wi7UKm7qrqTEQfBHZQvfV
X-Received: by 2002:a17:90b:1c84:b0:38f:1e1a:515e with SMTP id 98e67ed59e1d1-3903c5b1688mr19852310a91.14.1786108623154;
        Fri, 07 Aug 2026 06:17:03 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b33225e0sm1300528a91.4.2026.08.07.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:17:02 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/2] phy: sunplus: fix two issues in update_disc_vol()
Date: Fri, 07 Aug 2026 21:16:58 +0800
Message-Id: <20260807-sunplus-v2-0-d5379c664dfc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMradWoC/2WNQQ6CMBBFr0JmbU07WlBW3sOwoKXAGCikA0RDu
 LsFly5f8v77K7AL5BjyZIXgFmIafAQ8JWDb0jdOUBUZUGIqb/IqePZjN7PQlzIzRhlbZQjRHoO
 r6X2UnsWPeTYvZ6d9vhst8TSEz3G1qN37ry5KKJHda42IqTVaPpq+pO5shx6Kbdu+7ZATS7AAA
 AA=
X-Change-ID: 20260804-sunplus-53a7bb1bcd72
To: Vincent Shih <vincent.sunplus@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786108621; l=908;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=rO5YBsrlcaAWHGgIeMaKVTjiJ6YF7fWpkrc4LZ2vRUc=;
 b=+2Ztve4OQkQfcHZFfdMZ3NKzZz1dWAzQTCz2gjctrcplPo4cdCbI2pL4OE/OoPaUZNs5aOTL0
 ylxVaq7YYsfD6f67niC94vem1IW6hU4BOfu8kiMUKNtRZcDlxegwWvz
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Vinod's comments.
- Split the commit into two patches, one for memory leak, one for error
  pointer deference.
- Link to v1: https://patch.msgid.link/20260804-sunplus-v1-1-79f52226cb50@gmail.com

To: Vincent Shih <vincent.sunplus@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Felix Gu (2):
      phy: sunplus: fix memory leak in update_disc_vol()
      phy: sunplus: fix ERR_PTR deref in update_disc_vol()

 drivers/phy/sunplus/phy-sunplus-usb2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260804-sunplus-53a7bb1bcd72

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

