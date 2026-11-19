Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077628;
	b=lDX+ptgWZihGgS4PUaTZc04i2Tv9SMduRvxmZxik1qZiDykCV09cpYI90eEygR5SgSVA
	 2I7geqEapjS7ueuGEYg2YiaJRNBB06kx8+BLaMrOTsc4LRJVuCoEw1Bg1KiWvq3CbG6JK
	 ifLuE8bv/z/YMbwm4WFaqyL/KL0jVMERgIEiZ3IxdVxyqucnVYVwqWglRH8pNdjuE8AQR
	 vL5NVuGqp0YiYbCz35XFN2iII5ZdiPgVXKmHCge0xNgpuFcZ1vk/IuXTfm7zOWzesGzAq
	 xxB2VxysZVR3qrWI73l9YL1hBcvv49nalBct5HoNdpM4uItfXqzvEctaruy+2WLKHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0b0WtnuMp1Hc9oCcX/1wKyrcaG25GmnFWC+LVdfeHYI=;
	b=Jv/qW5rwQAhcvwhtgtrWRhJ0BuI8TTWAiv2+sBTJkoSgmkf9G/ntiZAdZxYHOB9mPdTm
	 JEAIvA3hTfkXtWC+wjHqCgtdQ6L1RWrhBv2xPBx+ssEWWYRZnh2AYEz1JCTWrsa5rkHhC
	 ZKDhIHCjQTdvKFNwZjxnU1r2VzDh6cJsbcYBAhgQOqP84T5dGHD/USqdDY0tgApf3YmYi
	 cMLqXLBxyCiGxXisMBRFJdbvlGbbm8dEliHVzYX+rD0FZkEcaaQpfUys1o68AN0VeEYEF
	 B+IsPvKbDSCh6PYwImfB5hljL1Je1UmhFA7nczV8Nc+oPqtCn26h2h7/mQgFdrIDAtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W4/UzYv2";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0599F60A260A
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 08:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0599F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4/UzYv2
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso2178185ad.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077627; x=1795682427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0b0WtnuMp1Hc9oCcX/1wKyrcaG25GmnFWC+LVdfeHYI=;
        b=W4/UzYv2xIe5ZLoHSY2yvf69V5U1B4se003ow30pCw9FucMEdSEtvxJp6Nj/xJhprG
         pfNvQYaEdjkK5gWFq/mThHM2m5eS/zmFIxU30re+RWgqshoxPd8kl1QAdhd69Z0w1Ahl
         Kjq5UldcxIK0hcxpUqTGJZHolT5ff5XPXYgrc4BDadRQHP/74AceFiHmDkzAis5P7VQi
         2IGdIO+0LNhcvwT1G640kZQH9KhPoZ0fTMad8UhPR275pMHVOWgNGyCbweUolVy2iYX7
         5T6R0hcCPAscRCXJQSzh9PxzhxynFGJWftp1kZtH80dCLCvTq9n58pfNBYDwiSAhRmAk
         mIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077627; x=1795682427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0b0WtnuMp1Hc9oCcX/1wKyrcaG25GmnFWC+LVdfeHYI=;
        b=AOxWTOZTVECowSQNaDfILlpItNEKO0Q3uJpt3+Sbjy8pjnj3AOQO/GU/Z1b4GjuOJj
         /xnIa1jTfQsOcRzd6reTjdI/v4JS9XM4wlTyctwhGSwxWZOGtyGaheNoL94lmS/v+Boa
         eusg8KFsyVRgPgdRtL1o7bPaZLUT5A0grpVCmGzHAIxb1NUdR5d+t7niPVT2Fd4ytlGU
         klGL3X587emyJq0+e1wopAXbyWNVdyESVEyRV8H+MEzf1BXC73WREgysXeCgSC8XjtAC
         BTrBdEKxiKgYBideyvlc5QvXPhVbLZXhiBN8IqDuOLe7tlaTiw9pjKuc9vat8J46Sic/
         7VrQ==
X-Forwarded-Encrypted: i=1; AL+hErH00K7IK+7/xyl6eDsdZwiCbHvU5PPB4F82mIfLD+fm47vSu0KrE6p7Dq4AyCpfhsTRPbf9hf+WCOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sXmk1SvPEq2fwsTIN0MJKvROZIyFmAg8lWFVJDS3dZUabbww9
	Turvwf1XbCFunWvNClbmFTRBZUNOhiNK9risXb7atowv++1OIKJXQwT6
