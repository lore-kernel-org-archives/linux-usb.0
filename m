Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792844498;
	b=Eu9xpqSdexopw5emtkMfRyPVAlAA2TaKYV4GBqe7TCaaSJSOWMf/ULjkSgZIdx5oFsIm
	 FlDMN/FxXpPQqKtkHZ5XnBmCFV0ex8Sg9PwReJa5EXlb3HYKAWm8po1KuhSbG+0hyiaHw
	 iL35M/hLlekdsCkfufFXUZnT8vsRqBNXdHn1Qk//wwNb9sO8OgYhg/TMdwAx/H1I5jwjk
	 f6wbwPS8MQAYLZeO6S6+yw5y/w7TgdsmzSHOybQSW5Mka7ZNIHpmYCIRXdz4cIcolGRHO
	 /nlHRDlofQx4X28mtUrnQwj4wDKNmBJkPUAmf6OLfKIIqHZbIXVnLMe1AKsnG0q4qXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792844498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jqt0c/lDmpmJvJHzNqMywlimWKbXZGChu8Ayeo3lkSc=;
	b=gqfXx3uAnp+ZkG4YbsGHdMdVA1xtyIRp+1AG2SiiZK+BfnxdL5L4S1MSy9tQe319DoeB
	 i+L4EgAzX//XqyertPDtDykmarma9nsM3vU99HZ9h23aemZVtudaO9YOi1GI/bVjyrQ6K
	 FqeT+pmBedGRaDoP/fbD6CDRPjg0IiNEc0SuoAWpoEclmxyOWlfIeQ+z+ZH+35x6GQIPy
	 w4DDond9wnwPkrJAalzsXvJodl2aDloAEJm4hKQCcPRY66iqnTHwP2ebFZexNLoKXYJqZ
	 6V3y+The61vQiX7g4mn/8COsCwYCWKHKMfF5kF2rpTAI/do6Pw9/g8yofJlXKTP9ZIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="o6ca/lm6";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132FE606A31D
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 12:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o6ca/lm6
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35f036b17easo3503235eec.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792844497; x=1793449297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqt0c/lDmpmJvJHzNqMywlimWKbXZGChu8Ayeo3lkSc=;
        b=o6ca/lm6V4UU6dl/RTS33waZdfKti64hPX9pDpIVPS9Ntr95n85UNLonAKVQ48RuVA
         lo43EdWq2izqtWowWq7T5w03Nhwj6NsN/QTMybG1ZQ9JhGl7dTPBX4CGhgcA7BHYGE82
         qGjz15hZUutPNjYyidHcV7lGHOotCXy6ZZT6b8QDiwFaLiLSWSclcPopx6luMSuVdEmF
         SIxhZjD87d85IbLFcaTt+TAc0yzeC9YovYGRu9CUm1XhU5eVL1k5J0Iq8FppMVzVDAs+
         4mulrH9CJ9o+xbkJ2BnJshn65Tdn8gL3jhlmScebyZ/Eo2cCXMqwWLe3rsWjygZGuZzj
         VeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792844497; x=1793449297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqt0c/lDmpmJvJHzNqMywlimWKbXZGChu8Ayeo3lkSc=;
        b=1K1r6zDA+VroxhXnqGCN8VOBSoXLEf8MMuG9T0KqBhYGISux3uN3pNb2S2fv2gIpuV
         QSvFy112JhpCaUHr7mJ9XWR5YBwJYxVUwqAAH9nL5nsq+IeMOQrvxhVHHvbhrLWjIq+V
         pzEUCuz4CeE76PGIeObOjpZpIWGwmPIpot7QzMxTQ2rsqxAe1B2ATcsnVvU6MyESItvL
         yF7R3YbzX5rw9Xv83GSvtw0mTW/TUw18NGMVcNS7PXjeR4dN1GiKbuvwlSQ6Nf0ms/0N
         R9D1XxUCn0yLMohb0Sf87KjfZ+PGlzK5eQS3I0QesHOZCH5cD1P4OfTIM4gdYF41J4v2
         921w==
X-Forwarded-Encrypted: i=1; AKwUvBz6oj/v6eJbm7hw69Ct+uVGuc0Zm8HmY1Ws9T+OCvGXE98iQBgttFcigAAn9z6OLxo09gcY/uoJwG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLuORpdv6s++hzD+cMxihDUf7CIMOvj7diUALGjdJqklvsf4KT
	xy9hV0o5kKYqP8D7CN7SsE5YFxoY56L2kaTjHdMXQV8nxQkH0X2b+51h
