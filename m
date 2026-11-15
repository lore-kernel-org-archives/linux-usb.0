Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760622;
	b=H/Db/WA5fM/QzSyrkX1m4EjH6FeTxg6Wy0KPQ2fESIwYpP9OO6l6+6+JLB81QD91ZJJk
	 7rUWFRXI9Jq9QnH7Td8KJSFlcAhxKXemJu6UORY5HZ59KpYTGiHZSLx62hjuKPsIe0NMo
	 eEMrl4PiWHts58671ObyDKL+sym6Pz+Q4423BZOOJU2PLh/nWAGeQyONNlYl3htXiQLYC
	 fDQcaLk98SnFyQYhlvsA2FUOGP9qo9pYMiNz5tCRqK60niPg8hbDe9gX+aO4nr9xxYPfN
	 7283cEC9ZeEeSFSYevCkaziLSfkloWtFTSLWbWTeD4HOglLPa1j1RSGPpcTJLfcEjTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=66eFvTzILz7v8GYJ646M/KNx3l9Ze59WpXHWIun61fo=;
	b=bT3Iz/+D5gp1zUzXyD67pKoZyCwrOzEsqKOV0QiYm1Bf85aLe/GlQp+1hOgJ2/mRKny1
	 8+R/lNmN63iiBLqCPYK4bQrwIjAtboWz1I3DUEFYFRTb2F0paaLbCxuD9ipgRpqq8YbS5
	 +MnOkAfSuBJ4Awr2+jAW9cO2Itc3PDqyRnLTmALciwgLrgyuRko9bSfFwGX/mlzBcxGBx
	 M2I//Rba26mRDg6RIkgvtfQkouWrxQd91zvMsprsBFCUhuixUGFlZ9rAXxBKSDusSOLFh
	 X6vyAhb7zKonOP0rua8qzR+Q8D7NGFRosgiJPKGICVRTAtMlouWyj1pcObPcjcqZ83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d9XvUhNB;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F99606A323
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 16:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F99606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d9XvUhNB
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3482539eec.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760621; x=1795365421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66eFvTzILz7v8GYJ646M/KNx3l9Ze59WpXHWIun61fo=;
        b=d9XvUhNB6gcJilbq/qVaSYTlvjM7qpIcZNV+6a1/xjLHbi7nWcAvm6+i1/cfAmwNXU
         7gEvF/WNqUT0V/lqPLgsAkGCbqA4NMpUGYFjTrOPrgpJht28+P+33txALcUYXsS4Xo4D
         KSfOUukp5w7kMOPT9nI41zFOpqp6WaeS/9QI61Ani2MwXl/89G/oX1kVm7Ur9yCnwWAc
         m6Mg4xN9Nz7s0Rwr6AOOTBHgLbuu2IlmVmL+IU5F3L8ruzsw6t6WuhwkGv1zKwR5x7KL
         CALD2xu/hp/bXLFjDwoYWd+gwKwLXhJnda9njxTLF3zLFDRZhQuqPYBI8YwnvNtzA/4R
         /L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760621; x=1795365421;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66eFvTzILz7v8GYJ646M/KNx3l9Ze59WpXHWIun61fo=;
        b=UtLZ9Rf1Eacj3hDgrTnQCcWpOO+m+xAN4LsoX9kovewKh7OHFEZS6zmUpSNYvexabL
         HW7vmvKUiFSHv4e51yYWgEkX1+q5H3yVKa/hfS0r2t58n3z5jApjdqXvEGu0vUtiyFHp
         JHuOp1Gx1eArcWA/45tsVx5VcAwcMkv7G4NQYR/VFK3cf1+iRrnkor5xwMHJK0KCw+/B
         wUnan0Nl22r5/fJvICplC2eeXC0H51jVURx53PfgSIdEOx5gZrkJIz0mHWaheFkvKLmG
         gINJogmK+sC0kkuzsu9u+vr3eu65DKrcDh0XKkHCsWQ4G7mtZBJVpFDB2c9K1WyLcPaq
         1xbA==
