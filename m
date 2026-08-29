Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE33B05BA
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015346; cv=none; b=PDkWZn8WCm44UNlGcx77MA7xaLLcLPA1qmrfGkG0o4gPWxtQLYOd6QgFddJbdhMrGHDMK621HjnTFHwOdHrugcIclZa14jw2Z8w9BZLwqWFe1y8n8Y6ux1q71gCvu7RJDm5vscDSbOjYmiuH169VOIrcwzaY39si48P7gkeRN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015346; c=relaxed/simple;
	bh=3XdOABZSZLH0OgwUYmhLpcJyF2mhu4J+bTtYORu5bZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9NHsXM4h+wC3HV2FLieSKTuSZCLoZlttvuFg+GFTYo3iCVxZvb3a63ykDpfhKHDJ3gWi1/1k3Oot69ubcuvTh4D3naC2kbdyH8wyhYl0YbPPtrLo+UThRcP/vwXvs1him2Zhhiqlq8GCAPZHXPO+cr2ONReH9uzCAnaFfXZ7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+gxRfsk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+gxRfsk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so10611815e9.3
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788015341; x=1788620141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/89mfV6La/iUEjGbkyjyZE3vO+uySlEnPZmMX8i9U8g=;
        b=h+gxRfskZjmmU00YWJAE+CArrHUO5PHQrsRRG5xM3hOp7/QPNG+UC6+x1MLkb9GHDp
         w1NxFyLtIxTReqa29vrc9ayQQ/pttIvQ2mbLx9a3b45AlGZXbaX6eIAUqJldTs+H2zyN
         WBmOVfs9TDIHGOiywTA0xbUJBj2lhXiCbmgbxiQME3QryS4uxZHdsDBH9+iDmVkrFqQI
         x1EpPJ7oVlt5fVliV7wWungAUmYvfUPUmB3h8rRTaDvq1L5TpgyC4DewPV6/fE0WGaN3
         IKtWd4xpPdSjv44OG6A/WKv2fTAK227afl1rQN48unxtnGrP2tt8ACHk8iME2v2+f64p
         FJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788015341; x=1788620141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/89mfV6La/iUEjGbkyjyZE3vO+uySlEnPZmMX8i9U8g=;
        b=V9QZ9x03uXxfXbxP7bzkD5wWYyPVWW95OBMDB9RBxvwbnyKjn4zEviiv14ngcCGrNX
         C6j/6rdAu3iOE8GIAIXpfzU6SSwMzE7AVAo7gEez+RbK7EfspoUFxrto8KKM2VPP8nMJ
         xuTYq5r7FdQF1yaARBeo9HQynXOk0beOyWbKJeKfNs4MezzC1K68x54IQg2KDIbiKbih
         eLF7Yp98DgxjLivCbpG1yFE9VwdhaucUEMakctXaGYBzlLyX/oBYFdO5A5kJl2eaHWfY
         qH75YIJhazoXzCSDeSZG42mn5WOJIPk8FBM2hgH7FCWLmucdxo/bOdq7V9FzYrHV1EJM
         TAaA==
X-Forwarded-Encrypted: i=1; AHgh+RomNreU25IEJNJ3DgGWHv07UoaL2Ggbee6Uai9r1oYrkBqcVMPu/FRuO+GY/Bes8b5aK/s6Lrk+Bcw=@vger.kernel.org
X-Gm-Message-State: AFuF++lDi+U2dVfyzR/EH1q5NtqVcDrkrWQAVR0UE4ytVCo0XZLZfBtY
	P8uCycuiC+Ubn8IPR80vcvShDbnkGwTVleLXr2I5j5S0/x1TF4PrTp8N
X-Gm-Gg: AR+sD11025vLAa49rRFy8NCgZd0M9Siz8HamJlmrBrE5YWpdMz96ol2qFkk6BRq/MgW
	CtbcOtpJGgDoYhsNuaOPP3ViNlWRrIN8Z7Bp91WCkLMaI7CyGemWIqLzV6l4o8K9YHFZv5ObEHI
	er9NxQqw2A0qb7zDR8s/Z0y97JJ0eaEyJlA4KR/R0Ukc+rLWtBUwIr0lQ9ZfS1DRU7nOcOX7cUI
	5PX65msu577t1dNp0f4doHFThethimtjCY5pDEHvXLh33PicD2rG83MATt7ZHAEJAquZQ3Vrs7n
	S1HeLbEz6PUi0TNmgv4TVkQmPkB4LxL6OVix2MdGj2qaN1dX1zUu/tHDkJLz3lsox/U25SsFqWs
	hgZ+2fdtrzntMa0p3oJKvL39EHKm/kSiTI9/+fS2flLRvBqrjT1aJZ9KgWboaqlsAB574xxD3zh
	Ig2X+8qOxEjYqV1balkgeDD3zTxBf2remJgqMrRQLmC/JBcA6tI3C3qYChCeK1vZrLtl1DgEaZ5
	mQd9ymBnQTP3LXMm3zTY443TLOcwn4N1RQYXMVuuYcbmQNS1dEMnCGzKKQJxVR/YNkXwvxrNJLl
	jkdXItqZ0UkWMp8F6uoGqKEpaWXjt6z4psN1JOUkJvgZ/zFZ
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49b91c17294mr214818975e9.1.1788015341035;
        Sat, 29 Aug 2026 07:55:41 -0700 (PDT)
Received: from scambox.localdomain (5-198-68-184.static.kc.net.uk. [5.198.68.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm195113255e9.14.2026.08.29.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 07:55:40 -0700 (PDT)
From: Edward Blair <edward.blair@gmail.com>
To: linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: rafael@kernel.org,
	lenb@kernel.org,
	heikki.krogerus@linux.intel.com,
	mika.westerberg@linux.intel.com,
	gregkh@linuxfoundation.org,
	W_Armin@gmx.de,
	linux-kernel@vger.kernel.org,
	Edward Blair <edward.blair@gmail.com>
Subject: [PATCH v3 1/2] ACPI: scan: do not enumerate MSFT8000 as a serial bus slave
Date: Sat, 29 Aug 2026 15:55:15 +0100
Message-ID: <20260829145516.13500-2-edward.blair@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829145516.13500-1-edward.blair@gmail.com>
References: <20260829145516.13500-1-edward.blair@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSFT8000 represents the Windows Resource Hub Proxy. Its SerialBus
resources describe connections that Windows exposes to userspace rather
than a physical peripheral attached to a serial bus.

Treat the device like other ACPI nodes which contain SerialBus resources
without being serial bus slaves. This keeps the ACPI device present while
preventing the resources from being instantiated as I2C, SPI or serdev
clients and conflicting with the actual devices.

Suggested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Edward Blair <edward.blair@gmail.com>
---
 drivers/acpi/scan.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 7dcf78419..608527cda 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1770,6 +1770,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	 * attached to a serial bus at all.
 	 */
 		{"MSHW0028", },
+	/*
+	 * MSFT8000 is a Windows Resource Hub Proxy device. Its SerialBus
+	 * resources grant userspace access and do not describe a slave.
+	 */
+		{"MSFT8000", },
 	/*
 	 * HIDs of device with an UartSerialBusV2 resource for which userspace
 	 * expects a regular tty cdev to be created (instead of the in kernel
-- 
2.55.0

