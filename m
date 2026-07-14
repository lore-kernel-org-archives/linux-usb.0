Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23C34B1B0
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024046; cv=none; b=PPXfUJUjTwLD7t6S4U5rijVRBvzayanETOtv7q6tvqj0NSqjFA+SL2yUnmXoGV2YjjQn/KBZdZCdNKzHEVJ9WJHA/51uH0Xu2pcqwnJ6hMqB4BOcPpXU9M4LtuOfvhryWkko1J9JbN4JoCJYlnhim9cA5CC1QZjAnPsxWKIzgTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024046; c=relaxed/simple;
	bh=p2dQTTQdTpKvVeMgPhawUSo5oJ9pchAtUob6piPpChc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOh/9+dNurkMK1WRP0PqMDNAPcxt9XHjtxwBdkga4gwz7fJ+QtSsEtXTSn9NiTfw3aRE5CgTeKnQWNlsj5BDu8B75EmM3xrfl3g2C0cWV1MnWi3G1gOokZtL/lwKgeY2Y0FSo6hTmiHB9q8fjugmxeUkrFsZ65MhcDKoAi8Wm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfYBRura; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfYBRura"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caf228a910so30178435ad.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 03:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024045; x=1784628845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmtKecbnxRPYshTcv5xwGpgurQuWsmHM4snanZO9G7U=;
        b=OfYBRuraHi7YusYeNRVv80XJFV3OYViZCcqeod+Tx2p95EJW3gjWb4eq/R5pFkJ9LF
         eGGoznMWXi4pWVkcIhiULhQ3ZTLms5NUks/xfGzzOB9W5cQO6vAvmcRmWym+9kp2Tvvq
         TFNMFEiYRRsx6uO1XcD+1WILytXtI2OO95mcO+UBheg9hb9lrFoXJerhozjkBmnvDyvn
         xOypH93mf3jnFS2rgrm59HvOKSB4VEW3uuabQ6K3I2c9PAVdNlDxr/1HNRqf4y9SyKlq
         bLBFT7b1EmXoHtJE1X0ZAi0IMHYDcpziuVwwquGcXN7TdB18Jg1vob3uZOkQ04nxIz5b
         8g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024045; x=1784628845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmtKecbnxRPYshTcv5xwGpgurQuWsmHM4snanZO9G7U=;
        b=ddkp0CYIZrz3pJeQbV4kvR+4O4ujycPBRaMbvHn1vLYcd0M4Hu6BNJI6lqSF4vZxK5
         fR9+gSRtx1609vxn1EcBvF8Z0WjyRd58s0Qa8tB/RCD+u7g+NEAsAQvzy/dtTFs7EIqN
         jDBUviayxF4QBJBYm0SDS9dLNlxmYkhlthTQk3aYitjAWCghNT8VvC5fGlbWEjN+uWbC
         hm8ayg9dnU9/ymKhQmTUTuUESMbB9zo0qvcvI/m4NY3OpESV8xLoQjk3o4/h3ixH+5K8
         KoLHHeP7e9gint7zyx4KtR//wUXJLQHUwuI0E++CQuJgEyh2vsqU6FTx3q+9SNZPrJvd
         jGng==
X-Forwarded-Encrypted: i=1; AHgh+RqNS3/evMb+TVD3pP6buL2Ff1XRB5bP3xGHvm/v6ob4eTfdmV2FQxeD2TKqg5hObz8bQdno3pygFTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfw0UTrteo2+Se5NmqoPQcULjhFNNvhotZdKhHUb7y6XmwF1fh
	S97dHg0+Rd8oOqIMBmJIm6Xs4xRjuecC7s3sIKQXlXR0pgEffhiB05qL
X-Gm-Gg: AfdE7cluLl8AFIGYzkQhxxFeaIjZtTqjAK0jRMwEOdZLI37ppP+/3eIdW7GanBMtp41
	LToaTnQl/FzFEMHqHmxTFB3lNSGDdG/Zm7ClelOO5n4xCPJuu76WNbApKFAczm9ZuUozwT/6s49
	KgCW1ulvtRLH3inboNrRK7LkrWO7QlC0IesQjGA4aU+Esa3nP8LdreqtGrbjjEW8SgrnR+qYjwe
	A9UDY8tlwEp4qUtvM303GfueQep8tcTN4ngiOYApdNe+ijuL2y0n2Gw09wAg4ugU0h12okDaivL
	574Aj6hE4lvxRbA3kfKBRB24I9PFTST7OFJunJ/Ye1JvfI5M9oC93bW0k1pePIIHZMUQ4fWJBS2
	eEnqtMz+aCcP+muhvp6f13l91jUf8lcSN9k4QpJRvU5QbdmmS5R8UYzknyyeHPxFOl21OlkyZHM
	5gB/jJrihkrxsSOP3Eccos5Dju0KGxBsAwpeSji4W2mujp9w163PbO
X-Received: by 2002:a17:902:f708:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2ce9f17913emr125076955ad.45.1784024044654;
        Tue, 14 Jul 2026 03:14:04 -0700 (PDT)
Received: from shpark-MS-7E27.tailee9dcb.ts.net ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cedc6c6931sm22379365ad.21.2026.07.14.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:14:04 -0700 (PDT)
From: Sunho Park <shpark061104@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] USB: serial: io_edgeport: cap received transmit credits
Date: Tue, 14 Jul 2026 19:13:16 +0900
Message-ID: <20260714101316.823942-1-shpark061104@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt-status packet reports transmit credits returned by the
device. edge_interrupt_callback() adds the 16-bit value to txCredits
without checking maxTxCredits.

edge_write() uses txCredits minus the software FIFO count as the amount
of data that fits. Since the FIFO is allocated with maxTxCredits bytes,
txCredits exceeding maxTxCredits can cause OOB write in ring buffer.

Cap accumulated credits at maxTxCredits. Conforming devices should never
hit the cap.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Sunho Park <shpark061104@gmail.com>
---
 drivers/usb/serial/io_edgeport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 34ccf7820537..2ab3f8262259 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -646,7 +646,9 @@ static void edge_interrupt_callback(struct urb *urb)
 				if (edge_port && edge_port->open) {
 					spin_lock_irqsave(&edge_port->ep_lock,
 							  flags);
-					edge_port->txCredits += txCredits;
+					edge_port->txCredits =
+						min(edge_port->txCredits + txCredits,
+						    edge_port->maxTxCredits);
 					spin_unlock_irqrestore(&edge_port->ep_lock,
 							       flags);
 					dev_dbg(dev, "%s - txcredits for port%d = %d\n",

base-commit: fad0fd120e29041b3e6cdf41bb12e3184fb524a2
-- 
2.43.0

