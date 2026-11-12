Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483065;
	b=HkRDa1FCt6GUM4zDh+KMGtfvV3/DrAJeVx32J7bExGJdH5i3vIe0PhakA+br0xWked/i
	 xFza5Ti8JThkW2erl/HfW5AAKBHddig3RQvOlfgviu8i9pY96je6jrvHwXkTofpWJ1rjo
	 XTyoZ+zC2UK6P67pP7kBCmDATyQYCNRwmdQupUjKpXXGgwWwlyBuDjWzmM9WBzivB6FkH
	 odvcSkmP42wHnDJfW1bAuIGAxehFCWw7Y0OgUq4E39rsxx7VWyNOyEGLBKK9B5Bf1XmFQ
	 isPn3V1FNz/cL7uAMUaglLHtnwT09IZ3SJr7TklAz7xZaRQSqmoaXfruok+G9F0bSQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9l9JrxrF8l+mOniUL6DS7aawaMxPEmoUUwIsn8MZ6Bk=;
	b=LVyAr4pFaxU84xBHRlHCxZpJrqAiPc/iudPqQk6Rd23wZJJnaF1DYJiVRW9x9mp6ImMM
	 xFtwP8qu0gkOJKmp1jMX1ThM2Lv2YH/3tpQ8IIehiXPR+s+ujqAORFNqH+tOSqsRzkyxS
	 sBphp/OijXjp8CICNPHQc4p15DvsoAHiuxOptBaCOWKAkXU1ajxhnbh86SfEpt/u8bVkP
	 oiy1hNnRnTdJyacs6cfg1q+MoxQKo6GOXcow8CY9b88YrvXcgZzqUuCjt4/+HeKJLL5ck
	 ZDGRew1V9HtAEWR/dREcLwgNKk4n+5dWYG9rnRrlgUAsP4/1Y2Ue6Dx8PexZSmJHK+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlQvZ1H1;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4550606A330
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4550606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlQvZ1H1
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so920962a12.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483063; x=1795087863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l9JrxrF8l+mOniUL6DS7aawaMxPEmoUUwIsn8MZ6Bk=;
        b=LlQvZ1H147PHodwTS5Gxx5lddD9zz3BsqMsGx8zl7w7Mb7v72RbAkGkS8LLmK4fc9/
         qxJEw7AYY0KkbJzeMrg9tV/oRwVR1qqK41YqNndC7QSLz07IjBvCoY7IvMznd6iCtSVE
         iieVbwpGTWTkd/qk/aPlHWSpwCEPpt57nwzZ6HWIhjnvm8dO8DBk0dYuSBHD15sxnH+2
         /x+evw1wa4y6vY6i/RGwiT1AvBmcuVWpFy84qb+EKNH2uLzgDn4HFrM2GZLGdvgZcsOc
         tvl1yWeBb7RnCwj/Gz72AQSGrvWm5ud0S94EmW/2rMBh47JYPBCV5/PTTyztDwhhvbwk
         fhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483063; x=1795087863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l9JrxrF8l+mOniUL6DS7aawaMxPEmoUUwIsn8MZ6Bk=;
        b=s9Pv3p3prd13qhKtFti4AOAEO6TBDO/MSoC2uNXCtIfCepZOMV2mKEDeCcrDqlHz7/
         4M2pGP5HXj+PUuS+iuBmHtVRwKRmzE1Ky/9off9FEsrBSo7Ssp+VBPBS47kYzx/9Irl8
         JhMVHS3cqINPk1yjspn3Fbk/2ulNTdC8B5nt45+u8pt0X24cl2ee9waP23wuB7jM+npl
         H1z8p60Y0xGVpfaMvW+/iZbXshVfX6a1+PKnaTq6gBHlhq4AAVrmcECJtEVBsJ7NtNwy
         ZIytHUwFmbW78Tgk+onavnvtt6FhmGHYMJh/PqTavkRiRHL6YqZg1Db641NJQL5WtEMb
         C9kw==
X-Gm-Message-State: APuU4Z+22yZOoLQC5MS9qfUzvw9nqK5SLGDuETGCyqJ7WkQPoctjN75m
	KGkcpc64+OaXV1cSgOo2GsfxQv/8i4yQrucMiWMy6Ok3qmajBSLMaO6w
