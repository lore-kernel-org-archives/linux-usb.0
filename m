Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7804511221
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694186; cv=none; b=dd33LO89AynrigYSOuywcswYv5C3WmUKxYYLjKR81ErXaWt6p2sK9zEgI/P1zKxnQhfzrVltxpF1sfED+5OXtyMajO6mOgdWETm+KTTCCVW1siziaXoq4K4JeVufiuOt7IjHjEjzFrsROYyONNUXmwYYeVEbgJwlIhIQUxkp87o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694186; c=relaxed/simple;
	bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JSKj5pcXgv05V5Uog6YvEcsIlegdTP/vYPcOQw6GgeaPAVIy8t6fB7f3VqKr4G9HeikRqMOVez24SL+5zuhSd+UMjouRYrGNkb7ZcjZooIOZKJLg81jb/QUbRBvPP5AWq3RAZ/A19+40BlGtnNmOpVbS+KRm4mifIzU0obFG/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkUugni2; arc=none smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkUugni2"
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-66fb34fa3b6so1248898d50.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694170; x=1791298970; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=VkUugni2dtbQEFvl+TjO9L+KNki9LnrUJCSDua1akT5O7nzQuKzKGDA2qzL4X4UKF5
         tcVQBLV/o7U0BwgC7tCcanBeFPrQHaX8nH31FSFTJb1KiY93uqlakWBtsHrzZ3vHx5gW
         g9fQGaRt9MkJMo/SvB6/R73yukwMNcIOPLvgOWFoceDMZRwaPZL0OniJ77W2qIBtPeWH
         KX/yZSQLlGiAv6okH3cAxwR1dhD2FKzzcqRLHyeizrKHpnO76zV3aOUOKllDg2r7VwWe
         D0Nj6RnmRqb5R+H0/hkspJCynmP24lu7fqOg2IsI79lmEZV1r/CxzqND8uLM+TIbDgvb
         GzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694170; x=1791298970;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=tmu9ETwnHv9w3rToYBcVp1Oh7V0tuT1qKluFmKysSP426tAi4kThHKFgkB73u18YVk
         5id4TGvqgKkRcNzbPx2DL90MGUkGS/AVojEZINPzbySJe53T4ntTb4Id5bVDx+uFiTK2
         eFBrkiUbY6kHt/H4sLjFVY7/TPZ4rG4DJnvrgycPkgInMW1gDxqkhiKYLa2dA6fAg3QZ
         T9Z2MIZyDOepy+5WzBdFHFF9F3VObXqq+7f1DeWzyOBo28tEnrek25Fjoy/tkR+Ek3Xe
         xKLCJ1Fh9+gi0Ezr4R0yZzjpzZrUZPs9JO66QJN3Wh7z+Ufdv81zloJ3TV/bbmPT37Iq
         U7mw==
X-Gm-Message-State: AFq9FYK2i39BkeWAM2Ma57dkX16HI9ueI5t2wURIOxgUG9bdsMaKfCo2
	h0JOQooD90E8JDaTU0Crg76xqFcjbHqcecRKi0EIg9fRhZ18bdw113ZI
X-Gm-Gg: AYBFou2tJrjG0pAx69xOuoyXpX26hHfL9NpdU+xZc8FszC/9QX4+pG79D5/25xrB+oe
	oPQYH+n/TNUDApePKMFW0xN+uE5x2EJ1CWY3FmGB88Crhcyg/32kIrTAOLyHsfQm+MWfGaENnOU
	1k7XDDGdrwrKcuEya5+4C1g2LAe3EYfl0+zc2xK4WziRWex177E+qibrJvsTyno0/3Xx2YiaRO7
	f1aTey+e2RpuyzxiDiYUkzXE3XfUh+rgi1rBcxMV++mb5Rk8Nswf0LrO/RLuT2yG5evBR/sJEcv
	WEucYYIzxBJplXPZ1MneAQW4WwnWbh17O3XVYqQEPJBk12rj6/zayQGayemkDLFU4jKScVmh3GH
	CqTUF2n5n2L5oSdkHahReaTHc0gRWVwXPmD1+gCczUWG5ykiCCdonkNbkrVxW3GUwSivsSJg88/
	FIQ/LGOciwSLsN1QMwh8zx5RYkFl6wp/4KEL50093vUBxInjlBqtSZwA/rxVjWKR0YxQ==
