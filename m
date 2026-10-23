Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739069;
	b=POEG4jFycWQUAtlpeiGBIcFnGb0ApnIFWzT9nYcZuv6asp/eb2NAOfOmL4kLv7gVakKO
	 F0ckcaUEJPgdLjHmlrKVp1qyNH0z2WwzHOe+HQaa5hOzoFyS27fvYZnxQQ4AFc9mNCNJB
	 MwOr4AtmKthbF/R3tNv80X0i5tLyFvpGtRbfknGnYWOAgMmlgsgWpTLPUxQZLMuMP2UzS
	 Sw642XYx6cZu8CW9GcY3Dn49BWcbr97BP1FSHcpsGE6TSEWEQRBz1VHANzocC/0xQuYxY
	 SYKUnIuMHWUTu/2uYsTEhJt19E89hZAIqp9Y0UpMQhkvg45oHJ8ZzA3QgMT3MFI9Ctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qG5b3GBAm10vBf9IK+PFH6C3j46v3ALudwzqDcSeLhk=;
	b=YgDlwbQMfS77v7YgbxNrmT5hcq2IVp27CLPbJFW8AzaedCjKjJPEMVKNvQn1TSJeJusD
	 AD4KTDgStmuO3mRgwCPhSFSc46dqhwImVrt+uPmZo59kM9YNaaXOZYxM27CzLjo5OAaFF
	 IZgagdqgZiz4E7NBeyR/heW0KM3Q2DcaNw3ujYd4nvL9zL81tAoC2jNSeMFxFXO6UU/og
	 zJqNI9D335gBGikTH4k9ko9xdN6JcWRS4WkllfWlW+IScgMCq/uPWc3SjhhUTDHCeRMBB
	 nWWzds6b2/GXMfA7DnojrgwkybbN0V5CHot/WJoRH/fKwCgTSHKwHGUPvLVg0w3kb0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgiCm4CB;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20508606A325
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 07:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20508606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgiCm4CB
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35b2c599f43so1375891eec.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 00:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739068; x=1793343868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qG5b3GBAm10vBf9IK+PFH6C3j46v3ALudwzqDcSeLhk=;
        b=HgiCm4CB/WS6pRw2SWQIvkZ1zLtaW1GUKFazHOhdwUgfMlbe/K+ehi8yZssfpEPqaa
         7aqJUyj1cDGLrh5U9k4dkSALQFRC7I5q42ZpvyIz4f69htYbNxp04eKUKtamPx1DBj+v
         M+l2WR4CdWV2bv2AR85rgzE8nG7XWJKlgTuJRvXZQh7HqW+IJs4nsYC2AwHzrfp3qUH/
         qIQw3eNXPkBVV/IEpTErqIqt+nEHeE9VoO/dLaCps+nlgU3yQICyx6HDL6T/LHXxmbt8
         c5VOIveoku6z6YZCoD1Kxkh2q/xMXmgRxNqJ6MzPGLecUHiYLJX52h1hZ7Wv7Kf/kQve
         gsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739068; x=1793343868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qG5b3GBAm10vBf9IK+PFH6C3j46v3ALudwzqDcSeLhk=;
        b=24kHVbBW+PX207n8UP/k27OPDGbd6hJUIH3u2+7GIqF/A/W9s2V6ODY69uAGdB06wm
         6x4kwYUWVmHumFSo12UFGGesluLtyA2tTrig22+IM6j6I/n0SfT0yaNkuODQ4+PMX+Q4
         sSJfXETiwrOWfpIkt8TgMb7QEYoAQEfVPUhAPHaRudr+OXGuc52eEVtX391BW84QKgYf
         hqtF9LKUqp/+pGRvBYw5hbGuuYQE9v2oIikr9DgWVy5L9YnNl10A+dcsvHWZkVOOf8Za
         2GNaWqFQEb7GHHK2siif0s2Ij0kedDuYqBvMZwkyCzHtLGePNCWrFrHOevhjoZ9InSpx
         brcA==
