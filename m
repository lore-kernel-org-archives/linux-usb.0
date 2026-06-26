Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A033B19A0
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496897; cv=none; b=FrHrosXTAt5C9jzs2RwxT4FULW8dQ5kMZsJJ4k65Eeqi9en7GuCRb14aYm3A+UuVuOjMe8Xlqi2fgBrogJooGcT+gzpWRRQOd+Aj7LISdwHKsDvxNcfUnYjeJvv8qsQ5+BgAblld7uN7i74YFLehRd4sic1sBomJK4v3s7jJ3B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496897; c=relaxed/simple;
	bh=y6ss/+A7iqA744EbtblGwsKzdzSJCyKScBc5S/whb34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uaVmdqMW8fam4akvD1Lrhx2Eizld5QVjeM2AQKmF8zrYpz0DdgZSy5HmDo+uJfFyzcOusoH98Fe+8PjBjSYGctRoCICH4dzPOVgvSWkdLCv99qWsM9x7tQu3thTNhW1xFQKnUnSJdyGxI5QEK3k/heb8nzk9ymdgdBOdJN0Wq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Rq46qy57; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Rq46qy57"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49263703c6eso11591215e9.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496894; x=1783101694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EdKyOF1QmpajAcmp5hc4hjmdp7BR9UcpNLNo67C5HQ=;
        b=Rq46qy5782K3Om7fC2fINWLgTJhHG3UO8A3ZfaibsLU9hzy/C/84RWQma9fdEdrH3g
         E6ggs/1R+gbpfXYfvueC2qq/awTq0QsmNUMnTna/fV9GMteKgnfjUjO3FQPIOIdGjs4X
         FLvxfLDfVTBGZB4UBzXauc9iKNhJcb473ZnJLYDml6gvG87eeVDr9XKvrWNgO7SipNLu
         yt3kQKvy6hSy67lSkHZU3jdp6ZOl45TrT272APcVn/IOM5RXFdrwx79DAPNC2761aLH8
         NpcJzigde7fSbgmfxOPZGASdqs+Undql3Y6vWoqAzRI204nZN9ascE/T0YYOb4gqPhmW
         iZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496894; x=1783101694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3EdKyOF1QmpajAcmp5hc4hjmdp7BR9UcpNLNo67C5HQ=;
        b=ovKn1SHEuNN+VghQHToDXTcEXcRwayvSHgsAjNqXBnpDJPpQpGGRGhQCgmlY6CebcZ
         KQflmn8MDV/7a1N36v7BWxW+KFoJQN/t/2kL6aTk6XNuHIPVmV1zPygKJIOjdbHx/63H
         eWbi9PORgItyS5trc79a+nZTZKs/dFxOMLJpbEJb25BR1l//GGLQXlY8NeWsyZhlM5oo
         np/WMI267v9t8rUR2TLSYXZr6cdk3dKNH+280uzVpT3cdUrhhxxjoUiU5nOL4o+OBdYt
         rt6F4Fil0hespWunzmGE/ihwA6wxjyYRaSn7xhYqD80spEGddgOoPylt1fFwvos9ipYy
         XcQw==
X-Forwarded-Encrypted: i=1; AFNElJ+CnzxUCAA4TsPredRbHhbX68dre0gO2nfOErOWTyXJL4X5JsNG7F54XO7UFA2nmp3uut0X7sTtkIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tUli05JkdyDmHXBtyaZR5F35eT71ynsnOnbA39S3YWYkEjBe
	7JB193eZxrk00wq1/F8ZN+fFJVonBvPZhjA6ZAonLNaf+szG+aUID0mwuiNyI+ZfSZsWk/fPsxc
	+RwIr
X-Gm-Gg: AfdE7cmRIlQESYn6jSCzhkqqA928OrpONJsZXn/PcObM/cF3pIJpYhgA+NDfM6i2cS9
	qZxhOLXejSmAcywGZmKXpSiCTx2tIsPDd3kNgGV2d25X/09plmughwaHjnl1oKPG48BkhPxz+K1
	ej2N1jYi8UvKG63qGlQKjPo+gEUMydewTz8M7x6JbnMwvgD/9ckfOb3ZNO0dNIU54wP75WL1a3e
	TN7wWDs6oY6ucIvs7BK9hOorHdFr8W6ebBSZrgy5NOWj6TeZ6zCR7v2r5/8l00tqcoVAy+pFp6r
	zJf9luni6M+eKtqtvsCKkfeehaIgzbfXGFfdmmlJwCicmPv4ogVqi01CYYY7MAMBp1reYLYUO0t
	Flv494VFU/a7OM/QAwWNYCaYfXj1zIrFq9W0pHXXF5mS4ToJb92PYfWhkAmIVG5SUpqPARaJHGA
	YMOZQYsqPgfXxNYlxYU3qBozYeiequf73xLZ1A4SC4L75/cr9awJnLcwJo+cr/yu6Ma1QA5xnS7
	MAq
X-Received: by 2002:a05:600c:3492:b0:492:39b6:5a30 with SMTP id 5b1f17b1804b1-4926719847bmr103270795e9.35.1782496893896;
        Fri, 26 Jun 2026 11:01:33 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46c1ee01c3bsm28349549f8f.10.2026.06.26.11.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:33 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/17] usb: serial: Include <linux/usb.h> in <linux/usb/serial.h>
Date: Fri, 26 Jun 2026 20:00:25 +0200
Message-ID:  <ea74b464075e49d33b9c0f9f412e716a3da7910b.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=792; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y6ss/+A7iqA744EbtblGwsKzdzSJCyKScBc5S/whb34=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5FzWtSBX+T/LUInNQzfRm/ruWJeFi63oke6 7g5YXyolqCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+RQAKCRCPgPtYfRL+ Tv6fB/4pUtDrc8KPwRNcJZ787IBjWGD8JGcBVyDzXEHGTXAnBXCE63cvjHJcwdAm9h/Pcw8BLE8 ofhnt9rQKYDSvhLgMyKwH7aE0s1ARh/ouT0YvYod99PTzunHVMdyYytf8e/twjgSVvBLKFzIMmt smqvJIIW0a0iT1eXl1bYAR7QtpFu4iQI4eCRHLJ0fw5U91hf2xAlO/+4Gfec4i10fKJ0tsRyKtZ yQvXJwO7lH/ykNQOcAnis9jZGvpg8B5LutfJqjV0dWeEUTn0gG5eq/f+Fy85a9Wy9zrUE8zto+s 9bORNiThl2oc3zxv2vycrvg6Dna5kw5jGSXDIuH0bduL/xzB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

All consumers of the latter also include the former, but without that
struct usb_driver and struct usb_device_id (and maybe more) are not
defined. Add an include for <linux/usb.h> to make the header
self-contained.

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

