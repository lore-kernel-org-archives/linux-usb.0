Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685911;
	b=pJ3Ak3NJAOySF6URLp65czTTK+k+tHbUnzrY1tdOARTXnIoG6oY5L8MYGrWHD9yL73Ef
	 WOZi6JzGsQ92rJmzF/Vs7skivdA9EFoewKfI8Zk1VgyxCMjl5ncY/8lmKfuIM7HZpBzEd
	 X7Itm7U9N9tdYPscLSjACrbJNcl6V4Z4Rs4H9zN4AmFdyGq+6X5HAj90LTdHzxutPF2Q4
	 7Y+rVfrlantoyY11X+ijWrG+2jUOW7iWcIjIJ9+89S+EEYxaUFTpWYhz08MqYbgqc/Psf
	 pIJJifMhLpAsffO73lWM/Da5zJekFInMAh8QC4//XK1ELmYJLvsu6Q/pSSwk9iyyiOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
	b=gAgMVm3jk31DY1IzLqTThE+Fw50NsAXgi+mtWFg+HMVc2xbHFOIjL00efTUPzrRzNAwE
	 ik0y7Dy4OPZTQb+U/6u/ouEkQOa/wqskkZbyZm0C0vqqTptC0ULtVd0Oqy+TmsfH4Fw2S
	 qvT0cdXTu7xry+28h+WI5K9t6PUuc/tkvE47XxikQn4+lK+uxlfwOfDZCoOqYU8XthD7N
	 8ACyumaez/hP00cPvcjJShATjE675NoiisItT/lqL+L+2STIfYpwIa9aR4OZf8retmyum
	 OcxEXC/FGmF+hRhTuw1CrU5nf/zYXuXPZHVEa+6No0xNLd4CvBNyfhtVHRhmlBC9GOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWGzwxQz;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE6606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWGzwxQz
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so2428636eec.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685910; x=1796290710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
        b=aWGzwxQz9Wi0C+RrshIBxa38+3yLzysGAYB2LZxc19Q4H+rfA+20UKVsTMEMSUeidm
         5LJ5ndEWuh4XOccbQ0BNHbHh5PQe18HJds/1uubckXyXDn2iRlbQ7vgdAxy3TU+Bjz+c
         gpvTmloYsu2CNrJTDM7/vL+L64fqBICziPt7XYWhIVcwICsI2IV3ffjPN7KD0PyQAwKK
         11s3wD4mzkavEvyBmzyrXKdzSuMRNz2ZR42Hn98+zGDHVB4yk7Y9Fu7yueqT8qV/xWVF
         U279c810mOPFG+UPpjNkIB4e0XEE2i50DFqmlnd/MF0qfYQl7O+8c+vnsFkzLEmo3Zwr
         LIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685910; x=1796290710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
        b=sVQhPi2J9ZqAysv67fyJcg75NAL4fYAkXedMWEc8yimFGiP34fFTVEsmwd5wGV9/tt
         WAgMbO2RyHIiZkL31c9H0hmiM5hYdH6hcOgskJMfaLFNe2O1izHrv59pdYtbKdKp4QwV
         ohMDo9LwTjbHfqFkOfRDLmFpz9cyFTbstm1sQN4v04/SzsxDgEtb2aMCo1sTShGziwI2
         iUpam+R4eYdPWkkTWIygacoqB80nrTK342Bh3UqfEiEBJMc8eEe/g1cdfmpe2a33rFmc
         1HOJCQ1Cq6sgGCtJ/Hwzkrxj5n65+82Ixt5coteKNPDtjAAKPEYXQOkKqt3gPwOeXnrw
         R8lw==
X-Forwarded-Encrypted: i=1; AL+hErHqnMuK9QzZZtTUrlurvjmSiegfp2O3yZTqUBbufCygoZdNrcKhpN/HZ8dRWH2TojJAkIvglPsyKj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XhM2KpD48B8I2PgUahpYTzz70D+k7VsZNdYvmrcTFh1Cd5yGg
	maEwuWhktDXzWc6W7YBgdhboZS7JVXUHB21qkEWxOx/7lKDxJNzggSzb
X-Gm-Gg: AZFdTZc++OUxk1fQSAkrCn92v8DpleC97dgtod9T8/XitaWroOBLFcsT8F6RvCvY2Tj
	N5nIjfJeW9oNUbddlW8GPwfqczddh6b6SyyXTRudukQOKvJllZl3Ny1AO3Pj7tFSrTZwqDjLboG
	Bp9QFw/E9UgdXXUCwfrP76jVcAv8IEiYLVFAP23lF7dbAVdTp8Zexx5F/ZG0+Ya/zZDnhAANH7N
	yeZwR9SqLep5MJAgFjgp6XIRkzx95BKLJkjF24iJPt643yL9rYPkk12Vyc1ZWvo7wDuJHDQ1GbM
	OEZmJLYPL+6cerBGN6ZPSSgUd9ZSAWEsqeFSOvuT9h3BJ9Xa+TxwuJ1RdVGe2FYM9AfKwTskHfW
	h7vZ2v1s1mQ3ylju8bmLhvA8cN+J4Sfpq/4MSuQwpfNuD8BtncpKrHMOLuqfVBcP2+7sGNdG6/Y
	xnjthTzr0OvAXZEMPoIo9bKXOMURDIVo9W+SnyfGtYf710wODdB/MCVpJjOa8FZCe/hyzHvWF4m
	pf5/soRD3tllWDUMF7sGL2wiNd0hOCXvLF47pAwit8BnpytzWEzEWeAydLqjUn7kaV6p1USCTCH
	fV6nKZXAfLCKalbiW5r57N633djPmJQFB+JBddV884PoNcOlQPGr
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr13514697eec.11.1795685910273;
        Thu, 26 Nov 2026 01:38:30 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:29 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Thu, 26 Nov 2026 15:08:17 +0530
Message-ID: <20261126093819.76480-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

On boards where the TUSB1046 HPD_IN pin has no usable HPD signal,
configure the device over I2C to treat HPD_IN as asserted while
DisplayPort Alt Mode is active. Describe this with no-hpd.

Changes in v2:
- Use the existing no-hpd property instead of ti,hpd-in-override,
  as suggested by Rob Herring.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: Document no-hpd
  usb: typec: mux: tusb1046: Support no-hpd

 .../devicetree/bindings/usb/ti,tusb1046.yaml        |  7 +++++++
 drivers/usb/typec/mux/tusb1046.c                    | 13 +++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.50.1 (Apple Git-155)