X-Gm-Gg: AZFdTZeiiXeanSOCvZL5vIgcK78S7vmYb8ZQijqJ7S4TGbbq5FLJmfYOBaeW9mhxlei
	HE/XFkXJnXlBrGIEygVwLRzaA3lQwOyr2qlVfWoFBVK5i5hU7j6URyNA/6el+Xkn0WWnkBy32ex
	SYU/F8xW4BM2dKPc++3W+mcGXuWI5QUON03iB2vRZhsvgYyDnPuTroI33VKXV+2Z25lruKGrnGU
	7+GL+tMcbMpyJRiZuQAW5jt/kXVLTfJkXR5YoMr9La6vZtm3LbbtOJdI0wkgCB/WG30t3t3mpOq
	Z7hUQJhQEj9KHT8z+L75rrvHjcuGdzS9F02JVI5KUt6R8j2Zj6YbsDuNQ03cvBHwOU8FfnhxQR7
	/kU46bSk4+TX6E+qFeUk1fpanIwkos4jKX8XeyK7aIWvLMtwWamidA4NBHHgi05XizGPrkq45pp
	GUk07gL+VhM/CFPym/+j/4pBL99yf6BFeX+OjWswgGHM2JIhj9k6S4AznYgtdaCIhzWhS/AAcJJ
	M1B2N98Dv7q1VJ1D/6sh5qRm2WY7DQkG41fps/x3eEnEW4pTYVaQA7qRv7boUAgWYQLStqc7+xO
	LUcgOhCA5mJjUtFuUvlpGcoicKq7KTPMeFDc/651+6jzZes/M7pWWKUyF+CaaXyKsj7bzA==
X-Received: by 2002:a17:902:db06:b0:2ef:db5d:59a6 with SMTP id d9443c01a7336-2f031cc67ddmr3577165ad.23.1795077627055;
        Thu, 19 Nov 2026 00:40:27 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62a9d47sm27425995ad.69.2026.11.19.00.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:40:26 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guido Kiener <guido@kiener-muenchen.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: usbtmc: reject a short READ_STATUS_BYTE control transfer
Date: Thu, 19 Nov 2026 17:39:59 +0900
Message-ID: <20261119083959.1599898-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

usbtmc_get_stb() asks the device for three bytes of the READ_STATUS_BYTE
response into a kmalloc()'d buffer and only checks that usb_control_msg()
did not fail:

	buffer = kmalloc(8, GFP_KERNEL);
	...
	rv = usb_control_msg(..., buffer, 0x03, USB_CTRL_GET_TIMEOUT);
	if (rv < 0)
		goto exit;

usb_control_msg() returns the number of bytes actually transferred,
which a device is free to make shorter than the three that were
requested.  When the interface has no interrupt-in endpoint the status
byte is then taken straight from the third byte:

	*stb = buffer[2];

and the caller hands it to user space with put_user() from
USBTMC488_IOCTL_READ_STB and USBTMC_IOCTL_GET_SRQ_STB.  A device that
answers with one or two bytes - with the first byte set to
USBTMC_STATUS_SUCCESS so the status check passes - therefore leaks one
byte of uninitialised kmalloc memory to user space.  Both conditions are
under the device's control, since it also decides whether to expose an
interrupt-in endpoint.

The same leak was fixed once before in this driver: usbtmc_ioctl_request()
bounds its copy_to_user() to the number of bytes usb_control_msg() reported
instead of the number requested.  usbtmc_get_stb() cannot be fixed that way
because it reads a fixed offset, so reject the transfer unless all three
bytes arrived, matching what usbtmc488_ioctl_simple() already does for its
own one-byte request.

The check is not limited to the branch that reads buffer[2]: buffer[0] is
consumed on both paths, so a short response leaves the status check itself
reading uninitialised memory.  USBTMC-USB488 4.3.1 requires the three-byte
response, so a device that sends fewer is not conforming either way.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/usb/class/usbtmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 51cd9320a736..c5b91a446a72 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -506,6 +506,10 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 	if (rv < 0) {
 		dev_err(dev, "stb usb_control_msg returned %d\n", rv);
 		goto exit;
+	} else if (rv != 3) {
+		dev_warn(dev, "stb usb_control_msg returned %d\n", rv);
+		rv = -EIO;
+		goto exit;
 	}
 
 	if (buffer[0] != USBTMC_STATUS_SUCCESS) {