X-Received: by 2002:a05:690e:13c9:b0:673:7f0e:a8cb with SMTP id 956f58d0204a3-6737f0eaf3fmr5413546d50.44.1790694168952;
        Tue, 29 Sep 2026 08:02:48 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-675b7702a45sm83523d50.17.2026.09.29.08.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:02:47 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 29 Sep 2026 10:02:39 -0500
Subject: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790694166; l=3537;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
 b=YbK3YF9A+aOB+Hm/xh8seZ0DcpGlIq2W0mafFoTLR2ixWJCnN6pznBz15u5t2oiwnrPpwG3qt
 SbDI0QLbGgzCeZQpKyx1EqiIMShHI0oFXGn17wHB/0m8DdbmGIZwk4a
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

ssusb_gadget_suspend() removes the D+ pullup for system suspend by calling
mtu3_dev_on_off(mtu, 0) directly. That writes the hardware SOFT_CONN bit
but leaves mtu->softconnect alone, deliberately: ssusb_gadget_resume()
needs it to decide whether to pull up again.

wait_for_ip_sleep() then asks ssusb_gadget_ip_sleep_check() whether the IP
can sleep, and that function tests mtu->softconnect -- the gadget's intent
rather than the state of the pin. So it answers "pulled up, the IP can
sleep" for a device that was just disconnected, and the poll for
SSUSB_IP_SLEEP_STS runs to its 100 ms timeout:

  mtu3 11271000.usb: gadget (high-speed) pullup D-
  mtu3 11271000.usb: ip sleep failed!!!
  mtu3 11271000.usb: gadget (high-speed) pullup D+
  mtu3 11271000.usb: PM: dpm_run_callback(): mtu3_suspend returns -16
  PM: Some devices failed to suspend, or early wake event detected

and the suspend fails. The rule the hardware follows is stated in that
same function: the IP cannot sleep while D+ is not pulled up.

On an MT8173 tablet (Amazon Fire HD 10 2017, dr_mode = "peripheral") this
makes system suspend impossible whenever VBUS is present, which on a board
whose only USB port is also its charging input means whenever it is
charging. Unbinding the UDC, which clears mtu->softconnect through
mtu3_gadget_pullup() and so makes the check agree with the pin again, is
enough to let the same suspend succeed with the driver still bound and the
charger still attached:

  gadget bound   (softconnect=1): suspend returns -16, "ip sleep failed!!!"
  gadget unbound (softconnect=0): suspend completes, 20 s of 20 s

So record what mtu3_dev_on_off() actually wrote and test that instead.
Runtime suspend is unaffected: it does not soft disconnect, so the pullup
is still set and the IP-sleep poll is still performed.

Fixes: e69027c25361 ("usb: mtu3: allow system suspend during active gadget connection")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3.h      | 1 +
 drivers/usb/mtu3/mtu3_core.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..7f4fb87d8438 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -361,6 +361,7 @@ struct mtu3 {
 	unsigned is_self_powered:1;
 	unsigned test_mode:1;
 	unsigned softconnect:1;
+	unsigned pullup:1;
 	unsigned u1_enable:1;
 	unsigned u2_enable:1;
 	unsigned u3_capable:1;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..5ce61240194f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -346,6 +346,7 @@ void mtu3_dev_on_off(struct mtu3 *mtu, int is_on)
 	else
 		mtu3_hs_softconn_set(mtu, is_on);
 
+	mtu->pullup = !!is_on;
 	dev_info(mtu->dev, "gadget (%s) pullup D%s\n",
 		usb_speed_string(mtu->speed), is_on ? "+" : "-");
 }
@@ -1023,7 +1024,7 @@ bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
 		return true;
 
 	/* device is started and pullup D+, ip can sleep */
-	if (mtu->is_active && mtu->softconnect)
+	if (mtu->is_active && mtu->pullup)
 		return true;
 
 	/* ip can't sleep if not pullup D+ when support device mode */

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-c69c5104b25b

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

