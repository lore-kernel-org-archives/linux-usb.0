Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645737;
	b=vmSXVTk2EKSvgHlEX/UQ47SudAeNvoY40wMZsttEIVtX1czyEqq6KZvU3aXANQScH1Az
	 rbwTBl479Zmz6OHTPjJjAH7EkWs7ZZwdCrnAedJtlIOzB5DOXr/1UuWmKUwGci63P9BOK
	 IP7u2W7bExrlH8aYdE4R785xTBfkybT1A/FQF8Sqd1TiOtwBL2q5HggKImmZ3JJFXW/b+
	 5hCwC68QaEJJ+oBX00OPY2MT7dj6f0A4QSI9YdQV+8EUk3kz6r0YmMU3poK30YS7kLlAh
	 yVuc2X54SmmJXCo2E2C9AkorlpihKDZMNwImjX5vq6jEpQNuPyBwFxg4hynbGL7+MbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+G+uV6wn4dA5VTXmYb7jbew/KoHfSprRvHUbv8X9R3I=;
	b=3oGvzIKempcdkg1c9SirWaNwfPm69E/z4C1bDDj93MyaAtsK7WWVRvwCGYEn2NF83vyW
	 aaaDADeVzOw/k4luVJM+AaxIBMIXN9BZwjz1eNEoF3ogNRRQeoFVPKPk0Pck9FM667ncv
	 bD4DCNj5Ix57OIF2ha/3RiS0i8P4/nui7XPyMU9qp9l0Vc+YMKkC/7U5o1S3cCaZke+nA
	 cPdG7WZQNgwOEm17OvcWeqk+4ZcPtQLFZKQGhxJaF43p6KZQpKQb3Q58KA7U6uw7r106z
	 A4Prby9H9P85Pulk7wl757hUVD0wpUyO8lJ5ABPSXGaqTcjBnfAsUPDyHY0tIrVnSzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XNSc7e5z;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D402606A337
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D402606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XNSc7e5z
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8028096eec.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645737; x=1796250537; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+G+uV6wn4dA5VTXmYb7jbew/KoHfSprRvHUbv8X9R3I=;
        b=XNSc7e5zwWvVgX7i4Of7++EHH3p/niveXhLkX9RmyD7j+lqq/sGmx6rMj6R3sy8sEr
         8m9De3+5Oolw00oVly9q1B9bjKyVWLuqSb3jcAL0ZIZ8824rFezMv3mih0zeFZai8JNL
         FXb31CSxTtr5DcbGKsVuh0UOE8BoB3Fzx+5EdontHWm32aq1d5n0yeGEpQu1WFgqVyK2
         C+A2GYYcv9kgSlPI4pOdiISaySsU73N8J5LpOyr/OZ5CuW5TsoJ643i16HjFMPK61BpX
         vJLgEU4hVn6KMSGc3BIO1X3TxjOQ9+0tdH9einkwsN0wu2UJeCAE9BCqhwrsWpzU9T9l
         tFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645737; x=1796250537;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+G+uV6wn4dA5VTXmYb7jbew/KoHfSprRvHUbv8X9R3I=;
        b=phOCXGFwZAYQoAYKhUIwIzDtNbFwZDBM0j4upSfH9CbkpGOpcF2SeuV2Z7OH35ZD8Y
         WkzEz9diGeMhmYTmt2vIxUOFS5jfOGnbxGt/zYmSFrpFSgKyQnXvJqiH8XZ/GjaU6ch8
         scxDY7UzoRvJlwjkFvP1s2mGNo8RUUNclOR8jN7YefaCjNh0/7ubUose5QN6nQBrsz2r
         XUPPZ4uUuUMShz3mAiOTijwuLZGiM8Xq8lStzV7D3RTLX7DRzeoiaQj3Ic7Y1Aq0E+90
         KZX4TJZTwiflm9B1c35XwhywA4Y2BuFahGp9IknAEspu6N/GSduZg5eZ5q0CG6a8lAcY
         I7Ow==
X-Forwarded-Encrypted: i=1; AL+hErHMDO5yO3GrnnaNKzwQQGD5BWx9TspttSmWfWgsvSBK1NCmLhLlNthjqq9iZrmfLMDibsZfetfQ85k=@vger.kernel.org
X-Gm-Message-State: APuU4Z++OkIZijaKEufyzi3mmxer9GcSozNGOu5p2KV0dmJiW1Llwb7k
	P1DKJDIwbrHC3yftEY/yb+viWovWNihPrFtCsMDYDQZAYtcEUJFqAZCjMpNvuoUFEGmj916s+rS
	zEg==
X-Received: from dlaf15.prod.google.com ([2002:a05:701b:240f:b0:195:cde8:ab41])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:8148:20b0:1b5:227:7d1f
 with SMTP id a92af1059eb24-1b55689eac0mr18892001c88.11.1795645736109; Wed, 25
 Nov 2026 14:28:56 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:27 +0000
In-Reply-To: <20261125222828.1452483-1-elkin@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125222828.1452483-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222828.1452483-2-elkin@google.com>
Subject: [PATCH 1/2] usb: misc: usbio: stop resubmitting bulk IN URB on fatal status
From: Elkin Cruz <elkin@google.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

usbio_bulk_recv() unconditionally resubmits usbio->urb in softirq
completion context regardless of urb->status. When the bulk IN endpoint
encounters a terminal status such as -EPIPE, -ESHUTDOWN, -ENODEV,
-ECONNRESET, or -ENOENT (for example on endpoint stall, disconnect, or
usb_kill_urb()), resubmitting the URB causes either a tight softirq
resubmission loop on persistent errors or a wasted submission against a
terminating URB, and zero-length completions also inspect stale
bpkt->header.flags bytes.

Return without resubmitting on -ENOENT, -ECONNRESET, -ENODEV, -ESHUTDOWN,
and -EPIPE (matching usb-ljca), verify urb->actual_length covers the
packet header before checking USBIO_PKTFLAG_RSP, and log unexpected
usb_submit_urb() errors.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/usb/misc/usbio.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 7b5f8669aee3..6142a32c18a9 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -239,17 +239,31 @@ static void usbio_bulk_recv(struct urb *urb)
 {
 	struct usbio_bulk_packet *bpkt = urb->transfer_buffer;
 	struct usbio_device *usbio = urb->context;
+	int ret;
 
-	if (!urb->status) {
-		if (bpkt->header.flags & USBIO_PKTFLAG_RSP) {
+	switch (urb->status) {
+	case 0:
+		if (urb->actual_length >= sizeof(bpkt->header) &&
+		    (bpkt->header.flags & USBIO_PKTFLAG_RSP)) {
 			usbio->rxdat_len = urb->actual_length;
 			complete(&usbio->done);
 		}
-	} else if (urb->status != -ENOENT) {
+		break;
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ENODEV:
+	case -ESHUTDOWN:
+	case -EPIPE:
+		dev_dbg(usbio->dev, "Bulk in urb terminated: %d\n", urb->status);
+		return;
+	default:
 		dev_err(usbio->dev, "Bulk in error %d\n", urb->status);
+		break;
 	}
 
-	usb_submit_urb(usbio->urb, GFP_ATOMIC);
+	ret = usb_submit_urb(usbio->urb, GFP_ATOMIC);
+	if (ret && ret != -EPERM)
+		dev_err(usbio->dev, "Submit bulk in urb error %d\n", ret);
 }
 
 int usbio_bulk_msg(struct auxiliary_device *adev, u8 type, u8 cmd, bool last,
-- 
2.56.1.839.g22a8290db9-goog