X-Forwarded-Encrypted: i=1; AKwUvBxv91PlBYsP4NnBb+L6Cml9USnIGlXtra7E9Df6WdOyijj7BWY3mjvRrK8EJi1wbGVeLCYyr2sW7Ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhf4JGfOi3OHBGznrhDRZxZJJra63NTNFFUmjki8vvVdCRxKAa
	D1C29SgAAd9eWF0acNoJeBQVBvfSz0fN8nbb46oyY3NhUaWFeB5Q1+OP
X-Gm-Gg: AYBFou3ykCfolF0t73yAlaIAp1qNWQOE8xiKZWLTL/Un9750tKkQIqBvDfRm3FmfiFJ
	TkBUIADcMi4QVbeTDveM62jkDenKOON1/IhBpQo8BYxWo3Xoz9rPD3aPT0JdH7uVxixjmQRKWPp
	9z0GPO1UgvmzjdpOGxfVgfc0xNbo+RQiQS3fBmul+m1qjyHF5qyF7bTDm1YM7335EL9GSFqihLf
	4+k7tULNLXMmKRjsvjO0guGd7UMCluVSt4slUFbV4AGo9hZSZtxmLA2hTPPW0s9eyXzCMnqiHKM
	hMmfrdprd0o6ThkhOTDRmVoowsMzX65BA/SW2TrWBw8tixIKzVCQkeEIvpbp9/G1tTJPe+iqhZy
	j/I94EwJMTbOy38QW5vBGaVRH46p5GBfZSrRs0vzdaXAmQZVv3MC+caa79bY8gsO8p9oM3RaSjq
	py5M/B58Pc29FCYLEYDfST3AfY8U1yDGSISyg0rBf7Xjv0VGdOOvgwrJoPkV9nnopE0CGi8oSmV
	UtFfPM7hB8TULOS4jyRMslOQ6QIgAsybtV1tZXlIkRezOmdM5kWyQqGobxWymW6xZ+Pa1PRT9FD
	w3EXeHufYW8PTOVbpxMTTIL/QJSlAISfNegfnw==
X-Received: by 2002:a05:7301:f8d:b0:35a:7020:c08a with SMTP id 5a478bee46e88-369d976cd6amr2105063eec.19.1792739068048;
        Fri, 23 Oct 2026 00:04:28 -0700 (PDT)
Received: from SAJV1N5.lan ([14.139.240.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9de33acsm4764472eec.20.2026.10.23.00.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:04:27 -0700 (PDT)
From: Divyanshu Jha <divyanshuj2006@gmail.com>
To: Oliver Neukum <oliver@neukum.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Divyanshu Jha <divyanshuj2006@gmail.com>
Subject: [PATCH net-next] net: usb: cdc_ncm: add Apple Silicon MacBook Air (05ac:1903) device ID
Date: Fri, 23 Oct 2026 12:34:19 +0530
Message-ID: <20261023070419.235361-1-divyanshuj2006@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The Apple Silicon MacBook Air exposes a CDC-NCM interface (05ac:1903)
when connected host-to-host over USB-C.

Like other Apple CDC-NCM peripherals (0x1902 and 0x1905), Apple's
firmware omits the CDC status interrupt endpoint. This causes the
standard cdc_ncm probe to fail with a missing endpoint error.

Add device ID 05ac:1903 to cdc_ncm_devs binding to
apple_private_interface_info so the driver bypasses the interrupt
check and initializes host-to-host networking successfully.

Signed-off-by: Divyanshu Jha <divyanshuj2006@gmail.com>
---
 drivers/net/usb/cdc_ncm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3..6848b9421 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -2019,6 +2019,12 @@ static const struct usb_device_id cdc_devs[] = {
 	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1902, 2),
 		.driver_info = (unsigned long)&apple_private_interface_info,
 	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1903, 0),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1903, 2),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
 	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1905, 0),
 		.driver_info = (unsigned long)&apple_private_interface_info,
 	},
-- 
2.47.3

