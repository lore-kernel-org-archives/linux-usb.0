Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809158;
	b=HyTuCb2bC5/bEJ4WzUQyTvvTLvXjlra9B+465ohteJXuKGoivvqOL5tiTDZqczyuUBds
	 wvM6yo7dCzb4muTCRgyZUQeb+jSRM5GZH8dcYNxjbMxnHrzyqS26dc3COZUS0gRoHulU1
	 d2tHpSjyw8H4dUSA6zWLjdEkHxuAnz+0L5vzdbd8KgJut2NnqhSS02tnCVOCW5WjOqp87
	 3A33byus2RIt7ZkO8grAjOLMy5PPJUdv8cLXb5HGUjb2j9VaqxMd/pUXsmbUOpePY9N1o
	 bbt+deXTqywZtVVG6pTjOCm1OaRAtgbtIstqiYJNx/aDzjDNjw3fxOTFlcBJYjdkSCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TcVA95bONb+tMivknThQEKn9lgWrYbIgYGqfNotvw4E=;
	b=bHEsBaVBsew+0sJAdI+Tz+/J0EkWNQNozj56CdeQDkvrUJ1ldu367NfdNJx0y6jBMnOW
	 BOIYvVhI7qDxZ1vqAsU5TvSodgRm8YOXc5x3E/v/Sz0ugixVpCkDI2xnBcQ4CLzvHblxq
	 rTNf7u9ScLBvmv+uZreTrzQMfIhFCaKIg8cq0cFWX+x4zxWzmAc0k44ZhFbtbi83+tQy0
	 n5wXuBHL6E6c5b9JS7+oieEtWZCooSfD40WTkPl1Kmv9ncx/dPkoBwiIZPu9ssfMZwOt+
	 fiQlEUKvygo0eqWv3M/RNOo/3pjz8evcbD9IBgF2MAWPLgki2WRWB7iaPhftQXtxDHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3HiFkEM;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC5606A88E
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 06:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADC5606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3HiFkEM
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so4143253c88.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 22:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794809156; x=1795413956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcVA95bONb+tMivknThQEKn9lgWrYbIgYGqfNotvw4E=;
        b=I3HiFkEM5j6YnxZsW4S4a08v2lAyOrxnSHXfJU9//cI9KtY3H77yp8a5qM19N1BrY1
         z0E8dwXOgrZ5ASPIl0URFd33dttT7FnrfP8Ge49GnXyO0MYHaQIqbeaPRLV/k41bQ5AC
         6JUaw9tOQasvBLdjjD5qCEU336BtKIokYzljghLLhDN/sDuqgiaQwBlbRerrsKrlAVx5
         j/oNM8Qj7EbNbik5H6VmQ9Zig+kD9KYC6vJujtjS6rTDIpsPEMbDCOIKzjlMFRFVWuEg
         hM7R4HxvTskSB1cVBFIyoxjCcsSS4dfAttEna2UfmglSbgy/P3rmRy2nQ/BBCBMyuIci
         kB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809156; x=1795413956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcVA95bONb+tMivknThQEKn9lgWrYbIgYGqfNotvw4E=;
        b=TlxupQBXjN5GVoDNx7UxS/z09nCIU6P3u/VCMbNspP5uDFmHbnU4mQ+zxkh9HLOaR5
         fLgRvGPE10IFTTj8Nnj2F3sq8aG7tCPkis3+mWKjN8MZfXVlpQzKuAN7YWdCxzCg1eTL
         whhb11VxCqUdJWGVwfaPR8r/hTCuk8a50XBKfdKK9+WIyMzBk+VVpdOSVmWqe97k8B1W
         oXWcO1pFro0Wi/QLGiKk+cvD1//Vr2u8lEXx3OahOfJV89Xzz+fTnowiddRyNKJRn1EQ
         0igThbZO5K/oflO1EeZ1TwpotWW2x39O4ubLav3hQPM0/QXi4iLzwO8OAZiW03Gxr7Ul
         RJsg==
X-Forwarded-Encrypted: i=1; AL+hErHvrWWGNWiLqRCDcA/1k25UScoBo+ujRB+tfCw2CSWEtf/cPKS/vdMEZvU0eNgut1CIDnpSII8pz5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FYh86+OUuDs09wxHLVpqEdLHF4zj8IQoe+Bj7jKP9NVk1Q87O
	jTTbtSGYnNOgWxFCFiMfIYGVyonGCBif4+V2ZmM8iaIzS4D6JPZ0nZM4
X-Gm-Gg: AYBFou0ZKbF9P6bh6xldMpmk/DCdYszhdESKxpuDh0jG5QTksc4R7YeN+3StoNY3Nig
	2v7Mf+xPRMTBK6qWoyJFeEKK+XqB3crQOFByYmh9qbzmdXNDavfPGZaDN1CHXr9fT4LWdwLbprn
	obPC1+WwT4j4iFUck+gmNNlZbZybJdmngSuC59xDCPlCRQroUWRYuk4OC8726QYLxycvrnV65mc
	7+QzEhxsqyUUGbMKK9FRJfLW4HB6kdoJS+ABWJUftS8gf8mwNrIdXnzd5cG0VKqerbqwRXKbbrs
	PVy1QVEayWelR/B646sh1piQ1mNMXyq2c+zL92bUKtVqVyblpQN2g1dbPpzUaRkyHDiQ09v7dSo
	TMLnyj3+8r7qMQXEdW8Y8BhQ6+X8XEkwR/3FOujPR+vq2Tsgs4/5qotPjrUjqZ57f7oWpnSqWqd
	YLTvI16yuqTtNfzHRNfxtQqoAzR4m0AM6wtkNv6WP/PVAGCgVYf2Xh6q7vE9gGlIzYQSOaQEpLd
	pX5STAiXs7w7Ou7jdwrEca7i7X3JT9Jr3Fc+kXQNoS9U/08JgGt7QJP3gclka4tlR35ZePyGE5Q
	s0x+T2eQDjuVJG3mU54b1dYu2qukim9DWyFPh/CFfxm6Bsf271B/0sTpZjFFWc4O0WIy
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr10853578eec.22.1794809155780;
        Sun, 15 Nov 2026 22:05:55 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm41036110eec.19.2026.11.15.22.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:05:55 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: usbfs: reject SETINTERFACE while suspend is allowed
Date: Sun, 15 Nov 2026 22:05:49 -0800
Message-Id: <20261116060549.370140-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com> <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
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

After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
reference and the device can be runtime suspended. When it is resumed
through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
before usb_reset_and_verify_device() restores the altsettings. The
restore loop also runs when a driver bound to another interface calls
usb_reset_device() from its resume handler. The resume path does not
take the device lock, so a SETINTERFACE issued in that window passes
checkintf() and its usb_set_interface() runs concurrently with the
usb_set_interface() calls of the restore loop.

Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
first, which resumes the device and keeps it from suspending until the
file allows suspend again.

Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
I used -EHOSTUNREACH, the same error checkintf() returns for a device
that is not configured. Please tell me if another error is preferred.

 drivers/usb/core/devio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425480..6463ad2b1fc5 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1533,6 +1533,8 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
 
 	if (copy_from_user(&setintf, arg, sizeof(setintf)))
 		return -EFAULT;
+	if (ps->suspend_allowed)
+		return -EHOSTUNREACH;
 	ret = checkintf(ps, setintf.interface);
 	if (ret)
 		return ret;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

