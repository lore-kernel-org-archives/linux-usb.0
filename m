Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934961;
	b=b+nU6Y9m5aPD6RA4qRmn757OH9tReql2aoM9gyBkLdcCGpRufmvrx4Rchv7l8s77lnhy
	 VXzgrRjY2w2ShDsxH8OB94SdbKm+k7yMny0buLCt1CMC/O+rGbgP27QLP7B/iugZARsQi
	 t7goSoo2ZUYdxSCR22WM0RQcc3yX2Ody8mZHiJ+5GZ5vdZN7k9fYIJtqyOA7OJQXxnGi2
	 9VwA/JygcLyhsjGHKyA2dA+Fo5ZeIrn3JHWoFdSK5SrfyVV4IcdmJfZ7IInZZT+LxMWdF
	 bW835EyI1dSgZf62xxkgdE/EZ6rHvUedYrSZz+Xf450S88Yu06HVJbWj+D9kxPfznog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934961;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JpwXDwPS90+ATFeB+uKS3gFAvw4EsuauPM0IqWq0KtA=;
	b=EjmPCqZInYQlc4fLZlCyNsgxlKrkqPsGyQ4AgNLyMQkYFLazEZVRTonhvCs6J7hlGQ9+
	 4EcXJsM2rpxWme36udv43x8OZz8YUiiF5RjEL73X+GQE4YBbe6iQJrkk4h5L5D2/fq+fO
	 PNPhTd89B+91I/hunGOO3PcgvaCl1+10jz/E1dHeEVNNbnxxR3jNM6MVr9VvjNJU1tdww
	 hjAL2nLveLWP0ru9H/FmEg2CxZvEePooLt5adX3P+v1e6G5d1/VwFM9PSPlfhtNAk00C8
	 5dDa+r+CksyjsT3/DLNsbMhnn+EBDUlDiraDt3CG1ICr4iMTlBz2g2hWfOyixaph6og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=P8DZ2JSo;
	arc=none smtp.remote-ip=51.250.60.161
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [51.250.60.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382E606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5382E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=P8DZ2JSo
Received: from mail-nwsmtp-smtp-production-main-31 (mail-nwsmtp-smtp-production-main-31.yp-c.yandex.net)
	by forward101d.mail.yandex.net (postfix) with ESMTPS id 4926DC0089;
	Tue, 17 Nov 2026 20:02:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31 with ESMTPSA id S2dXPc0l9W20-cNMSHCh1;
	Tue, 17 Nov 2026 20:02:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1794934949; bh=JpwXDwPS90+ATFeB+uKS3gFAvw4EsuauPM0IqWq0KtA=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=P8DZ2JSoA5J53R56nyMCIOEqcez/rWa2zedwMobFoHUJJ8NQGPuOVobkMRvzLhHJs
	 sH7oM92I1mjN4e7FcYcnT88NursKgkzdGshe1synOWaSwMwwy0cc/BNv6LlbOHRK58
	 H2V//jfGC0PaAWsMgCTy6ewg2gx9hyXIOv9Cgkv8=
Authentication-Results: mail-nwsmtp-smtp-production-main-31; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] usb: gadget: avoid redundant strlen() in make_name_string()
Date: Tue, 17 Nov 2026 20:02:07 +0300
Message-ID: <20261117170207.642330-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.1
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

In make_name_string(), prefer strchrnul() over strchr() to
avoid redundant call to strlen().

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/usb/gadget/function/f_midi2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index d693de427641..76738ea55dba 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -2101,11 +2101,10 @@ static void make_name_string(char *s)
 {
 	char *p;
 
-	p = strchr(s, '\n');
-	if (p)
+	p = strchrnul(s, '\n');
+	if (*p)
 		*p = 0;
 
-	p = s + strlen(s);
 	for (; p > s && isspace(*p); p--)
 		*p = 0;
 }
-- 
2.56.1

