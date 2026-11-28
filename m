Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855441;
	b=jILzolRiT4kq6YCCWjjHelvoi4o/ibfqnzyJ9XRZjmXts6ykKSj/ADesgcId74oVftf4
	 B4Jtp7VmXL6RZ8lsNmau1VmX4Wv82UrND3vcr49/HvuXIoEesJVaSIAjv7kF7i6FSnoF7
	 wl+m+IOWBVlrPomCDBzyFTYdI5OoB2nX+STPzGq2jhn9xZ2Euen2YCXfdjilx0EtwNlaR
	 K5d8LraYLY8z3FAPUDHqcgWRaR7olqxr9WqG894G5nwnTUUiTHIOPOjpf5pFGxR7gDlN/
	 MMWFUkppYy7gBCsZImOHOQx2xKwG8tkS25iif2vGDbI6P2WI77qVkquR05KTvpCB//A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TXsB9S62nIODUj6/6AUgn/7jqGBbGUqYRdOrCKO6SJg=;
	b=KjiysnD0c6KUEsvJmx+L5V0jKy3gY51jTvSAwSNU7a3+TZin8acvlxWFapnIs+NGDNAp
	 uokfaJAh9eTy+ilL2yvyEPxtHdiVe8I7qfbRYq7NkVMlltZ+IrXrrPqj1LbY/F1xTBM/K
	 JvFEUd9bDSs4QRsBVks0g+ttf1JGO+Ul3AUhKLy/wL2od3Ti71ynNOSCCHPSCnD6uI1mt
	 1rfZEmf0CBiOE3r0EpY5qr59l+ntCzn1Sga+r7+QCXsJHuu0AeMUaECEW5INM/ayCTKpC
	 MbuTdGkToriX7uMYBQ47GDQV/vqk8NFTnKhILsbmthqn7mG5fZySEBda/l2T2bz76mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJLGzvNi;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A1606A31C
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 08:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJLGzvNi
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386d1859e1cso3032571eec.0
        for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 00:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795855440; x=1796460240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXsB9S62nIODUj6/6AUgn/7jqGBbGUqYRdOrCKO6SJg=;
        b=WJLGzvNi6mSjcBAtVUXvfYyxYhfOiBnJU67cTCab6VckobnXl58FxhjWc5Lpj5zUqh
         jZ73W/o6jK4zs5xWRD6fl255Bx1f+J3SmC41bvyVEmoYj/g9g8jMEC/B0NUX4pQNY820
         bDNQop3vf1PsC/Rg8qFrQZu0H4BqrilOurN9k0Bjp+ikwhaMSOYI5wJPjwz91fUAU8gZ
         KsZ1L7ttQ0HO0SVluY9cS19sRyePI4Nkp1O32b0a+OVa4rmF/lR74/Z3ApweFCoYIcZR
         4nQFnbdEfP52TagAHY/gdDqjtw6j2J/KMYdMkLu0cQD1/diXHR2hdMiqvosTSG3cfR+G
         XbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855440; x=1796460240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXsB9S62nIODUj6/6AUgn/7jqGBbGUqYRdOrCKO6SJg=;
        b=rniSyKohyqwgKisCVAGYtDYN7g2Dht/TqAL/Hs6LqGd0VYlvynxG0gAFlwyunogILG
         RL7VEfyONVopfTOvwae7xjZdmj9XtN95IUzkvCxCE7t1z/8OlYUe+k8jDcTn/FtXGY8E
         5vhJinPXS+qtj+4IPnBwKQYwol7lndFFyFRpzarHpy1Wr7z6v5YKG+dGj++wXBgoko3x
         6aVXTF6oNeYwSJs27RilTIi47FPJvIqtcF+uFq7VRWnE/Gdxm+PEVV3Rc3DsfenYFGXZ
         z21cXJymZaWqcE4QsPzsFOP5IJsKCGrFfjVKjJJx/kOAE7xRM1Cbxyv4naADyxyCldVM
         Xhvw==
X-Gm-Message-State: APuU4Z956IwJdm7PqgvZRR3E8VBiX2MmH21Kt9SnkxHbrWP0gdBYMKLD
	CD/uHAEmNLt1lLxrWVywdV6mCmhoc4L2V8Fg1HuKuentlxttrgubfpoSd9RC9w==
X-Gm-Gg: AZFdTZc0x3nJQnoWD6L53LJTn5HqUTXbWDQlvJT75XUGMF55dzhvgXhVJnj/XRF30DL
	3z2nqwUxpcciRvp6dszS16YL3cF0OY8B348uzDa34ho3wEBleYE/zy7KCR9i/8BgNiYBCysh9s5
	ju4S/b66aECLekSEB5bcFKY0PXjn4TJU/iU5G9pJx4IKE6vlbBtxvugRDUywuKxGvrAWUo2S/2w
	LfVHa8ddhGUedB/ghTBWu/xi9gc7uTis/Xou4OSRWMPp2puxkEQZBvnjDg6liTOvbVg4zIujQ0x
	BnMNO5/a98CUhAA1QmTh9dbrcM7rfsEGGg64L2i0rNucWNQq1QQMG6qjk7x5RXuPbiANzt7xwxx
	cdR26O2kGa4jw/TuQI72si1zsF7guNxY6n9vX3orDVN/UhbYuUd+Y9VL5nFD+4WjtC0g9an3AMR
	HXP6lEvQA+nGZtvtLarHXc8+Iolzrlz4unOx9XAzy91HMYZGkYTmBO35A+ZP/B1U7o71i6RUs1h
	Ls6B67+HrOoOdwyvs4UbpEgQdrp578S/ZLxSQEi2JduGByLHrkhYSXAz4LsQWviiqqs1+tIKZRs
	TGVt/dsM761iHgisAUt+AeqYLI0ym/KED8pNPv4ySkx2pVwuucRkqcffk+P7vOeQ42i3ODybUHU
	=
X-Received: by 2002:a05:693c:884d:b0:386:d9ab:5cf4 with SMTP id 5a478bee46e88-386d9ab6c21mr7188979eec.3.1795855440366;
        Sat, 28 Nov 2026 00:44:00 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm75720783eec.16.2026.11.28.00.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:43:59 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Christoph Jung <jung@codemercs.com>
Subject: [PATCH] USB: iowarrior: ignore short reports
Date: Sat, 28 Nov 2026 16:43:55 +0800
Message-Id: <20261128084355.721820-1-maoyixie.tju@gmail.com>
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
Content-Transfer-Encoding: 8bit

iowarrior_callback() copies report_size bytes of the interrupt-in
buffer into the read queue. It never looks at urb->actual_length. After
a short report the bytes past actual_length are stale or uninitialized.
iowarrior_read() copies them to user space.

The vendor's datasheets describe only reports of a fixed length. Ignore
a report shorter than report_size.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness and with an emulated device on
dummy_hcd. Not tested on hardware.

Fixes: 946b960d13c1 ("USB: add driver for iowarrior devices.")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness, the device emulation and this
patch.

 drivers/usb/misc/iowarrior.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index de2b236ef903..8d2d01df8d5f 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -170,6 +170,9 @@ static void iowarrior_callback(struct urb *urb)
 		goto exit;
 	}
 
+	if (urb->actual_length < dev->report_size)
+		goto exit;
+
 	intr_idx = atomic_read(&dev->intr_idx);
 	/* aux_idx become previous intr_idx */
 	aux_idx = (intr_idx == 0) ? (MAX_INTERRUPT_BUFFER - 1) : (intr_idx - 1);
-- 
2.34.1