X-Gm-Gg: AYBFou1tOsvXF+8UBTE6WgcppqnE4SrguFTVAho/8h4y9yncIgkyXHCu4+vSQK9FLz+
	7jTYy8N5235aTBdruQuiL1h2AhGjwWA8zoeFYoAGeMTB9SDcuIVQYtYuz1EBHXuvZF5a6w5gw95
	fdzaIrcFpO0nkEItM2GWNYZAeyTBEm2tuvrY9wJ2JobLWDgnn9gVGGhF+HXG9OOBBM6wwBF11lp
	c4pWNBRD31ukPcnDdmPw6YH7Wbm/HkcSclxs00Hr0A9iXf77NpvVwkkSWNPbudHgJ4LXysJCqHR
	hqc78JC7fJyEu0F1T7pHuH10tiUP8i+LJLrtBMfiOPDwaQh2iRZTo+TIh47KLtlR6gnF9yXOWEZ
	dRnwbbMtPeCHt95RukKIzTDVJ7Zv7wANvAdQXbNQAe8gHxelPf3z8X7iwUh+DLEa1OiKpCc+pFT
	M+GSOGXNTTGgXb+PawjPUdAS/lzpAu70tDXIGHgRHUPzYy+asmaF5gy2iSBAEyc3oLAeCnIR732
	AQ/T//PrOYgw5cKJ5kf0BGm7xNoXh+Y2cfyGa51v/QekHPlSoWt2gBQgYR7HPk7uLtkMFFujzSf
	Tq+I8j4XCWC9khDBCnM=
X-Received: by 2002:a05:701b:2501:b0:163:8b44:902c with SMTP id a92af1059eb24-199374f457cmr2427790c88.17.1792844496879;
        Sat, 24 Oct 2026 05:21:36 -0700 (PDT)
Received: from SAJV1N5.lan ([2401:4900:b9a5:d1e4:f9f6:478:606d:146c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm8559529c88.6.2026.10.24.05.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:21:36 -0700 (PDT)
From: Divyanshu Jha <divyanshuj2006@gmail.com>
To: Oliver Neukum <oliver@neukum.org>,
	netdev@vger.kernel.org
Cc: Divyanshu Jha <divyanshuj2006@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org (open list:USB CDC ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] net: usb: cdc_ncm: add Apple Silicon MacBook Air (05ac:1903) device ID
Date: Sat, 24 Oct 2026 17:50:51 +0530
Message-ID: <20261024122051.14427-1-divyanshuj2006@gmail.com>
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

The device tested is an Apple MacBook Air (13-inch, M1, 2020), Model A2337
(MacBookAir10,1) with an Apple M1 chip. Unlike
commit a5148bc2fa27 ("net: usb: cdc_ncm: add Apple Mac USB-C direct networking quirk")
which hypothesized all Apple Silicon Macs share PID 0x1905 ("Mac"), this
M1 MacBook Air exposes PID 0x1903 with iProduct string "MacBook Air".

Like other Apple CDC-NCM peripherals (0x1902 and 0x1905), Apple's
firmware omits the CDC status interrupt endpoint. This causes the
standard cdc_ncm probe to fail with a missing endpoint error:

  cdc_ncm 1-7:1.0: bind() failure
  cdc_ncm: probe of 1-7:1.0 failed with error -22

Add device ID 05ac:1903 to cdc_devs binding to
apple_private_interface_info so the driver bypasses the interrupt
check and initializes host-to-host networking successfully:

  cdc_ncm 1-7:1.0 usb0: register 'cdc_ncm' at usb-...,
  CDC NCM (Apple Private), ...

Relevant 'lsusb -v' descriptor output:

  Device Descriptor:
    bcdUSB               2.10
    idVendor           0x05ac Apple, Inc.
    idProduct          0x1903 MacBook Air
    bcdDevice           10.01
    iManufacturer           1 Apple Inc.
    iProduct                2 MacBook Air
    Configuration Descriptor:
      Interface Descriptor:
        bInterfaceNumber        0
        bInterfaceClass         2 Communications
        bInterfaceSubClass     13 CDC NCM
        bNumEndpoints           0
      Interface Descriptor:
        bInterfaceNumber        1
        bInterfaceClass        10 CDC Data
        bNumEndpoints           2
      Interface Descriptor:
        bInterfaceNumber        2
        bInterfaceClass         2 Communications
        bInterfaceSubClass     13 CDC NCM
        bNumEndpoints           0
      Interface Descriptor:
        bInterfaceNumber        3
        bInterfaceClass        10 CDC Data
        bNumEndpoints           2

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Divyanshu Jha <divyanshuj2006@gmail.com>
---
v1 -> v2:
- Retarget from net-next to net.
- Clarify hardware model (MacBook Air M1 2020, A2337) and contrast with
  commit a5148bc2fa27.
- Add 'lsusb -v' descriptor output and dmesg failure/success logs.
- Fix typo in commit message: cdc_ncm_devs -> cdc_devs.
- Add Reviewed-by tag from Nicolai Buchwitz.
- Link to v1: https://lore.kernel.org/netdev/20261023070419.235361-1-divyanshuj2006@gmail.com/

 drivers/net/usb/cdc_ncm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3e4a..6848b9421137 100644
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

