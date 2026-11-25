Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609030;
	b=UXSwKafIKPCP6MbQwNi3xKyVehkua7eNLBeXEiVMj390FCMgGT0itCJGXVDQy3IXgWMj
	 QakMDZ7q+KhyN+fnmGNMghcslrmF28+ImIKHvaGq87Yjr8A19K4MnuS80aObgRw5HOOo5
	 KP7XfAz2eX/1YGdpydsc0Pm9XdvcDr9JBsPeqI1Os86j6WMLdO1hm360eRegckR6nC+JL
	 EHJFLPU5LNEuyMS42R5R2O0s+PDdiwqwe99NUrjR1ciwhuxFCCIwnju1GxUutTz8EuKya
	 dATK87YaEvmWlziaZrIeiW7GnwurAY0FgZdqln4h92Buchap2/Sz4qIkuE2WCNy+iGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Rulwleyh8bhvWAVb0QvlMS6II3FShQUJjsRscedmHGw=;
	b=41jJ6poIEVcRRE59Eq/gwt1ZFpDRPseoSMCJM7mVilGSHWeSxQYxw3qYg9OcnE57q5m1
	 8TofU3PUdleZcR3iQhl2nRUkhnrKWzyVm31JXnP5Sg67meqxvUNGT+e1SbaFe5FPGfFdj
	 QCo2s3URvAN6n6LDETbAFRm3wnKC+A4JtR3MkyaXr8t9e2Y8q1kcyICiqcfUzqIHKWxtl
	 LqElLtW0g/VnCtbvmNsXrGq+QNHZRbEUuhs5sOl0XaNfOItz8OcfZKawCbEp17wjx0lPh
	 /SYIHgJb5lv55w4cb+sH2flWY1WNXHjqSmvjloRjhEvhUcjz7g0dOUzW9RPuzzkUQgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O5r7GYiS;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B0606A32D
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977B0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O5r7GYiS
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50aaad19fbso626783066b.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795609029; x=1796213829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rulwleyh8bhvWAVb0QvlMS6II3FShQUJjsRscedmHGw=;
        b=O5r7GYiSdiZ4ezUF5CMM0dsFvXvFdK4+E20x//x2UQMWvSRp0b9zkxupjfY+NYoVil
         cVYIAWsXkQQ1PfzaXDcvtSx3/mRUFTEyvD76zT/6iOypE5vYa4p7WsH+tSq/H83BLFSg
         TqWS36RHVS3UXn2R4CXOVcKPNu0b9/xcUV7hrp0xy/newLmtP8NzQaEZycTYyth7Gv/+
         oFbHIR7yGGhhY0bUcu1PC01U/agNylKrJ0uFIy5o7C/0heJM+l0E2GsBNavEwCAlLbwN
         9SipVLNjdsyFoU1k3v0LgRKewgTbUUjD5WwR+vwY/85Fr6dXrOX4RRmpVT6xGjs2zOFp
         UrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609029; x=1796213829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rulwleyh8bhvWAVb0QvlMS6II3FShQUJjsRscedmHGw=;
        b=PDkV/QCVj8qA5c7XblUk8kVOx2dIb61b4cqzlUUso6BgTb9pDU157jVZdecOYjfHN8
         AkvzZuDWKm3uANHuGggmjZzKhI1+DNkEW8Fj+8Nw7gJRUv+PVo0Cp6pGvQV5aOnyz1tU
         Z04Efcf5xhvNfWnfnZrmJJ6kODWzhEWiYOd2ARjnXQfDMc7MpAxCIdwwsmJtAkeTVWHM
         gaRTJiVMk76oAl+sR00BRrh7dNTwfX/IoD5gHeWB8QXAVzPHRpAIs04GS7GcK6api31C
         Xgl7DiMY+rfQyfQFYOVs2mikEOnMhIJismS60K9/cxbKgRwoDRPIdBDG3kX3Pxcc7YfA
         xa1g==
X-Forwarded-Encrypted: i=1; AL+hErHh8gVfO6isbtU7D5tb9KrIMnVpPPxVK+14HL2CJ4z1ThBoLXfZofg8Smqe7waS0RrHIyxKjIxOR4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qf6V8JOTsPioDBcwMWze9x7hJmlAs7ZU782vp0lVvI/7YlSXn
	xXhav3Mp5WcL2iSV8e1HTVTuZ6ZtXgASgT3DvC17xPC+TD55GXA+UjXx1+4SUWVykMQ=
