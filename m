Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793235494;
	b=V4FGRh3GPYm9hSuc4iHgHbo7wiRjomX0MtRusiX7mLCE1DNH1EOgGG/juj5XrtxXtcFv
	 zZlkdY+6HRdLYxPH/Fr1I5jK8aXdfMNXO7OYAE7pJ2P16valtEGcbr2YU0x8fy7AF69T0
	 Z/sIK4RyyA8zU78nrk0Xp5xVeMbvO7Ue0fwFPAQw8TiD5jZbj2YiQKjc4hCe8ozjdO/fl
	 08KK7ksYERCOpljiK1xayD5VUEJTpJI2/FCCkq7cP4gjXSI65vwi2jdFSmu7W+nfx+q/q
	 FclkvMhaoOxtzntbFPTmMzC6/vlQOQGim7MR+ieKbu/aYOU0G45QutnxNevLobIOVeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793235494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
	b=4lz60L3g3ZFhRCbolL+AcJwUTs19P71avQ1L8gGkiXe0sQpDOYycT/+vfrzK1/uSaU9Z
	 aWrBnStpwWGkJHyRrEWhV/dqebNu7/NQO8mNsaOvxJydhn0oN+FUfCtx4iLbo3xeD9oq1
	 hnFR/HK5o2fq7ffZURB4HfbqoOsAos8OsqCpjknpZ6fI63yVxBzOcvV23hC7rkrsealwp
	 +JqwJbvvsidrWs0rYg1YCydiHWIkNJDFvCmnMFLpkOsmZvtEFB+bIXpxYs+uR1380j554
	 XQBYtju3ieja97blyCtZSV8AeHYKHNAagxxd367NiDlry5rtBJGZNNJXgfgBOHaCkdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rs8xIkAo;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EF606A31E
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 00:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rs8xIkAo
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c418e215671so204630566b.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 17:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793235492; x=1793840292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
        b=rs8xIkAouFHDsph5jR746myyk7Bx0+LNv1CR/Wt5X62T+524n9QPun1aakHOpK2TdZ
         5DmzpUBHkUlXiNI8zoV3Jytk7K2OWDFUQhiOuU78cfX7QMlMKIHxNBXbgZaKhdp49oX8
         pkp5USBEg0p1Ghwcx97bwqO4oCdxJdXvL3rx+pSMQpObjrsh0L6Lj4/CPHRzcx1k3nxH
         EbLADyELT7y9w1Bq7jo/QwVDBh6MC4C2l7r18PKZEtpziPOgWjlOc89CK8C/aS85wJWV
         D4BBWo98f6KzussDciaxsvQAYYxC3a9GZucuChxfUz1pT0Mt6z7rio//7ffN6Li5zHY+
         WscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793235492; x=1793840292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
        b=0LMD10Iym2PDy4cYIGTCEVhN1jI95AOrkRuecsbKN6Yinv+lDh9RuB5YpogB0HpTjg
         qOohA1XotMDvmEbEjW1HV7ic2qjdnJPtPTFiprxKoHlYPVBvRIWZEHUe2UILlWT+8LPD
         agVaGb7mzSqQCZlWiGehmMQqUEhvl821OYX6MX2lTE5f0GEUtv+BtYN1AyUq6ECkMPRL
         Z5Pe3Eyg+mfD5Q1P1mRf7KSWIA+I5UFflLwGtOlIwIJDbCiacdjL/F4cxEKA7ZXSv+Wa
         xO3TqUeURG24m+UvsWw7TNiCLqlWvv76rithj4TMAqIqBawsosWEoAvJRDNvNTiXoO/C
         SqZA==
X-Forwarded-Encrypted: i=1; AKwUvByS65ujBqGlu+CAKeo74wZIAoQpXENZl/AwjC2jdRfK+6zS8DLQS0UbvlyhP+rD4FZ41wg8lGxbqNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkF01aLbWbeQiDlo40fZ4IS4STOvl70UXE2wfE5Xobl23AfWk3
	Y+XiaYqwbq8ZQufA8UIG5BCtEBzNy+cVuKX4k98LhpJtPVjzWDlt7JU4+kmRc+U4
