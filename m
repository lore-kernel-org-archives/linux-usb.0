Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8075E51A759
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 23:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909162; cv=none; b=WQ1RoxLY8zq56XR6Xy5ZbXWsLJ48f0frgAG0GgEZkkT0inGA4JxK3ghxI247oB+DsrW3zeAItz2+1pObjGnPkkthjKJm3oauKYQr9lNP8GjEz8XWOW73xxF9jmQ/1TkU5jl0Yuu1oKWr8y8T5s9/FZwoVVkQmrfPDUlU93L7AfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909162; c=relaxed/simple;
	bh=+ZjLG77YKfr9IPV1oRcpyx+bGhfiK19WyzbxnAw1Dlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rijZRx0vaVfuwoVVQ454rB+uZQR1/kIQsQaM/wM32M42/LH/73f5rc06uEYE/EUhP08FIe380RBhP45AcZ9wJqcHJ1RG+gwXBywyJBwoXQ1GOSZjxHt/pyFiUX/4U8KapQEkcBcVjrO+pNQQWL8vKBMQ/EFLyJ6pilqCLrB67vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOlnBG10; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOlnBG10"
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4ab2d8e7e4cso1068552b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788909159; x=1789513959; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=smnQky0ErsfDpiZznR4+kV0USKaVnCb3aDkonGaPobM=;
        b=iOlnBG10+5D6djfvL3aTRimTe7NrfJoDXFTVQVUZrzpWcgX5u6fR9z5vLscGEEljrj
         J25daj+ucu4RkhdJSEHVilKtdNO0qolLteYwMoRf+cKXOFjZ2jOYlUArnnofzzqzlhnZ
         0Cwo6JQ6mIi3gsLthZprti4HTGB1L9ZQv/93TM44YBbeT0ii50NonrDi77N46nZR+MrK
         hb7dnFqdwyTknZJb2ilgbEW+DJwBeHo8rpYE58fTp9MTvcGIctCHtvSBwAm2NR1j2mOJ
         s+KfcNwYzYqVeykP7kq/aFI6spnY0K3WnTZNUeiDjniAJyIdcuFcQriWEdpmwZDGIe5X
         hEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909159; x=1789513959;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=smnQky0ErsfDpiZznR4+kV0USKaVnCb3aDkonGaPobM=;
        b=s/Dwts+fKKPd0Jp+/uFTOaJAW9L9WEdq8szG6TD7Ga4AhlXPfO6EXs3J/ABD0n0gUB
         AihLxqzzGF0SL9b8u9fGzBGZQI1nWLC/ABtu7fXTzEpdK9AGqCTPhq09jCAbCOubOokE
         ACLOcSsOkSVyr6dlbVThA2zR7FdYOuISF6VhIJ0mcYJvZKhH41iRXX1wKC3t6kMajZ5f
         0/ItX4beiEW+C/1wYUOaS1oeT8+OuSJ5WZiSUWiElTbpipe/0mUSNrLB4d8nQe6vZmei
         QGRoIO6MHpMj6ASULDZ5OZzrvVztY9nfctay+uICduix4HRrzvXObxmxHXi/uU8ZTITa
         uHyg==
X-Gm-Message-State: AFuF++nlVvBrc16N6kZosQeyD83AReFfW6OtZWs/XEfxK3KcPFupq6yx
	S+EHUACP9dZ0NjJpTlZfYLO3p+kJOjwgHmgolWHbBu1nYBTMTg3FH2Zv
X-Gm-Gg: AYBFou29EW4t12QsUZVgl1/de1Z2VmSQtqoT2mKsZQs8NgOrYtZLCIyzePtfQ+2DXtV
	/nqJBDqjrg28j4VG4BdjxJ87ulFkBOcRCSq5IibbDxl4Hv03OANYMZhl5giwWmjIJPuiSeD/Toc
	z//2Q/2YbZKnEP04utLARxJ6cA0JSkE5XPWNh+yfmQNPmKj9FtRystR1fXvsM9O11koj5qI7vE2
	8iVAb/yS4xemsSpxDcWdvh17+DAXUTMAYlHX3KPFMCzhDlnIlW9YY40Dlo19T8pwr/L2bvK3T2z
	oo+hS/pJ/u0Hzjs3UDrUd2AI7dEut6pmzsRbFEaePhJClbdk+I3LWV/si81tbCWblmqA012h7EF
	7QNQYSHDUjrCEQgTY23wnCn0D29kAZoHPpJ8Ss+5F298u5By7rzwl8KviqZgILKIR9VHTIRbDBf
	R6XM4omT3seqOEo7WAqGFyPwpPztZhi9fGT/SYRLzvzS+BmmbIgJxmf4PiQVqt4ijgMuo=
X-Received: by 2002:a05:6808:c2bd:b0:4b9:a8ac:482 with SMTP id 5614622812f47-4b9a8bb6aa4mr15564787b6e.32.1788909159168;
        Tue, 08 Sep 2026 16:12:39 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475523d1dc5sm13776680fac.2.2026.09.08.16.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:12:37 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 08 Sep 2026 18:10:23 -0500
Subject: [PATCH] usb: mtu3: fix system suspend in gadget mode after soft
 disconnect
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-3457dcea9f48@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrCMBBFf6XM2oG02mL9FekijzFGSBpmEhFL/
 92oy8O9nLOBEAcSuHQbMD2DhDU16A8d2LtOnjC4xjCoYVKzOiMbroRS6Y01S2HSMSSPsdQj3sK
 rLZIpOaxi0GvnqWBcHaGdZjv26mSG0UCzZ6Z2/5Wvy5+lmgfZ8s3Bvn8AkI/oj5sAAAA=
X-Change-ID: 20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-c69c5104b25b
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788909156; l=3498;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+ZjLG77YKfr9IPV1oRcpyx+bGhfiK19WyzbxnAw1Dlw=;
 b=V2O6cHk26Nxt8LbULYU/sEf44lBkzKUl3wK7GAWx+IQ9lLvhe0k0Y8fzsYxUfdNDKEqL4tmi3
 8GpBdhfJQ3hDKeuMLeV3szySlDOsdovXO/TPdutx5Dhf0d/tFSGylLR
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