X-Gm-Gg: AZFdTZdscTBcatJiOSYiXzWn2htxF3XKkj3FyU0vDeaaAUq4PeJ379gPpZYaOoTz56C
	hnmo1OdTJrsFp5lA6PBLU95UommhQMsvu8IrkHIFdhxvwzGAU/GL78hpJ1e5q5AJdgCvKIqk9ss
	Ti9UivGwG9qbs8C35tNot3Ty0ka9nYo5x1rxCZYbifbqpmShY8NXYExPrbvcB6EpdwDKcqx5Sw6
	Z0BsZWtIfQ2Ps7GgdcMasX7df4n8AlENBZaG1MsvUfYbg7+Cdq1owjjVMMFIB1xscxgKsB8g5Z0
	i+gaU49cDafkstVfuSu4i94z3NVKIFeYIByk5HFWD9J1mShN/uqhqaMaZUxzLqlL0kRHsSKUOMx
	8r+6Csx7hljoBbbKPa7Zitsf8ptl6ooHCLjsOrav8X1sbm+xtTMGe61pwoBOyuFExUpxDSrVWwd
	ihDCvklENokHOaExWfBg0mTEmM/oqXgiy0yXacVXsd6nhqCS+cX+zRy8HJ3Pk/GHoLf5jqNNkMk
	ViRSSdvQ3SUEZmS3DGV98LeDaQMLdtytfW9lJkHX81//z4gncNYhrcPaClc6y2YRHowf+VDRmog
	jFZlvkNR38l3x2arMx/wZDRh/YTueyLxnpvj2bawHf+LrWIRRpP0czIM508/OVn05VEDyRA/U7h
	h5Ah9CgSibrtwP6QcWQ==
X-Received: by 2002:a17:906:a11a:b0:c4c:d96e:80de with SMTP id a640c23a62f3a-c513a5dabbdmr1120945766b.8.1795609029062;
        Wed, 25 Nov 2026 04:17:09 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00d2asm650611966b.3.2026.11.25.04.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:17:08 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 12:16:56 +0000
Subject: [PATCH v2 2/4] usb: typec: tcpm/tcpci_maxim: init wakeup before
 irq
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-max77759-wait-v2-2-9914b985c00b@linaro.org>
References: <20261125-max77759-wait-v2-0-9914b985c00b@linaro.org>
In-Reply-To: <20261125-max77759-wait-v2-0-9914b985c00b@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

max_tcpci_probe() requests the TCPC interrupt before it initialises
the wakeup source of the device. Since the interrupt is level
triggered, an already asserted alert can trigger the interrupt handler
before devm_device_init_wakeup() is called. Its pm_wakeup_event() does
nothing while the device has no wakeup source, so the wakeup event of
such an early interrupt is not recorded, meaning the system is then not
prevented from suspending for PD_ACTIVITY_TIMEOUT_MS while handling
that alert.

When the driver unbinds, devres works in reverse order and in this case
removes the wakeup source before it frees the interrupt, which leaves a
similar window.

Call devm_device_init_wakeup() before devm_request_threaded_irq(), so
that the wakeup source exists for as long as the interrupt handler can
run.

Fixes: 6f413b559f86 ("usb: typec: tcpci_maxim: Chip level TCPC driver")
Cc: stable@vger.kernel.org
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 6e202171f57a..2bb306b6b1f9 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -528,16 +528,16 @@ static int max_tcpci_probe(struct i2c_client *client)
 
 	chip->port = tcpci_get_tcpm_port(chip->tcpci);
 
+	ret = devm_device_init_wakeup(chip->dev);
+	if (ret)
+		return dev_err_probe(chip->dev, ret, "Failed to init wakeup\n");
+
 	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL, max_tcpci_irq,
 					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
 					chip);
 	if (ret < 0)
 		return ret;
 
-	ret = devm_device_init_wakeup(chip->dev);
-	if (ret)
-		return dev_err_probe(chip->dev, ret, "Failed to init wakeup\n");
-
 	return 0;
 }
 

-- 
2.56.1.831.g720f3f5937-goog