X-Forwarded-Encrypted: i=1; AL+hErHbe3ZXCLWZs7GaX0g7iBylWgGkKzyIQ6+Xh2w1Bb01i8nMWZfPKu+XXbUNh4t25eiCqbv3/gCluUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n89uajLioaBIK+9VNPUtPzsoM8EQz/S3zGB6xg7W9qa/1lEew
	miKtjOqjtx9Q8gmFXjAAUxuYd2T/hYf+qiEhJ+prAcr6hme/x5DluQmp
X-Gm-Gg: AYBFou2bo45TiB981jys+hrrozAt5mw12qDrg0ZQVwGuRE7rJaXAHx8GCxJ+pApVcgi
	oEQTNq3BDKucBYGItm+QTqidmEsfeCJ4VVO1CY43Xil+u6XPxU97hvvD/KV81JfD3b4OatrHImt
	xgLE0oEjSfoRh0I57op80goH/BxqOKjfsNKl/xQGxbnpaHOHL8fc6wyvTtlxDmfa6VTMLP8F/0s
	26jUBpiK40DiYzuts3sIOxtuXMaavNKzT+d2mGQyWsGBdFt1X5lykeTqNmD+EMXdzvc6dwIE4fr
	Ng5P9e/O7DcCjUTx2mBAYFCwMWJURto5i5XVRtKgiA7LqGCCTQeMtdLYN8NUb1aa7nqB1N1CCIY
	a3Bm/3HmT/FINh+zV2/nDHD4FxcbtUfQeyDPLXoNYKJoszuf6qeFPJmKC/175M7scYr+pHQjBm4
	eNUImEuNowwM5X2hehtofjcCajJIIdTGkMlRkKoxtCgh0R7lMaLmn2vycI/xW8kLDtQg8dJkAac
	mym5U5mX050uTfK6p2yDfMGqxqv6cG+Pt6qusfG6erV6XsjOf4KMcEsvAwm9kSfZanti6TZJ71z
	uO7U6eg147YNFmKmJByVlPYGAUkcOutESafCfZx7hgaGpEpH1vgdgk/P12211d29ht1J
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr8999460eec.11.1794760621065;
        Sun, 15 Nov 2026 08:37:01 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm27803763eec.28.2026.11.15.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:00 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: core: resume clears needs_altsetting0 even on failure
Date: Sun, 15 Nov 2026 08:36:54 -0800
Message-Id: <20261115163654.226373-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg, Alan,

I hit a corner case in usb_resume_interface(). It needs a device that
fails SET_INTERFACE(0) both when the driver is unbound and again at
resume, so it may not be worth fixing.

needs_altsetting0 is handled in three places. usb_unbind_interface()
sets it when the switch to altsetting 0 fails, and
usb_probe_interface() clears it only after the switch succeeds. But
usb_resume_interface() clears it even when its deferred
usb_set_interface(..., 0) fails. probe then skips the switch, and the
next driver binds with the interface still at the old altsetting.

On v7.3 with raw-gadget and dummy_hcd, the gadget stalled
SET_INTERFACE(0) at unbind and at resume. usbtest then bound to the
interface while it was at altsetting 1, and its URB failed with
-ENOENT. The code is unchanged in next-20261113.

Clearing the flag only on success, as probe does, fixes it:

  -			usb_set_interface(udev, intf->altsetting[0].
  -					desc.bInterfaceNumber, 0);
  -			intf->needs_altsetting0 = 0;
  +			if (!usb_set_interface(udev, intf->altsetting[0].
  +					desc.bInterfaceNumber, 0))
  +				intf->needs_altsetting0 = 0;

With the version I tested, which also logged the error, probe retried
the switch and refused to bind while the gadget kept stalling, and
normal resume was unchanged. I can send a patch if you want one.

Thanks,
Cheng Yongkang
