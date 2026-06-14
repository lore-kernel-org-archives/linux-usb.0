Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633A23AE9B
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781465119; cv=none; b=n4TYxohzShd481LuBuXvZsHVYiopYv+W4oiYtyKAyJ1erhrQOa7xIBGqbkoFg+qD+FoTtvoS3CWv7fydFex/m6W1l2JZyF9TJAUpcKlKnRH91D1fQQC6h59z85o1SyHLB44p3y2Kkf82/zhXEL8B2jY3cZhFlKiskGqXV6z14Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781465119; c=relaxed/simple;
	bh=xBoMm6Aaa9u9W/H/GMto7jFmjLoR7x8LZFH4gtv4GtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMJZzqfSWUZO110No7TCQLICtATszHPvhdrEUcHubctVkdjVNEU7Gmqm/w16iwVhH3eUuYNL9IuPbrCsWY/t8AAn3TKz3/INNOGLUlkklQiWdmclCUsBO0GMdPZ6hVewS/CH33u1CiWszaFAwNCvUx7FodBITL7GDfQRcB8huyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJSIXlYi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJSIXlYi"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa65a184f2so2299864e87.1
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781465116; x=1782069916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gR0kBLESmKqsDaL33kn80PyePD1g1Z7PT+dr0AQwkO4=;
        b=TJSIXlYi7bPf9DqIcmok+Q6x8GuyvD9jlBGwCz4CVTmaZYNreywGvR2CYBRT8n+g2X
         KdE587N2ov8zXe7x6r4PKaYJR3yaz9RF6elKCqKfwHQkLVPEG7u+pgvR9AuZaMcFaUsk
         HjtBG2lq4B1KFIBrLckmCXMOZDo7WJuAJ34TBq2CrdU4n9vUOk3hlA6nuqrG3s5uKklF
         FopcfN39UJG+2cHCAzlETMznrrvwI8U5TYJ+mmMz8EUolNlQqobvjjYR9UPnAXEboKdK
         zh5zdQB054fVRKYpolYXyG02WT/B5VFmuo7DLXEskOAIpxOk8d60MW4kCiMq4DrlKLzO
         f/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781465116; x=1782069916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR0kBLESmKqsDaL33kn80PyePD1g1Z7PT+dr0AQwkO4=;
        b=LklYPlQJ4NqQsmExO3BB3nD6KT7RuLzCHLrWs3vEx48WgXRoEqfzxoXAwGA+GWUzqn
         iicW+gj2fF4wmKJCBa0VlMxHRFpxx7KAXpCL4Un6i/MXVZ22Bze1eCICcGBC8uLsWqtH
         VHOAFb76euN+/4VyvJ/9BtGd5mpt95D0tSf3xodn/MlYYVK3VFftLRfULzXwZw+Eho5Q
         7fs9+x0dJiac03LbwLcZ32cQZN4coD8acxdz3kjNiC7n2z8JpsxxPSSoutPnBxIh4Eyl
         NUuqagIB618udxxsjcLNYiy9+328yMNzETtwMIQ1vWu7Q1vZrAtiV3oZwh2cfxk/4WMg
         nmXw==
X-Forwarded-Encrypted: i=1; AFNElJ++H+iB34VEdjycmwPJMdN8PuaD9glDQI2mlv6Y72Pt0obddGRUZalqdR+EHiFP3gk1U+pB8lg8pVo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tEVGzQ5tyyfCp5CIT1MN55mZLBin+PVdKRq7HXfBpK/UQ63V
	2DJOP4JHBL9RWxH3TKEcIHKZYm0dakGae0vtR03YIV30GmI+1zxT3PRe
X-Gm-Gg: Acq92OHDR0jEqJkNw4LWvDd/6hVqZKiqbkmQhG8LQL079b4C0/kCrRplkVMnM2ELxbd
	FycmbbvOxn3mmpxD+QK7g9I/fglK+vcwisLjJ4bIA7pBtczfRkjofv2qhIAKoZm8e9xgqzJa0QV
	bo2gAyIAfjLLZeU7+8CTrEkPNeMW/QzYLopiGDA2aHmMs6q8NCQedOPt4UwbpDyKCudqaI0w1ms
	koBbqYCA+kXMRk1atF5j07X3RTF7EM+v1NQu/SAoxhCenCeCK0PkipznZL3RrPzvStxF3fjmaaQ
	WjKz6+Z9+Me1oMeSZxSWgwev1jBxnjotls7fed84Drg3V+ds+9Fzgjw+gDAkKzw6xpRFQOtR4FG
	rWguniDknCaI1xNBGJ2OGqaHnIlSnvuaMsY7kAFSKrcgrEuHgc+OWU7/U2CepJhBQLs5Q8nFBrx
	If5ir0qf29/pbF+2cuIw==
