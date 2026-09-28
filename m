Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D27D4EE873
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 19:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623290; cv=none; b=j0kNwpgMpQ25oduI9jEy5gFXFFGrq257r/x32sUhS+UdibbVIWm92+3KnHr1WRGoNlz1+xRuapg1LS51zq6mJrzDsjv+anU1Cr7wpNaiyUANXJVucDIAm5C4xAaLGgLz6L3J7SDQShzHFmAD7hvhU9/udIQ8yPzvFNmYQ+0gRuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623290; c=relaxed/simple;
	bh=e4W3heWpJSSfMatKHc6jQT2QirxzrrhJb2u5eQNHmGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FsPbaMeD1nTg0f5d0+ua9c+6yNznHIEAlapjQTKPbV0C0GlWL3+p2E3cCi0q9yzOxNJZ1qzmBuCIJViW+HzAajikqoWUJRoKOMJTPz7dC8+jvi+NouE2wjQK+DGpmkyW8b4ALwbSATHrMPqIx33r4yQrm60C2A8AZmG7e3IW+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz+GHSZ/; arc=none smtp.client-ip=74.125.231.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz+GHSZ/"
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-6d8f2bdc754so643260eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 12:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623287; x=1791228087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVeRClalrWLka3P0+7DfFgAskiK62atsVktrSXYS9Rw=;
        b=Xz+GHSZ/gIoBvLcPJjaQk3rDT+HEw67Hwg3rJt4chZEILO8gHA6xK9dtcWq/JDyflT
         0BAuG+Sl8zwoOOArQSDZi93W4CTdpe06z0XZ3nqC4jG+k89A65gtxvDuR2I9RT8ucY0L
         77xDGU6SZe7JtV6l6XGwH6KVqiv3VynwuSdUJIeSM6aThb2IA4M/WbCwNl6OB2o4uXVZ
         9PbVwkOMm/SBHtNFpYVbyaG4aUEz8pno3b7y9vsae02eT0oickJRlaU7oJKC3H5RpNqr
         LnL/QKLB+g2iBsI7KtWJw1naFeBXOImVEWyiUjQ/4VFvTWwM4+mltB2eVoxQO9JDpzIk
         c+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623287; x=1791228087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVeRClalrWLka3P0+7DfFgAskiK62atsVktrSXYS9Rw=;
        b=cM7BHl2r1Jo1o12gC/tD2yQtIzMpsmnBcWmCYXWLppvj7Qsj/oit2+i8GFXkW1Vwt+
         gDa8XUWzx2/YCHxMVyNHBHh30RtR/QGC/7E5NlkDwLIfz57/g2F3Ozzcr6c4p2JqQtLU
         /orHHF2x8a8Qko5hvDlaspk4g2AOydx7L2BuryaA3NpyA7xCujoi7UdRzJwgABsWKq2l
         FlG9GZwW5dAchvXeRtFXEJYoUUE902gb+1daDQOrQqlDgbIOceFD64sYxrBqYoCW5aVI
         D0SEy60HnaD4Wv4t6s/vctwuBV7Hqd/ZIc/MktxZeN9PVa2UHah/7MiwTHTx2O985vUe
         LfXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlUdcB3QzJLJ60ZL3dpP6TtRSvArhN2Cj71lMvVci0k9WRfGbMRRzZ+l6kuyqmRc1i8UpKcAhbnMg=@vger.kernel.org
X-Gm-Message-State: AFuF++msqFBT9MDbl9Jr/BN3UlC759CbuVWKho7otOf0Uw3urXwhb9MV
	wL95PJBSFXB/1mcWXPofpSQhZyYLTk21d3iODcSeUUBUADaLMV71YEnN
X-Gm-Gg: AYBFou3Ya2wYlHe8GvRIgROq6TZ6Pm++HReC2cFp02TtLneOhQZFw24V9Jh9W+2CmT1
	7XbgVn1hS89uHyHk5asGvGWS5tLz1We8c/rc3LSenRrC/WcPtLKfgvWxpicoKqGA3xWEoHoxV8P
	acc7lV+TAfHAK4+vR/t6NXcLcEMk9fIehZWDmQw0DEnNf41GLRfHpIEHfiA1Fp3XzOgqUN2zNgX
	BsjbLKVKt6ct2snSpbGe0F44iQcsoTUP6YWAuczErNRipP3uKrWaBDEdJYOwP2fADooMnd3TWlv
	NkMAvnCkB83uenACImU7GgETgLPK99uWuEfuDpI97Spg4J9+Taj3496846r1neKa90C2Trypm+A
	npR96h0aHPlMN19IX9kFZGvw1JRgE4nbeQKP6s3EATXYtJu8d/7v6Spsq6+LC5HzYt7p1Os8Gka
	6sS9UfKb5xmvLJU9VgJGmS3/JADM8QkxTv3xxuxMy1QbNDWOEwhsZciYloHJmfj2E59FcAr5Z3D
	iP6hOb2W5n4a21ADYVRxzE=
X-Received: by 2002:a05:6820:214:b0:6d9:8fed:b73c with SMTP id 006d021491bc7-6d98fedb9aamr2471163eaf.57.1790623287111;
        Mon, 28 Sep 2026 12:21:27 -0700 (PDT)
Received: from Xinshengs-MBP ([129.79.197.98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d882dc49dbsm6088996eaf.9.2026.09.28.12.21.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 12:21:26 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: usb: asix: remove redundant PHY address short-read check
Date: Mon, 28 Sep 2026 15:21:19 -0400
Message-ID: <20260928192119.73351-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Short-read handling was added to asix_read_cmd() by commit
920a9fa27e78 ("net: asix: add proper error handling of usb read errors").
The helper converts short reads to -ENODATA while preserving negative
errors from the underlying USB read operation.

Remove the redundant short-read check in asix_read_phy_addr()
and its unreachable -EIO assignment. The existing negative-return check
handles both short reads and underlying USB read errors.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/net/usb/asix_common.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index 4f03f4e57655..51bf887e3520 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -327,11 +327,6 @@ int asix_read_phy_addr(struct usbnet *dev, bool internal)
 	if (ret < 0)
 		goto error;
 
-	if (ret < 2) {
-		ret = -EIO;
-		goto error;
-	}
-
 	offset = (internal ? 1 : 0);
 	ret = buf[offset];
 

base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
-- 
2.54.0 (Apple Git-157)

