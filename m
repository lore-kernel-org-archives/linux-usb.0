Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CC43BB128
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 21:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782683997; cv=none; b=kuNUnvNOAhAguLbxQ/9z9I6W4YsRBupqD1AfVlm4w5euVegjUAdqZU303hWgZfvrinJW8VPYTl2PR7boc4vPS5yRELaWiFtDcXLgjVsx+0qhuyhM09SlDuWeJrgEiOs28zD+2PFtyViHx0eElr7rOFAjnM4rNZu66+g6HCF2Ykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782683997; c=relaxed/simple;
	bh=iOib2boaCtTutE09bJGOs5/MhJYgHhcEDs80U04Dkdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAdxMMRSyerrj4tS60Ppg65o2IQn8Dm0J1yfL22JsxFa9+4Qt8Zqf5KJc/BuLuvt2tadY+yjp5wSVSsQxyJAdaiWgor1hBmNeEpfTbYkhBjDEFGDvMcxu5E50F+sbcSWfb4+jPLUUnqvNdkdlXDdTjaB0dbemmPZt6+uhy0CG+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fMk37C68; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fMk37C68"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4938d60c035so10846645e9.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 14:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782683994; x=1783288794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcZUPsV9s3AR/ZyoPal4KEe3AVxAModoPKX3R0Xbbwg=;
        b=fMk37C68uSarbkhbLSlvYTaVR288iwmY/QsCLjY5pOIJaaWAQozKfNaLWJijWlA2gL
         BS4qldwFAPtSu/CmbDj1PQlatukYfd9MPYHryQs52qqjknmzuAhQx4226/o6nDFn9pou
         u/WxkCQZ+TWOi9i/afRzdGXip57daIJM1HRy70jN5HY+oT/gucPhjFUBhBfn7JkOe/yE
         vMIH8Xn7eoW1XAyYQgpakGbp0E09Szq0vNV/1I+764/LfcVBvc5xtdcfUYmg1MA5/PCE
         6UlrCkrSB36knzqS+owyQ5sUeRykOpxgZG6sELVOfGFHJDQq385vS/wBfFMLghN/DDXg
         P9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683994; x=1783288794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VcZUPsV9s3AR/ZyoPal4KEe3AVxAModoPKX3R0Xbbwg=;
        b=Fu4syMXphAVGESNtZIu68wjMOL5I8a/7A7xstgo7iLq1HoeNKs6dhF+tUJkfPrA+6L
         SsJbfeqXgmum2F3+gOWE3vjYYzhfKUv9UA/Vv7g8WvH2PWOsAhQPA4RSkTYvCKwoHfhx
         h6OFLPuRtcvgAT9twSruTKgaMvg8QZnuwcDQ1QD5gERNccjNKXpIVdtLRMjX3e110s84
         tjH+z45oCT/RE2t+73aBM0ValQm0EirO62LJ+tRfpSCeV5L9QFZsDKaEDApHsbS61282
         hr12U9Wyuq9xqr09W63ERi2amar79sg15IicMoKxojMpQdA2M5YZRtyqWN6RjCHZyYwB
         FEVw==
X-Forwarded-Encrypted: i=1; AFNElJ/T8BTuSWZJEKS+gjRyK2HkcIGwFTn/mw3tie37/CDn7v5xlQvH4mR6Xc+OszTJ8j9QEJljkFOqLcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyWJKjn2Ulh+hiCkErPEW0TSXY2TVY3wWpPRECj4fFa5vIWKiX
	zWsfiADZJlExiq43r0tKRsdNTWozf0SHU/Cr4CKxekOKx/4GZevE5kWJTqqbl0iEjlU=
X-Gm-Gg: AfdE7ckRcWYi9Th881uQHOyOFpzjDZOeU8VgRSEQ8qFWw4PKeIjZcw+C6/ZPAq0qCUg
	IUMGfoEctFU9to8+hr+AimVJkoD0k2veuR/0S7n6TlQPB4gRLTeu4Re5miB1ljvjEoU2KLKIFBL
	rkYGyzfetPLVCR+62EXe1bjuKb4oCDLmczHsGvBGE/gykCrp9eE9ASGmta+82tHYGymK7/iRTW/
	XIXr1IKKl850hHuczZ5CDuSgMn0Wzq5b20DbgW7FMx5CGQ0ccugfAmUfX2haImRlfVXrggmsWqb
	omrFIbBK3vgATznotQ0i77w6/eXH5sVyGnGjOoNt0GENTQW1EAee+qdfKl6j9jchGdQUOq+kiGw
	tjavEix0XN1Z1iFJqvWsSwUtlhgIEgOCnoYFpzbkslsmyaTFjvjxZEwYLt9f8VyrXo3AwnnjKmh
	sz+JaVd3BW/LTJOgMyhLddkKbRverc
X-Received: by 2002:a05:600c:6215:b0:490:e180:2ed with SMTP id 5b1f17b1804b1-4926683879fmr188366565e9.4.1782683994466;
        Sun, 28 Jun 2026 14:59:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fc0d36sm416129635e9.2.2026.06.28.14.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:59:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 05/16] usb: serial: Include <linux/usb.h> in <linux/usb/serial.h>
Date: Sun, 28 Jun 2026 23:58:40 +0200
Message-ID:  <0f77a5a54484029a341090a6442d67684d94e0e9.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iOib2boaCtTutE09bJGOs5/MhJYgHhcEDs80U04Dkdc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhizHmZJT2Co5m7VaunXD9im1x8kaGe02W11+0TfUOeyWt mPyKuFORmMWBkYuBlkxRRb7xjWZVlVykZ1r/12GGcTKBDKFgYtTACaydCn7f8cb4R79LWsu7o/J aQ2b0Sxxr9tRRGixQVFT2+PcLRKc6+bOe/Hgfklnx49Zk4QnZpkHLfr23jux9YribUaHS5m/NXO +zj1katokZLY2huPppql+NwqcHRNyVVwUX68K+SbbcWr29Hwd72b3r2uFpktvPBr7tuVPRl5bVE fc53elKuYKi9rOKT1312HJc9UPymh8wdPZpGCyomQmn1vYt6uNKz/eenz3o2L7pJfLdnDd9lHiO vFFNV3D6tHc8zpNizQnKnkYyvBa7o5cfo7/8sFlkx+V+N69VjEr59TVA92uFXHra3bciow6q27T KMFddbTTvcr0E2cz8xJ7AYsV2jEzDk07I3VT9nZWodspAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

All consumers of the latter also include the former, but without that
struct usb_driver and struct usb_device_id (and maybe more) are not
defined. Add an include for <linux/usb.h> to make the header
self-contained.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/usb/serial.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 75b2b763f1ba..534e6650e2aa 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/serial.h>
 #include <linux/kfifo.h>
+#include <linux/usb.h>
 
 /* The maximum number of ports one device can grab at once */
 #define MAX_NUM_PORTS		16
-- 
2.47.3