X-Received: by 2002:a05:6512:130e:b0:5aa:4bb4:1e9c with SMTP id 2adb3069b0e04-5ad2db4000cmr3356983e87.18.1781465116470;
        Sun, 14 Jun 2026 12:25:16 -0700 (PDT)
Received: from localhost ([109.63.146.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e169038sm2165887e87.18.2026.06.14.12.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 12:25:16 -0700 (PDT)
From: Leonid Konontsov <lkonontsov@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonid Konontsov <lkonontsov@gmail.com>
Subject: [PATCH] usb: serial: replacing mutex_lock to guard(mutex)
Date: Sun, 14 Jun 2026 22:23:37 +0300
Message-ID: <20260614192337.9449-1-lkonontsov@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving from manual mutex_lock's and mutex_unlock's to guard(mutex) in
ark3116.c file.

Signed-off-by: Leonid Konontsov <lkonontsov@gmail.com>
---
 drivers/usb/serial/ark3116.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
index d974da43fba3..9cd8179de583 100644
--- a/drivers/usb/serial/ark3116.c
+++ b/drivers/usb/serial/ark3116.c
@@ -237,7 +237,7 @@ static void ark3116_set_termios(struct tty_struct *tty,
 	}
 
 	/* Update state: synchronize */
-	mutex_lock(&priv->hw_lock);
+	guard(mutex)(&priv->hw_lock);
 
 	/* keep old LCR_SBC bit */
 	lcr |= (priv->lcr & UART_LCR_SBC);
@@ -280,8 +280,6 @@ static void ark3116_set_termios(struct tty_struct *tty,
 		ark3116_write_reg(serial, UART_LCR, lcr);
 	}
 
-	mutex_unlock(&priv->hw_lock);
-
 	/* check for software flow control */
 	if (I_IXOFF(tty) || I_IXON(tty)) {
 		dev_warn(&port->dev,
@@ -379,9 +377,8 @@ static int ark3116_tiocmget(struct tty_struct *tty)
 	__u32 ctrl;
 	unsigned long flags;
 
-	mutex_lock(&priv->hw_lock);
+	guard(mutex)(&priv->hw_lock);
 	ctrl = priv->mcr;
-	mutex_unlock(&priv->hw_lock);
 
 	spin_lock_irqsave(&priv->status_lock, flags);
 	status = priv->msr;
@@ -407,7 +404,7 @@ static int ark3116_tiocmset(struct tty_struct *tty,
 	 * in priv->mcr is actually the one that is in the hardware
 	 */
 
-	mutex_lock(&priv->hw_lock);
+	guard(mutex)(&priv->hw_lock);
 
 	if (set & TIOCM_RTS)
 		priv->mcr |= UART_MCR_RTS;
@@ -428,8 +425,6 @@ static int ark3116_tiocmset(struct tty_struct *tty,
 
 	ark3116_write_reg(port->serial, UART_MCR, priv->mcr);
 
-	mutex_unlock(&priv->hw_lock);
-
 	return 0;
 }
 
@@ -440,7 +435,7 @@ static int ark3116_break_ctl(struct tty_struct *tty, int break_state)
 	int ret;
 
 	/* LCR is also used for other things: protect access */
-	mutex_lock(&priv->hw_lock);
+	guard(mutex)(&priv->hw_lock);
 
 	if (break_state)
 		priv->lcr |= UART_LCR_SBC;
@@ -449,8 +444,6 @@ static int ark3116_break_ctl(struct tty_struct *tty, int break_state)
 
 	ret = ark3116_write_reg(port->serial, UART_LCR, priv->lcr);
 
-	mutex_unlock(&priv->hw_lock);
-
 	return ret;
 }
 
-- 
2.54.0