X-Gm-Gg: AYBFou2+rhqP+vdc1CRmdoTOc9UvHfwzjw9jzEKknF9500reC3OqRlhDWblQaEPPGQF
	QDJcKGckDzs2z6QsmMVuLQ5rHXxgPs0i3Da1SKm/++JCo2ERhFNDHmL9+jtxvbx23mVpKqmFbys
	4npjJLlEZmBwVR8efuMFriPO+EUP9kwm7rbW45M18tturL0ftzvDQEDg+fy8NSvMTn0EmLt6QF8
	98o9rbwrDcIfN8eK/ClkOzCEhkaqUgLE24cULtbkzJAmtIgDEsANB7uz1Zl+MC6/JlQ0Uzp0OPs
	7DS0KJ52YxnWnxu7FFdg3YFZqQjQ9W4oLJDljv8M2ObEthN49G2vs77dVMVNiVhTn81L8zFGUFF
	HB3/BwysWf6uG5cWMb9K8OmujrI4Sh983xcIlo8k0fg8Ls8c9/ILgx/QotE/O7MOZ7HicwXSThg
	2xUC6m+yWCFRa35kp0VqhxTjsk5B/zz06O0NsPPtDWWAQrCrjw3nFD2+AARXJ8LTpVQsTh47X1w
	ZpvaHANlHDDpinZIcJyweZxy7TqpZ0DOxauxKuNUw7aBb67Ly3hzCZp6dCyHcix2pd2f57+lhlC
	kB1bn6Yq8o1c4tmiZdu5LITAPX0DpZklCNGnfTGIHjcDWnUnYETnCJhBNQmx/ziypjSp0GM4Kb0
	m5HNFnyMJ6KbJy0EqnqLfsAg/zxSdlze9CtxEioQK97wgwQ==
X-Received: by 2002:a17:907:1b1d:b0:c4d:31c5:e30 with SMTP id a640c23a62f3a-c5066d3db13mr401955866b.49.1794483062958;
        Thu, 12 Nov 2026 03:31:02 -0800 (PST)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a618abesm326514666b.50.2026.11.12.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:31:02 -0800 (PST)
From: Jacob Procee <sn125164@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Jacob Procee <sn125164@gmail.com>
Subject: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Date: Thu, 12 Nov 2026 12:30:05 +0100
Message-ID: <20261112113005.16418-1-sn125164@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On Apple Silicon the Type-C PHY and the dwc3 controller behind a CD321x
port lose their state during s2idle while the plug stays connected, and
the CD321x does not raise an interrupt on resume. xhci notices the lost
state and re-initializes the host controller:

  xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset
  usb 1-1: USB disconnect, device number 2

but the PHY is only ever programmed from typec_mux_set(), so a device
left plugged in (here a FIDO2 security key) never comes back until it is
unplugged and plugged in again.

Re-initializing only dwc3 after resume does not work: tearing dwc3 down
also powers off the PHY, and nothing turns it back on, so xhci then
times out ("Host halt failed, -110", "can't setup: -110").

Instead, make cd321x replay the plug on resume when a partner was
connected: mark the plug as changed and queue the update work, which
then goes through the same sequence as a real replug (role none, mux
safe, mux back to the partner's mode, role back on). Queue it on
system_freezable_wq so it runs only after all devices have resumed.

Tested on a 14" MacBook Pro (M1 Pro, j314s) with a backport of this
change to the Asahi 7.3.3 kernel: a USB-C security key left plugged in
re-enumerates right after "PM: suspend exit", where it previously stayed
gone until replugged. Unplugging the device while the system is asleep
also works: after resume the role goes to none, nothing is brought back
up, and replugging it later enumerates normally. This mainline version
was build-tested only (W=1, checkpatch --strict clean).

Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
Assisted-by: LLM
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
checkpatch flags the Assisted-by tag (non-standard signature, 'LLM' is
not an email address); the format follows
Documentation/process/coding-assistants.rst.

 drivers/usb/typec/tipd/core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 02539378ffed..2ec380124532 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -164,6 +164,7 @@ struct tipd_data {
 	bool (*read_power_status)(struct tps6598x *tps);
 	int (*reset)(struct tps6598x *tps);
 	int (*connect)(struct tps6598x *tps, u32 status);
+	void (*resume)(struct tps6598x *tps);
 };
 
 struct tps6598x {
@@ -911,6 +912,21 @@ static int cd321x_connect(struct tps6598x *tps, u32 status)
 	return 0;
 }
 
+static void cd321x_resume(struct tps6598x *tps)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+
+	guard(mutex)(&tps->lock);
+
+	if (IS_ERR_OR_NULL(tps->partner))
+		return;
+
+	cd321x->update_status.status_changed |= TPS_STATUS_PLUG_PRESENT;
+	cancel_delayed_work(&cd321x->update_work);
+	queue_delayed_work(system_freezable_wq, &cd321x->update_work,
+			   msecs_to_jiffies(CD321X_DEBOUNCE_DELAY_MS));
+}
+
 static irqreturn_t cd321x_interrupt(int irq, void *data)
 {
 	struct tps6598x *tps = data;
@@ -2014,6 +2030,9 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
 
+	if (tps->data->resume)
+		tps->data->resume(tps);
+
 	return 0;
 }
 
@@ -2040,6 +2059,7 @@ static const struct tipd_data cd321x_data = {
 	.reset = cd321x_reset,
 	.switch_power_state = cd321x_switch_power_state,
 	.connect = cd321x_connect,
+	.resume = cd321x_resume,
 };
 
 static const struct tipd_data tps6598x_data = {
-- 
2.56.0