X-Gm-Gg: AYBFou2k69MUwRpuxlYu8MALcPNBbEUgtciHhwdEjx/Sv7ZOAg7mYIoZX4K6/DZ9Y/E
	07JT1wpVFwNK94/TdGJauz1rOXtwo3tO6+GAra52nE0olesB0Jv3WjJcr3FweAvNzsLgWup+XO2
	THTpsmXPy0icafwe0Q5ZRNRPRH9HMGzqD70+uWGFrA403/s5aHq6PPBJFPawITPq1Zv9BR6dNVD
	MjrNyzuafD4Rwk5Zpmw8cnmN0oxf2Duq7g2Q7pg1Kcf8Ori9DocxGKXZmkVqZ8y863RKfZqB9yH
	3yYUi9WBFYGRNoKFNV54OkHLmIDbJcaEkFn7gTTWT17GQtivpvypODlokcpCm9GCTtLWMYB3YIW
	QPWzvMV7MrJ8NdGRbbn33O0eeaD91OmRnoRLc+U98gRPctXCSGj4VTw1hGWNtNz/H3ZuAmwaZeD
	Kyax4rI2MU764Y8FbBqlBVdVTULYZhI59N9BpQB38br7oy1WZz4wcxUqpX68DZnmqx8FUk/OYNu
	FD/JmQHYTGA8Zx2uRD6Si3G6qIzEHhqZff5bIyh9Pdehc5JVyji7HzLptP4j3CbFlByTnNpqh+T
	8bIvuEEbofDj1W7mEU8QplxBHmJJlnr/XBCpjFWhpRh07oOAFTHkBq2bIuU79Hvc6gbV9VeUriO
	R2dP+8fwhN2UEamgqSinA4qtFLZgbwJJi8iYnOkGWpcyiOOHnCfh2nevX7PveyXAlCMgulTkhIQ
	IKFXtfskiHUZe3fZd37Pqup0toITDhPXCpFtHx
X-Received: by 2002:a17:907:72c3:b0:c49:b90a:988b with SMTP id a640c23a62f3a-c49bdf89bc9mr328062966b.49.1793235491600;
        Wed, 28 Oct 2026 17:58:11 -0700 (PDT)
Received: from localhost.localdomain (249-172-21-31.ftth.glasoperator.nl. [31.21.172.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm668971966b.56.2026.10.28.17.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 17:58:10 -0700 (PDT)
From: Emir Beganovic <beganovic.emir@gmail.com>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Eric Dumazet <edumazet@kernel.org>,
	Jianhui Xu <neuromoments@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH net-next v19 00/13] ax88179_178a: Add support for AX88179A-based chips
Date: Thu, 29 Oct 2026 01:58:09 +0100
Message-ID: <20261029005809.19405-1-beganovic.emir@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
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

Hi Birger,

I tested v19 on a Dell DA305 USB-C adapter. It has an AX88179A
(0b95:1790, bcdDevice 0x0200, FW 1.0.7.131) behind a VIA VL822 hub,
plugged into a Dell XPS 16 (Panther Lake). The peer is an Intel I225-V
behind a switch.

I built ax88179, libphy, phylink and ax88796b as modules for a 7.2.8
kernel. v19 needed two things on that base: a4e22e9253e7 and a backport
of genphy_{read,write}_mmd_c45() from the adin1140 series.

With the current driver in configuration 1 this adapter never gets a
link ("Failed to read reg index 0x0040: -32"). With v19:

- 1000/full link with flow control
- download 940-941 Mbit/s in nine runs. Upload was 937-941 in five of
  nine and lower in the other four, and I couldn't find why. Eight
  later runs with tracing on all averaged about 932.
- 1-byte TCP request/response around 190-200 us, against about 1.46 ms
  with cdc_ncm on the same port (its default 400 us TX timer)
- switching itself to configuration 1 when the device comes up in the
  CDC configuration
- 100M and 10M links
- VLAN with rx-vlan-offload on and off, and rx-vlan-filter dropping a
  VID that isn't configured
- multicast filtering and allmulti
- suspend/resume (s2idle) and wake-on-LAN with a magic packet

Two small things I noticed:

- "Switching to vendor mode" is printed twice, once per CDC interface,
  and before the netdev is registered, so it shows up as
  "(unnamed net_device) (uninitialized)".
- After a WoL wake the link goes down and up twice within about 2.5 s,
  where a normal resume shows a single link up. It comes back fine
  either way.

I only have this one adapter, so nothing on the other chips.

Tested-by: Emir Beganovic <beganovic.emir@gmail.com>

Thanks,
Emir
